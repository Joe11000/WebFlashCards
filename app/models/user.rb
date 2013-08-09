# t.string    :name
# t.string    :password_digest
# t.string    :email
class User < ActiveRecord::Base
  has_many  :rounds                                                                                                                                                              
  has_many  :decks, through: :rounds
  has_many  :guesses, through: :rounds
  
  before_save :password
  validate :email, uniqueness: true

  include BCrypt
  
  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_digest = @password
  end

  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    if @user && @user.password == password
      return @user
    else
      return nil
    end
  end

end
