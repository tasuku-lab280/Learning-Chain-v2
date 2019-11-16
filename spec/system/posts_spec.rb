require 'rails_helper'

RSpec.describe 'Posts', type: :system do

  it "ユーザーは新しい投稿を作成する" do
    user = FactoryBot.create(:user, name: "test",
                                   email: "testing@example.com", 
                                   password: "password", 
                                   password_confirmation: "password")

    visit root_path
    click_link "ログイン"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "ログイン"

    expect {
      click_link "勉強記録を投稿する"
      fill_in 'タイトル', with: "30分勉強したよー！"
      fill_in '教材', with: "Railsチュートリアル"
      fill_in '勉強内容', with: "Rspecの書き方を勉強した！"
      click_button "勉強記録を投稿する"

      expect(page).to have_content "勉強記録が投稿されました！"
      expect(page).to have_content "30分勉強したよー！"
      expect(page).to have_content "Railsチュートリアル"
      expect(page).to have_content "#{user.name}"
    }.to change(user.posts, :count).by(1)
  end
end


