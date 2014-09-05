module Can
  extend ActiveSupport::Concern

  included do
    def can(action, resource)
      # Admin has all the privileges. Return true and skip privilege check.
      admin_role = Role.where(name: "admin").first
      return true if admin_role && !ResourceRole.where(user: self, role: admin_role).empty?
   
      role = ResourceRole.where(user: self, resourceable: resource).first.try(:role)
      return false if !self || !role

      action_code = Privilege.where(
        role: role,
        resource_name: resource.class.to_s
      ).first.try(:action_code)

      return action_code >= Privilege.action_to_code(action) #action_code & Privilege.action_to_code(action) > 0
    end

    #return the permission of a resource
    def permission_on(resource)
      # Admin has all the privileges. 7 gives all the privileges
      admin_role = Role.where(name: "admin").first
      return 7 if admin_role && !ResourceRole.where(user: self, role: admin_role).empty?

      role = ResourceRole.where(user: self, resourceable: resource).first.try(:role)
      return 0 if !self || !role

      privilege = Privilege.where(
        role: role,
        resource_name: resource.class.to_s
      ).first

      if privilege
        return privilege.action_code
      else
        return 0
      end
    end
  end

  module ClassMethods
  end
end
