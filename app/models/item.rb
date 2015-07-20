class Item < ActiveRecord::Base
  attr_accessor :img
  has_attached_file :img,
                    styles: {large: "500*500>" },
                    default_url: "/images/:style/missing.png",
                    :path => ":rails_root/public/images/item/:id.:extension",
                    :url  => "/images/item/:id.:extension"

  validates_attachment_content_type :img, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def self.find_all_lunch()
    self.where("item_type"=>1)
  end

  def self.find_all_dinner()
    self.where("item_type"=>2)
  end
end
