class Api::V1::InstrumentsSerializer < ActiveModel::Serializer
  attributes :name
  has_many :users
  belongs_to :family
end
