class ResourceRole
  include Mongoid::Document
  
  belongs_to :user
  belongs_to :role
  belongs_to :resourceable, polymorphic: true
end
