require 'rails_helper'

RSpec.describe 'Users_signup', type: :system do

  describe 'Userの新規登録テスト' do

    before { visit signup_path }
    let(:submit) { "アカウント作成" }

    describe 'Userに正しくない情報が入力される' do
      it 'Userが作成されない' do
        expect { click_button submit }.not_to change(User, :count)
        expect(page).to have_content("can't be blank")
      end
    end

    describe "Userに正しい情報が入力される" do
      before do
        fill_in 'ユーザー名',         with: 'valid User'
        fill_in 'メールアドレス',        with: 'valid@example.com'
        fill_in 'パスワード',     with: 'password'
        fill_in 'パスワード（確認）', with: 'password'
      end

      it "Userが作成される" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end

  end

end