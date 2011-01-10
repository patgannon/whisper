class User < Node
  include CanCan::Ability
  # Include default devise modules. Others available are:
  # 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :token_authenticatable, :lockable, :timeoutable, :authentication_keys =>[:email, :domain]

  field :first_name
  field :last_name
  field :company
  field :title
  field :facebook_id, :type=>Integer
  
  canonical_name :alias

  validates :alias, :presence => true
  validates :email, :uniqueness => true
  validates :email, :presence => true
  attr_accessible :alias, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me

  embeds_many :abilities  
  alias_attribute :site, :parent
  
  #  Chained up to :new.
  #  Used to help Devise authentication which can't by default find users embedded in
  #     another object.
  #  The devise call above includes :
  #  Users are embedded in Sites.
  #  The devise call has *:authentication_keys =>[:email, :domain]*
  #  This method will locate user by domain and email, or else just by email
  #  if there's no :domain in in the *fields* hash.
  #
  #  This method will be chained as :new.
  def self.new_with_domain(fields={})
    if fields && fields[:domain]
      domain = fields.delete(:domain)
      Site.find(:first, :conditions=>{:name=>domain}).users.build(fields)
    else
      new_without_domain(fields)
    end
  end
  class << self
    alias_method :new_without_domain, :new
    alias_method :new, :new_with_domain
  end

   def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    raise access_token.inspect
    if user = User.find_by_email(data["email"])
      user
    else # Create an user with a stub password. 
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20]) 
    end
  end 
  
  def set_abilities
    can :read, User
    can :edit, User, :id => self.id
  end
  
  def loading_can?(*args)
    unless @cd_loaded
      set_abilities
    end
    nonloading_can? *args
  end
  alias_method :nonloading_can?, :can?
  alias_method :can?, :loading_can?
  
  def self.guest
    @guest ||= User.new
  end
  
  class Adapter
    def get(key)
      begin
        get! key
      rescue Mongoid::Errors::DocumentNotFound
      end
    end
    
    def get!(key)
      raise "Invalid params" unless key.kind_of?(Array) && key.count
      a = Site.find(key[0]).users.find(key[1])
      raise Mongoid::Errors::DocumentNotFound.new(User, key) unless a
      a
    end
    def find_first(conditions = {})
      domain = conditions.delete(:domain)
      raise ArgumentError.new("Must provide :domain condition to look up Users") unless domain
      site = Site.where(:domain=>domain).first.users.where(conditions).first
    end
  end
  
  def to_key
    [site.id, id]
  end
  
  def self.to_adapter
    Adapter.new
  end
  
  def self.find_for_authentication(conditions)
    Site.where(:name=>conditions[:domain]).first.users.where(:email=>conditions[:email]).first
  end
end

