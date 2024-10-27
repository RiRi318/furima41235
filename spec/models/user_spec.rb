require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '新規登録できるとき' do
    it 'すべてのバリデーションが通り、保存が成功すること' do
      expect(@user).to be_valid
      expect { @user.save }.to change(User, :count).by(1)
    end
  end

  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailに@が含まれていなければ登録できない' do
      @user.email = 'testexample'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it '既に使用されているemailは登録できない' do
      FactoryBot.create(:user, email: 'test@example.com')
      @user.email = 'test@example.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email has already been taken"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordに小文字英語と数字がなければでは登録できない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers."
    end
    it 'passwordが6文字未満では登録できない' do
      @user.password = '0000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)"
    end
    it '英字のみのパスワードでは登録できない' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers."
    end
    it '数字のみのパスワードでは登録できない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers."
    end
    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'A000000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'passwordが一致していなければ登録できない' do
      @user.password_confirmation = 'b000000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it '誕生日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
    it '名字が空では登録できない' do
      @user.lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Lastname can't be blank"
    end
    it '名字が全角でなければ登録できない' do
      @user.lastname = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include "Lastname is invalid. Input full-width characters."
    end
    it '名前が空では登録できない' do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Firstname can't be blank"
    end
    it '名前が全角でなければ登録できない' do
      @user.firstname = 'def'
      @user.valid?
      expect(@user.errors.full_messages).to include "Firstname is invalid. Input full-width characters."
    end
    it 'カタカナ名字が空では登録できない' do
      @user.katakana_lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Katakana lastname can't be blank"
    end
    it '名字がカタカナでなければ登録できない' do
      @user.katakana_lastname = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Katakana lastname is invalid. Input full-width katakana characters."
    end
    it 'カタカナ名前が空では登録できない' do
      @user.katakana_firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Katakana firstname can't be blank"
    end
    it '名前がカタカナでなければ登録できない' do
      @user.katakana_firstname = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include "Katakana firstname is invalid. Input full-width katakana characters."
    end
  end
end
