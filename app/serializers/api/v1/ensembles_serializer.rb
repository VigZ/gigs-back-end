class Api::V1::EnsemblesSerializer < ActiveModel::Serializer
  attributes :name
  has_many :users
end
