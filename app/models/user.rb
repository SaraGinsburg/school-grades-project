class User < ApplicationRecord
  has_secure_password
  
  has_many :works
  has_many :subjects, through: :works
end
