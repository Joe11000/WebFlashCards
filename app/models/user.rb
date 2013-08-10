# t.string    :name
# t.string    :password_digest
# t.string    :email
class User < ActiveRecord::Base
  has_many  :rounds

  has_many  :decks, through: :rounds
  has_many  :shuffled_decks, through: :rounds

  before_save :password
  validate :email, uniqueness: true
  validate :name, uniqueness: true

  include BCrypt

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_digest = @password
  end

  def self.authenticate(arguments = {} )
    @user = User.find_by_email(arguments[:email])
    if @user && @user.password == arguments[:password]
      return @user
    else
      return nil
    end
  end
end
