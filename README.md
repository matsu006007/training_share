#  Training Share

## アプリケーション概要

TrainingShareは日々のトレーニングのアウトプットや同じトレーニングに励む方を繋ぐアプリケーションです。  

## 作成の背景

私は今までトレーニングジムやで自宅で筋トレ、ランニングなどのトレーニングを行ってきましたが、継続させることの難しさを感じていました。  
特に開始から1〜3ヶ月ほど経過すると、少しずつ行う頻度が減っていき、最終的に全くやらなくなるというサイクルを何度も経験してきました。  
その中で、なぜ運動を続けることができないのかを考えた時に、「マンネリ化して飽きてしまう」、「トレーニングに関する悩みが解消できない」、「目標がない」という理由なのではないかと思いました。  
そこで、普段のトレーニングを記録し、その記録をシェアして自分と同じようにトレーニングをしている方同士でモチベーションを高め合ったり、わからないことを気軽に質問でき、普段のトレーニングを更に良いものにできるアプリケーションを開発したいと思いTrainingShareを作成しました。

## アプリケーションURL

https://training-share-006007.herokuapp.com/

## テスト用アカウント

ユーザー名: テスト01  
email: test@test.com  
pass: 111aaa

## このアプリケーションで目指した課題解決

###### 1 トレーニングのモチベーション維持

###### 2 トレーニングのマンネリ化防止

###### 3 トレーニングの悩み解消



## 洗い出した要件

### ・トレーニング記録投稿機能
<dl>
  <dt>目的</dt>
  日々のトレーニングの内容や解消したい悩みを投稿してアウトプットできるようにします。
  <dt>詳細</dt>
  投稿一覧に全ユーザーの投稿が表示されます。 
  トレーニング記録詳細ページでコメントやいいね！をもらえます。
  <dt>ストーリー(ユースケース)</dt>
  投稿ページからタイトル、ジャンル、本文、画像（必要であれば添付）を入力して投稿します。  
  投稿すると一覧ページに遷移し、ユーザー名、投稿時間、上記で入力したタイトル、時計型スタンプ（質問or相談を選んだ場合のみ）が一覧で表示されます。  
  気になったタイトルや投稿時間をクリックするとその投稿の詳細ページへ遷移し、内容を見ることができることに合わせて、コメントやいいね！をユーザーからもらうことができます。

  ![toukou](https://user-images.githubusercontent.com/76504047/113498767-de063780-954a-11eb-984a-2114dc44bf14.jpg)  

  ![itirann01](https://user-images.githubusercontent.com/76504047/113499002-2292d280-954d-11eb-80c1-0634f6842f7f.jpg)

</dl>

### コメント機能
<dl>
  <dt>目的</dt>
  投稿の詳細ページから、その投稿に対してコメントすることができます。
  <dt>詳細</dt>
  詳細ページから自由にコメントできるようにします
  <dt>ストーリー(ユースケース)</dt>
  各詳細ページの本文の下にあるコメント入力フォームからコメントを送信します。  
  javascriptを使って、送信ボタンを押すと、非同期でコメント欄に送ったコメントが反映します。  
  送信したコメントは送信者のみ削除することができます。  

  ![comment](https://user-images.githubusercontent.com/76504047/113499109-77831880-954e-11eb-9f78-ffaaf8c82f41.jpg)

</dl>

### いいね!機能
<dl>
  <dt>目的</dt>
  投稿の詳細ページから、その投稿に対してイイね！をすることができます。
  <dt>詳細</dt>
  各詳細ページのイイね！ボタンを押していいねをつけることができるようにします。  
  <dt>ストーリー(ユースケース)</dt>
  詳細ページのいいねボタンをクリックするといいねボタン横の数字が増えていきます。  
  ボタンは1人に対して1度だけ押すことができます。

  <img width="901" alt="iinekinou" src="https://user-images.githubusercontent.com/76504047/113499243-48b97200-954f-11eb-8838-b47a93e57551.png">
</dl>



## 実装予定の機能

##### 1 フォロー機能
ユーザー同士で繋がることができます。マイページからフォローしているユーザーのページに行くことができます。

##### 2 カレンダー機能
カレンダーにトレーニングの予定を入れることができます。また、スタンプとメモを入力できるようにし、トレーニングを行ったか確認できるようにします。  

##### 3 タグ付け機能  
トレーニング記録にタグ付けをして、検索しやすいようにします。


## ペルソナ

性別:  男女どちらも

年齢:  20代前半〜40代前半の社会人


## 使用技術(開発環境)

#### バックエンド

Ruby,Ruby on Rails,Active Hash,Active Storage,Action Cable,S3

#### フロントエンド

HTML,SCSS,JavaScript,jquery,Ajax,bootstrap5,

#### データベース

MySQL,Sequel Pro

#### テスト

RSpec,FactoryBot,Faker

#### ソース管理

GitHub,GitHubDesktop

#### エディタ

VScode




# テーブル一覧

## 各テーブル

### users テーブル

| Column  | Type  | Option |
| ------- | ----- | ------ |
| nickname | string | null: false |
| image    | string |  |
| target  | string |   |
| comment | text   |   |
| prefecture_id | string | null: false  |
| training_frequency | string | null: false  |
| email    | string | null: false |
| password | string | null: false |

#### Association

- has_many :tweets
- has_many :comments
- has_many :likes


### tweets テーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| title  | string | null: false |
| content | text | null: false |
| genre_id | string | null: false |
| user | references | foreign_key: true |

#### Association

- belongs_to :user
- has_many :comments
- has_many :likes



### messages テーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| text   | text | null: false |
| user   | references | foreign_key: true |
| tweet  | references | foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :tweet 

### likes テーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| user   | references | foreign_key: true |
| tweet  | references | foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :tweet