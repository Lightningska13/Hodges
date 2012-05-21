class StoreController < ApplicationController
  def index
    @page_title= "Store"
    @product_cats= ProductCat.all
  end
end
