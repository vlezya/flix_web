class User < ApplicationRecord
  has_secure_password
  
  has_many :reviews, dependent: :destroy
  
  validates :name, presence: true
  validates :password, length: { minimum: 10, allow_blank: true }
  validates :email, presence: true,
                    format: { with: /\S+@\S+/ },
                    uniqueness: { case_sensitive: false }
end
