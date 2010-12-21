class Node
  include Mongoid::Document
  include Mongoid::Tree
  include Mongoid::Timestamps
  include Mongoid::Tree::Ordering
  include Whisper::Renameable
 
  field :path_fragment, :type => String
  field :name, :type => String
  field :title, :type => String
 
  validates :name, :presence => true
  validates :path_fragment, :presence => true
  before_validation :set_path_fragment
  
  validates_with NodeNameValidator
 
  # The main method for looking up a node in the directory.
  # Called with a "complete ID" of a node, meaning a list of IDs starting 
  # with descendants of the root.
  #
  #   Node.seek     #  Called with no args will return the root node.
  #   Node.seek('welcome', 'republican-party')  #  etc.
  #
  # returns nil for non-existant keys.
  def seek(*args)
    node = self
    args.each{|arg| break unless node ; node = node.child_named(arg)}
    return node
  end
  # 
  # Finds a child of this node with path_fragment equal to str.
  # 
  def child_named(str)
    begin
      children.select{|t| t.path_fragment.match(Regexp.like(str))}.first
    rescue Mongoid::Errors::DocumentNotFound
    end
  end
  
  def set_path_fragment
    self.path_fragment ||= name.identify
  end
  
  def url
    "#{parent.url}/#{path_fragment}" if parent
  end
#  I don't know if this is being called anywhere.  
#  def url_fragments_as_server_params
#    if url == '/'
#      return {:id=>'root'}
#    else
#      frags = url.split("/").shift
#      a = {:id=>frags[0]}
#      (1..9).each{|t| a["id#{i}".to_sym] = frags[i] if frags[i]}
#      return a
#    end
#  end
end


