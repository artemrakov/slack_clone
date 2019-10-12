class SignIn
  include ActiveModel::Model

  attr_accessor :email, :password

  validates :email, :password, presence: true

  def valid?
    super && user&.authenticate(password)
  end

  def user
    @user ||= User.find_by(email: email)
  end
end
