class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ウォーキング' },
    { id: 3, name: 'ランニング' },
    { id: 4, name: 'サイクリング' },
    { id: 5, name: '水泳' },
    { id: 6, name: 'ウェイトトレーニング' },
    { id: 7, name: '自重トレーニング' },
    { id: 8, name: 'エアロビクス' },
    { id: 9, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tweets
  end