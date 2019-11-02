require 'rails_helper'

RSpec.describe Post, type: :model do
  it '正しいpostか判断' do
    post = FactoryBot.build(:post)
    expect(post).to be_valid
  end

  describe 'titleのバリデーション' do
    it 'titleが空欄' do
      post = FactoryBot.build(:post, title: nil)
      expect(post).to be_invalid
    end

    it 'titleが51文字以上' do
      post = FactoryBot.build(:post, title: "a" * 51)
      expect(post).to be_invalid
    end
  end

  describe 'contentのバリデーション' do
    it 'contentが空欄' do
      post = FactoryBot.build(:post, content: nil)
      expect(post).to be_invalid
    end

    it 'contentが51文字以上' do
      post = FactoryBot.build(:post, content: "a" * 301)
      expect(post).to be_invalid
    end
  end

  it 'userが空欄' do
    post = FactoryBot.build(:post, user: nil)
    expect(post).to be_invalid
  end

end
