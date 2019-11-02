require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe "user#showにユーザーの投稿一覧を表示" do

    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com', password: 'password') } 
    let!(:post_a) { FactoryBot.create(:post, title: 'test-title', content: 'test-content', user: user_a) }
    
    describe '投稿フォームに記入' do
      before do
        visit "posts/new"
        fill_in 'タイトル', with: title_name
        fill_in '勉強内容', with: content_name
        click_button "勉強記録を投稿する"
      end
    end

    describe 'users#show' do
      it 'user_a が作成した投稿タイトル、ユーザー名が表示される' do
        visit user_path(id: user_a.id)
        expect(page).to have_content 'ユーザーA'
        expect(page).to have_content 'test-title'
        expect(page).to have_content 'test-material'
      end
    end

    describe 'posts#show' do
      it 'user_a が作成した投稿内容の詳細を表示する' do
        visit post_path(id: post_a.id)
        expect(page).to have_content 'ユーザーA'
        expect(page).to have_content 'test-title'
        expect(page).to have_content 'test-material'
        expect(page).to have_content 'test-content'
      end
    end


  end
end