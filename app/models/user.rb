class User < ApplicationRecord
  has_secure_password
  
  validates :name, presence: true
  validates :password, length: { minimum: 10, allow_blank: true }
  validates :email, presence: true,
                    format: { with: /\S+@\S+/ },
                    uniqueness: { case_sensitive: false }
end
