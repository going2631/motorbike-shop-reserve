class Column < ApplicationRecord
  
  belongs_to :admin
  has_many :tags, dependent: :destroy
  # throughについて
  has_many :tag_infomations, through: :tags
  
  attachment :image
  
  has_many :favorites, dependent: :destroy

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
  
  
  def save_column(savepost_tags)

    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # savepost_tagsとはなにが廃いているのか
    old_tags = current_tags - savepost_tags
    
    new_tags = savepost_tags - current_tags

    old_tags.each do |old_name|
      self.tag_infomations.delete TagInfomation.find_by(name: old_name)
    end

    new_tags.each do |new_name|
      column_tag = TagInfomation.find_or_create_by(name: new_name)
      # 以下質問<<について
      self.tag_infomations << column_tag
    end
  end
end