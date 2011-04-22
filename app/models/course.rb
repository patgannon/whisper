class Course
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  field :cost, :type => Float
  field :published, :type => Boolean
end
