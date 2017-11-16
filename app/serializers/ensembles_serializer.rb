class EnsemblesSerializer < ActiveModel::Serializer
  attributes :name
  has_many :users
end
