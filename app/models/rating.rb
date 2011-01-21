class Rating
  include Mongoid::Document

  field :rating, :type => Integer
  field :comment
  field :user_id
  embedded_in :business, :inverse_of => :ratings
end
