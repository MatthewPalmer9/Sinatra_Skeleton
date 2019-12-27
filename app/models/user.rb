class User < ActiveRecord::Base
  has_secure_password
  # Adds an authentication method to our class User.
  # This is an ActiveRecord macro. Works in conjunction with the 'bcrypt' gem in
  # order to give us the ability to store encrypted passwords within the database.

  # How User's authenticate method works. It:
  # Takes a String as an argument e.g. i_luv@byron_poodle_darling
  # It turns the String into a salted, hashed version (76776516e058d2bf187213df6917a7e)
  # It compares this salted, hashed version with the user's stored salted, hashed password in the database
  # If the two versions match, authenticate will return the User instance; if not, it returns false

  # see the post "/login" route example in app/controllers/application_controller.rb
end
