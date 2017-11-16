class Ensemble < ApplicationRecord
  has_many :user_ensembles
  has_many :users, through: :user_ensembles
  belongs_to :host, class_name: :User, foreign_key: "host_id"
end
