class User
  include Mongoid::Document
  include CanCan::Ability
  include Whisper::Renameable
  # Include default devise modules. Others available are:
  # 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :token_authenticatable, :lockable, :timeoutable

  field :first_name
  field :last_name
  field :facebook_id, :type=>Integer

  validates :email, :uniqueness => true
  validates :email, :presence => true
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me

  embeds_many :abilities  
  references_many :projects, :inverse_of => :owner, :foreign_key => :owner_id, :dependent => :destroy
  
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

   def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    # raise access_token.inspect
    if user = User.where(:email => data["email"]).first
      user
    else # Create an user with a stub password. 
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20]) 
    end
  end 
  
  def set_abilities
    can :read, User
    can :edit, User, :id => self.id
    can :manage, Project, :owner_id => self.id
    can :manage, Page do |page|
      can? :manage, page.project
    end
  end
  
  def loading_can?(*args)
    unless !rules.empty?
      set_abilities
    end
    nonloading_can? *args
  end
  alias_method :nonloading_can?, :can?
  alias_method :can?, :loading_can?
  
  def self.guest
    @guest ||= User.new
  end

  def self.find_for_authentication(conditions)
    User.where(:email=>conditions[:email]).first
  end
end

