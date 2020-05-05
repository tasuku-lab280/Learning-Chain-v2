class Post < ApplicationRecord
  # モジュール
  extend Enumerize
  enumerize :tag, in: %w(programming university qualification english reading), predicates: { prefix: true }


  # 関連
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_one_attached :image


  # 委譲
  def user_name; user.name; end

  default_scope -> { order(created_at: :desc) }


  # バリデーション
  validates :user_id,           presence: true
  validates :title,             presence: true, 
                                length: { maximum: 50 }
  validates :material,          length: { maximum: 30, allow_blank: true }
  validates :content,           presence: true, 
                                length: { maximum: 300 }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
  #title以外は検索できないようにする
  def self.ransackable_attributes(auth_object = nil)
    %w[title]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end