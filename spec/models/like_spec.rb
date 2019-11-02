require 'rails_helper'

RSpec.describe Like, type: :model do

  it '正しいlikeか判断' do
    like = FactoryBot.build(:like)
    expect(like).to be_valid
  end
  
  it 'userが空欄' do
    like = FactoryBot.build(:like, user: nil)
    expect(like).to be_invalid
  end

  it 'postが空欄' do
    like = FactoryBot.build(:like, post: nil)
    expect(like).to be_invalid
  end

end
