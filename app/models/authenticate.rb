class Authenticate
  def self.sign_in(user)
    token = Authenticate.generate_token
    user.update_attributes(token: token)
  end

  def self.sign_out(user)
    user.update_attributes(token: nil)
  end

  private
  def self.generate_token
    loop do
      key = SecureRandom.hex(16)
      break key unless !User.where(token: key).empty?
    end
  end 
end
