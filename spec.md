Specifications for the Rails Assessment
Specs:

 ✔︎ Using Ruby on Rails for the project
 ✔︎  Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
      User has_many :subjects
 ✔︎  Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
      Subject belongs_to :user      
 ✔︎  Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
      User has_many :assignments, through: :subjects
      Subject has_many :students, through: :students_subjects
 ✔︎  Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
      Student has_many :assignments, through: :students_assignments
      Assignment has_many :students, through: :students_assignments
 ✔︎  The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
     create_table "students_assignments", force: :cascade do |t|
       t.integer "student_id"
       t.integer "assignment_id"
       t.integer "grade"
       t.boolean "done"
       t.datetime "created_at", null: false
       t.datetime "updated_at", null: false
     end
 ✔︎  Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
      model objects with validations:
      Assignment, Student, StudentsAssignment, Subject, User
 ✔︎  Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
      class Student < ApplicationRecord
      ...
      scope :excellent_citizenship, -> { where('citizenship_grade > ?', 89)}
      ...
      @excelling_students = @user.students.excellent_citizenship.uniq
      render file: '../views/students/excelling_students.html.erb'
      ...
      http://localhost:3000/excelling.2

 ✔︎ Include signup (how e.g. Devise)
      http://localhost:3000/users/new
 ✔︎  Include login (how e.g. Devise)
      http://localhost:3000/login
 ✔︎ Include logout (how e.g. Devise)
      signout GET    /signout(.:format)     sessions#destroy
 ✔︎  Include third party signup/login (how e.g. Devise/OmniAuth)
      auth_google_oauth2_callback GET    /auth/google_oauth2/callback(.:format)       sessions#create
 ✔︎  Include nested resource show or index (URL e.g. users/2/recipes)
      students/2/subjects
 ✔︎  Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
      subjects/2/assignments/new
 ✔︎  Include form display of validation errors (form URL e.g. /recipes/new)
      http://localhost:3000/users
      1 error prohibited this user from being saved:
      Password can't be blank
Confirm:

 ✔︎  The application is pretty DRY
 ✔︎  Limited logic in controllers
 ✔︎  Views use helper methods if appropriate
 ✔︎  Views use partials if appropriate
