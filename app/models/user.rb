# t.string    :name
# t.string    :password_digest
# t.string    :email
class User < ActiveRecord::Base
  has_many  :rounds                                                                                                                                                              
  has_many  :decks, through: :rounds
  has_many  :shuffled_decks, through: :rounds
end
