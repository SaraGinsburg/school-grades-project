class Subject < ApplicationRecord
  has_many :works
  has_many :users, through: :works
end
