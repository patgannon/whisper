class Business
  include Mongoid::Document

  embeds_many :ratings
end
