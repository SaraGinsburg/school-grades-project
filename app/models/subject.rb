class Subject < ApplicationRecord
  has_many :assignments
  has_many :users, through: :assignments
end
