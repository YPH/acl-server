class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Can
  
  field :username        , type: String
  field :password        , type: String
  field :token           , type: String

  has_many :resource_roles
  has_many :pages
end
