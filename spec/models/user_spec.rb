require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    context '正常なデータが与えられた場合' do
      it '正常に登録できる' do
        expect(@user).to be_valid
      end 
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'メールアドレスは＠が含まれないと登録できない' do
      @user.email = 'test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it 'パスワードは空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードは５文字以下では登録できない' do
      @user.password = 'abcd2'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it '英字のみのパスワードでは登録できない' do
      @user.password = 'asxdcf12'
      @user.valid?
      expect(@user.errors.full_messages).not_to include "Password には英字と数字の両方を含めて設定してください"
    end
    it '数字のみのパスワードでは登録できない' do
      @user.password = '123454'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end
    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'ひらがな'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end
    it 'パスワードとパスワード確認は、値が一致しないと登録できない' do
      @user.password_confirmation = 'password_confirmation_value'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end 
    it 'お名前(全角)は、名字を入力しないと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'お名前(全角)は、名前を入力しないと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'お名前カナ(全角)は、名前を入力しないと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it 'お名前カナ(全角)は、名前を入力しないと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name は全角で入力してください"
    end
    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.first_name_kana = 'aiueo'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana は全角カナで入力してください"
    end
    it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.first_name_kana = 'あ亜e:'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana は全角カナで入力してください"
    end
    it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.first_name_kana = 'あ亜e:'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana は全角カナで入力してください"
    end
    it '誕生日が空では登録できない' do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Date of birth can't be blank"
    end
  end
end