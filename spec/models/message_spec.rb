require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe "メッセージ投稿" do
    context "メッセージ投稿ができるとき" do
      it "textが入力されれば投稿できる" do
        expect(@message).to be_valid
      end
    end
    context "メッセージ投稿ができないとき" do
      it "textが空では投稿できない" do
        @message.text = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("メッセージ を入力してください。")
      end
      it "ユーザーが紐付いていなければ投稿できない" do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("ユーザー が紐付いていません。")
      end
      it "ツイートが紐付いていなければ投稿できない" do
        @message.tweet = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("トレーニング記録 が紐付いていません。")
      end
    end
  end
end
