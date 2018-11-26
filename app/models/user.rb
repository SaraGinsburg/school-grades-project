class User < ApplicationRecord
  has_secure_password

  scope :administrator, -> { where(admin: true)}
  
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :password, presence: true

  has_many :subjects
  has_many :assignments, through: :subjects
  has_many :students, through: :subjects

end
# create_table "users", force: :cascade do |t|
#   t.string "name"
#   t.boolean "admin"
#   t.string "password_digest"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.string "first_name"
#   t.string "last_name"
#   t.string "email"
#   t.string "uid"
#   t.string "image"
# end
