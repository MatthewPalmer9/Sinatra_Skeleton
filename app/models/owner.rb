class Owner < ActiveRecord::Base
  # an owner can have many cats
  # think of this as multiple cats in the :cats table having the same :owner_id
  has_many :cats
end
