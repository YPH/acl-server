class Privilege
  include Mongoid::Document
  field :resource_name   , type: String
  field :action_code     , type: Integer

  belongs_to :role

  def self.action_to_code(action)
    case action.to_s
    when "all"
      return 7
    when "read"
      return 1
    when "write"
      return 2
    when "destroy"
      return 4
    else
      return 0
    end
  end
end
