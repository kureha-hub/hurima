class Tweet < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    has_many :comments, dependent: :destroy
    
    #tweetsテーブルから中間テーブルに対する関連付け
    has_many :tweet_tag_relations, dependent: :destroy
    #tweetsテーブルから中間テーブルを介してTagsテーブルへの関連付け
    has_many :tags, through: :tweet_tag_relations, dependent: :destroy

    has_one :order

    validates :product_name, presence: true, length: { maximum: 100 }
    validates :university, presence: true, length: { maximum: 100 }
    validates :lecture, presence: true, length: { maximum: 100 }
    validates :body, presence: true, length: { maximum: 1000 }

end
