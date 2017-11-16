class UsersSerializer < ActiveModel::Serializer
  attributes :username
  has_many :instruments
  has_many :ensembles
end
