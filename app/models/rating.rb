class Rating
  include Mongoid::Document

  field :rating
  field :comment
  embedded_in :business, :inverse_of => :ratings
end
