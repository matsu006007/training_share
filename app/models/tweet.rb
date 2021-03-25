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
end
