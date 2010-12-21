class Site < Page
  canonical_name :domain

  references_many :users, :class_name=>"User", :foreign_key => :parent_id, :inverse_of => :parent do
    def <<(*objects)
      super
      objects.each do |c|
        c.parent = @parent
        c.save
      end
    end
  end

end
