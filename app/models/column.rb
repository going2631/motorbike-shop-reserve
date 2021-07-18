class Column < ApplicationRecord
  
  belongs_to :admin
  has_many :tags, dependent: :destroy
  has_many :tag_infomations, through: :tags
  
  attachment :image
  
  has_many :favorites, dependent: :destroy
  
  validates :admin_id, presence: true
  validates :image, presence: true
  validates :title, presence: true
  validates :text, presence: true
  

  # いいね機能用コード
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
  
  # 検索機能用コード
  def self.search(keyword)
    where(["title like? OR text like?", "%#{keyword}%", "%#{keyword}%"])
  end
  
  # タグ作成用コード
  def save_column(savepost_tags)
    
    # タグ入力欄への記入有無での条件分岐現在view上で入力されているタグを取得
    current_tags = if self.tags.any?
                     self.tags.pluck(:name)
                   else
                     []
                   end
    # 過去に保存したタグの抽出
    old_tags = current_tags - savepost_tags
    # 過去に保存されていないタグの抽出
    new_tags = savepost_tags - current_tags
    
    # 過去に保存したタグの削除用コード
    old_tags.each do |old_name|
      self.tag_infomations.delete TagInfomation.find_by(name: old_name)
    end
    
    # 過去に保存されていないタグの保存用コード
    new_tags.each do |new_name|
      column_tag = TagInfomation.find_or_create_by(name: new_name)
      self.tag_infomations << column_tag
    end
  end
end
