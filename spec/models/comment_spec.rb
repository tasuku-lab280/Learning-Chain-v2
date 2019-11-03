require 'rails_helper'

RSpec.describe Comment, type: :model do
  it '正しいcommentか判断' do
    comment = FactoryBot.build(:comment)
    expect(comment).to be_valid
  end

  it 'bodyが空欄' do
    comment = FactoryBot.build(:comment, body: nil)
    expect(comment).to be_invalid
  end

  it 'userが空欄' do
    comment = FactoryBot.build(:comment, user: nil)
    expect(comment).to be_invalid
  end

  it 'postが空欄' do
    comment = FactoryBot.build(:comment, post: nil)
    expect(comment).to be_invalid
  end
end
