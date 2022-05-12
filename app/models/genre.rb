class Genre < ApplicationRecord
  has_many :toys, dependent: :destroy
  validates :name, {presence: true}
end