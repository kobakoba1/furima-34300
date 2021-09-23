require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録出来る時' do
      
      it 'nicknameとemail、passwordとpassword_confirmationとfirst_nameとlast_nameとfurigana_first_nameとfurigana_last_nameとbirthdayが存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録出来ない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'aaaaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end  

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'パスワードは、確認用を含めて2回入力すること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end  

      it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
        @user.password_confirmation = 'password_confirmation'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'あ123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end  
      
      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name には全角文字を使用してください")
      end

      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name には全角文字を使用してください")
      end  
      
      it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること' do
        @user.furigana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana first name can't be blank")
      end

      it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること' do
        @user.furigana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana last name can't be blank")
      end  
      
      it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.furigana_first_name = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana first name には全角文字を使用してください")
      end

      it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.furigana_last_name = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana last name には全角文字を使用してください")
      end  
      
      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end  
  end
end