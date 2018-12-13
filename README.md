School Grades project
This app allows teachers to manage the students and subjects that they teach.
This app allows students to see their respective assignments and mark them as done.


Prerequisites

The setup steps expect following tools installed on the system:

Github
Ruby 2.3.1
Rails 5.2.1

Installing

1. Check out the repository:
git clone git@github.com:SaraGinsburg/school-grades-project.git

2. Create database.yml file:
Copy the  database.yml file and edit the database configuration as required.
config/database.yml

3. Create and setup the database:
Run the following commands to create and setup the database:
bundle exec rake db:create
bundle exec rake db:setup

4. Start the Rails server:
You can start the rails server using the command given below:
bundle exec rails s
And now you can visit the site with the URL http://localhost:3000

License: 
This project is licensed under the MIT License - see the LICENSE.md file for details
