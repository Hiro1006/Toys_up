class Toy < ApplicationRecord
  has_one_attached:image

  belongs_to :genre
  belongs_to :end_user
  validates :name,presence:true
  validates :caption,presence:true,length:{maximum:200}
end
