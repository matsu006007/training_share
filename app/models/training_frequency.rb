class TrainingFrequency < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '特に決めていない' },
    { id: 3, name: '週に1〜3回' },
    { id: 4, name: '週に4回以上' },
    { id: 5, name: '月に1〜3回' },
    { id: 6, name: '月に4回以上' },
    { id: 7, name: '毎週土or日のどちらか' },
    { id: 8, name: '毎週土日' },
    { id: 9, name: 'ほぼ毎日' }
  ]

  include ActiveHash::Associations
  has_many :users
  end