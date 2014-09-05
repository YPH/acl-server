class Resource
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :user

  has_one :resource_role, as: :resourceable, dependent: :delete

  after_create :create_resource_role

  def create_resource_role
    member_role = Role.where(name: "member").first

    ResourceRole.create(
      user: self.user,
      role: member_role,
      resourceable: self
    )
  end
end
