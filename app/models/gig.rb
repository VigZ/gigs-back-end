class Gig < ApplicationRecord
  has_many :user_gigs
  has_many :users, through: :user_gigs

end
