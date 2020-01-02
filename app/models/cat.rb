class Cat < ActiveRecord::Base
  # belongs_to associations MUST use a singular term.
  # If you tried to use a pluralized form, you would be told that there was an
  # "uninitialized constant Book::Authors". This is because Sinatra/ActiveRecord
  # automatically infers the class name from the association name. If the
  # association name is wrongly pluralized, then the inferred class will be wrongly pluralized too.
  # ( :owners would look for an instance of the class Owners instead of Owner )
  belongs_to :owner
end
