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
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  has_many :tweets
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :training_frequency

end
