class Resource < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :posts
  belongs_to :users
end
