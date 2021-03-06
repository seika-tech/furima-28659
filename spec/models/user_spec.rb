require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上かつ半角英数混合であれば登録できであれば登録できる" do
        @user.password = "111aaa"
       @user.password_confirmation = "111aaa"
      expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
       expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは@を含んでないと登録できないこと" do
        @user.email = "＠"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "birth_dateが空だと登録できない" do
        @user.birth_date = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it "passwordが英語のみでは登録できないこと" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが数字のみでは登録できないこと" do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが全角では登録できないこと" do
        @user.password = 'AAAAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
