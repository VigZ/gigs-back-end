class Api::V1::UsersSerializer < ActiveModel::Serializer
  attributes :username, :profile_pic, :LFG, :followeds, :followers, :senders, :receivers
  has_many :instruments
  has_many :ensembles

end
