class Column < ApplicationRecord
  
  belongs_to :admin
  has_many :favorites
  has_many :tags, dependent: :destroy
  # throughについて
  has_many :tag_infomations, through: :tags
  
  attachment :image
  
  
  def save_column(savepost_tags)

    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # savepost_tagsとはなにが廃いているのか
    old_tags = current_tags - savepost_tags
    
    new_tags = savepost_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    new_tags.each do |new_name|
      column_tag = Tag.find_or_create_by(name:new_name)
      # 以下質問<<について
      self.tags << column_tag
    end
  end
end
