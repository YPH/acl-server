class Role
  include Mongoid::Document

  field :name          , type: String

  has_many :privileges
  #has_and_belongs_to_many :users
end
