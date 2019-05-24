class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :text, :image, presence: true
end
