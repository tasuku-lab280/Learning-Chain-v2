require 'rails_helper'

RSpec.describe User, type: :model do
  it '正しいuserか判断' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  describe 'nameのバリデーション' do
    it 'nameが空欄' do
      user = FactoryBot.build(:user, name: nil)
      expect(user).to be_invalid
    end

    it 'nameが31文字以上' do
      user = FactoryBot.build(:user, name: "a" * 31)
      expect(user).to be_invalid
    end
  end

  describe 'emailのバリデーション' do
    it 'emailが空欄' do
      user = FactoryBot.build(:user, email: nil)
      expect(user).to be_invalid
    end

    it 'emailが256文字以上' do
      user = FactoryBot.build(:user, email: "a" * 244 + "@example.com")
      expect(user).to be_invalid
    end

    it 'emailが重複' do
      FactoryBot.create(:user, email: 'duplicate@email.com')
      user = FactoryBot.build(:user, email: 'duplicate@email.com')
      expect(user).to be_invalid
    end

    it "emailのフォーマットが正しくない" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      addresses.each do |invalid_address|
        expect(FactoryBot.build(:user, email: invalid_address)).to be_invalid
      end
    end

    it "emailを小文字に変換後の値と大文字を混ぜて登録されたアドレスが同じか" do
      user = FactoryBot.build(:user, email: "Foo@ExAMPle.CoM")
      user.save!
      expect(user.reload.email).to eq "foo@example.com"
    end
  end
  
  describe 'passwordのバリデーション' do
    it 'passwordが空欄' do 
      user = FactoryBot.build(:user, password: nil)
      expect(user).to be_invalid
    end

    it 'passwordが6文字未満' do
      user = FactoryBot.build(:user, password: 'test')
      expect(user).to be_invalid
    end
  end

end
