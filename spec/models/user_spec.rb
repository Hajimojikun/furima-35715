require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context 'ユーザー登録ができるとき' do
        it 'ユーザー登録ができる' do 
          expect(@user).to be_valid
        end
        it 'パスワード６文字以上なら登録できる ' do
          @user.password = "12345a"
          @user.password_confirmation = "12345a"
          @user.valid?
          expect(@user).to be_valid
        end
        it 'パスワードにアルファベットと数字を組み合わせて使うと登録できる  ' do
          @user.password = "aaa123"
          @user.password_confirmation = "aaa123"
          @user.valid?
          expect(@user).to be_valid
        end
        it '名字（カナ）欄でカタカナなら登録できる ' do
          @user.last_name_kana = "ホンダ"
          expect(@user).to be_valid
        end
        it '名前（カナ）欄でカタカナなら登録できる ' do
          @user.last_name_kana = "タモツ"
          expect(@user).to be_valid
        end
    end
    context 'ユーザー登録ができない' do
        it 'nicknameが空だと登録できない' do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("ニックネームを入力してください")
        end

        it 'メールアドレスが空だと登録できない' do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールを入力してください")
        end
        
        it '既存のメールアドレスでは登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
        end
        
        it 'メールアドレスに＠が無いと登録できない ' do
          @user.email = "aaaaaaaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールは不正な値です")
        end
        
        it 'パスワードが空だと登録できない ' do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードを入力してください")
        end
        
        it 'パスワードが５文字以下では登録できない ' do
          @user.password = "1234a"
          @user.password_confirmation = "1234a"
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
        end
        
        it 'パスワードは数字だけでは登録できない ' do
          @user.password = "111111"
          @user.password_confirmation = "111111"
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードが正しくありません")
        end
        
        it 'パスワードはアルファベットだけでは登録できない  ' do
          @user.password = "aaaaaa"
          @user.password_confirmation = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードが正しくありません")
        end
        
        it 'パスワードとパスワード確認が一致してないと登録できない ' do
          @user.password = "aaa123"
          @user.password_confirmation = "aaa456"
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end
        
        it '名字が空だと登録できない ' do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("名字を入力してください", "名字を正しく入力してください")
        end

        it '名字が英語では登録できない ' do
          @user.last_name = "Alex"
          @user.valid?
          expect(@user.errors.full_messages).to include("名字を正しく入力してください")
        end

        it '名前が空だと登録できない ' do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("名前を入力してください", "名前を正しく入力してください")
        end

        it '名前が英語では登録できない ' do
          @user.first_name = "Mike"
          @user.valid?
          expect(@user.errors.full_messages).to include("名前を正しく入力してください")
        end

        it '名字（カナ）欄が空では登録できない ' do
          @user.last_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("名字（カナ）を入力してください", "名字（カナ）を正しく入力してください")
        end

        it '名字（カナ）欄ではカナ以外の登録ができない ' do
          @user.last_name_kana = "本田"
          @user.valid?
          expect(@user.errors.full_messages).to include("名字（カナ）を正しく入力してください")
        end

        it '名字（カナ）欄では半角文字だと登録できないこと' do
          @user.last_name_kana = "ﾎﾝﾀﾞ"
          @user.valid?
          expect(@user.errors.full_messages).to include("名字（カナ）を正しく入力してください")
        end
        
        it '名前（カナ）欄が空では登録できない ' do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("名前（カナ）を入力してください", "名前（カナ）を正しく入力してください")
        end

        it '名前（カナ）欄ではカナ以外の登録ができない ' do
          @user.first_name_kana = "たもつ"
          @user.valid?
          expect(@user.errors.full_messages).to include("名前（カナ）を正しく入力してください")
        end

        it '名前（カナ）欄では半角文字だと登録できないこと' do
          @user.first_name_kana = "ﾀﾓﾂ"
          @user.valid?
          expect(@user.errors.full_messages).to include("名前（カナ）を正しく入力してください")
        end

        it '生年月日が空と登録できない ' do
          @user.birth_day = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("誕生日を入力してください")
        end
      end
  end
end
