class ProductCat < ActiveRecord::Base
  has_attached_file :catpic, :styles => { :tiny => "25x25#", :small => "72x72#", :medium => "98x116>", :large => "300x300>"}
  has_many :products
  validates_presence_of :cat_name
end
