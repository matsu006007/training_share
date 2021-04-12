require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
    @tweet.image = fixture_file_upload("/files/test.png")
  end

  describe "ツイート投稿" do
    context "ツイート投稿ができるとき" do
      it "全ての項目を適切に入力すると投稿できる" do
        expect(@tweet).to be_valid
      end
      it "画像が無くても投稿できる" do
        @tweet.image = nil
        expect(@tweet).to be_valid
      end
    end
    context "ツイート投稿ができないとき" do
      it "titleが空では投稿できない" do
        @tweet.title = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("タイトル が入力されていません。")
      end
      it "contentが空では投稿できない" do
        @tweet.content = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("内容 が入力されていません。")
      end
      it "genre_idが1では投稿できない" do
        @tweet.genre_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("ジャンル を選択してください。")
      end
      it "ユーザーが紐付いていなければ投稿できない" do
        @tweet.user =nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("ユーザー が紐付いていません。")
      end
    end
  end
end
