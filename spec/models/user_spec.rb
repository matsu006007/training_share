require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "ユーザー新規登録ができるとき" do
      it "全ての情報を適切に入力すると登録できる" do
        expect(@user).to be_valid
      end
      it "imageが空でも登録できる" do
        @user.image = nil
        expect(@user).to be_valid
      end
      it "targetが空でも登録できる" do
        @user.target = nil
        expect(@user).to be_valid
      end
      it "commentが空でも登録できる" do
        @user.comment = nil
        expect(@user).to be_valid
      end
    end
  
    context "ユーザー新規登録ができないとき" do
      it "nicknameが空では登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネーム が入力されていません。")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメール が入力されていません。")
      end
      it "emailに＠が含まれていなければ登録できない" do
        @user.email = "test.test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメール が使用できません。")
      end
      it "emailが既に存在すると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメール は既に使用されています。")
      end
      it "passwordとpassword_confirmationが空では登録できない" do
        @user.password = nil
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード が入力されていません。")
      end
      it "passwordが6文字以下では登録できない" do
        @user.password = 11111
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード は6文字以上入力してください")
      end
      it "passwordを入力してもpassword_confirmationが入力されていなければ登録できない" do
        @user.password = 111111
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用） が入力されていません。")
      end
      it "prefecture_idが1では登録できない" do
        @user.prefecture_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("お住まいの都道府県 を選んでください")
      end
      it "training_frequencyが1では登録できない" do
        @user.training_frequency_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("トレーニングの頻度 を選んでください")
      end
    end
  end
end
