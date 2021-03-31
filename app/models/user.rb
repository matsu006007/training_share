class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    with_options presence: true do
      validates :nickname
      with_options numericality: { other_than: 1 } do
        validates :prefecture_id
        validates :training_frequency_id
      end
    end
  
  has_many :tweets
  has_many :likes
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :training_frequency

  mount_uploader :image, AvaterUploader

  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end

end
