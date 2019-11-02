class Post < ApplicationRecord
  belongs_to :user
  belongs_to :clock, optional: true
  has_many :comments, dependent: :destroy
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_one_attached :image

  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
  validates :title, presence: true, length: { maximum: 50 }

  def liked_by?(user)
   	likes.where(user_id: user.id).exists?
  end
  
  def self.search(search) 
    if search
      where(['title LIKE ?', "%#{search}%"]) 
    else
      all 
    end
  end

end