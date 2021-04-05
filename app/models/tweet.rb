class Tweet < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :content
    validates :genre_id, numericality: { other_than: 1 }
    validates :user
  end

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one_attached :image
  has_many :likes
  has_many :messages, dependent: :destroy
end
