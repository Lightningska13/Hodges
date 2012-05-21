class Product < ActiveRecord::Base
  belongs_to :product_cat
  has_attached_file :pic, :styles => { :tiny => "25x25#", :small => "72x72#", :medium => "150x150#", :large => "400>x400"}
  has_attached_file :pic2, :styles => { :tiny => "25x25#", :small => "72x72#", :medium => "150x150#", :large => "400>x400"}
  validates_presence_of :name
  
  def	self.find_for_home(product_type,order)
   	if product_type
   		this_condition = " AND product_type='#{product_type}'"
   		unless product_type == 'Product' #for News and Bulletins
   			this_condition= "AND start_date<='#{Date.today}' " + this_condition
   		end
   	end
   	#find(:all, :limit=>6, :order=>'start_date '+ order, :conditions=>"end_date >= '#{Date.today}' #{this_condition}" )
   	where("end_date >= '#{Date.today}' #{this_condition}").order('start_date '+ order).limit(6)
   end

  	def self.search(search)
  		if search
  			search = search.to_s.downcase
   			where(['lower(name) LIKE ? OR lower(description) LIKE ?', "%#{search}%", "%#{search}%"]).order('name ASC')
     end
  	end
end
