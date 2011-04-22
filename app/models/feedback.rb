class Feedback
  include Mongoid::Document
  field :email, :type => String
  field :subject, :type => String
  field :message, :type => String
end
