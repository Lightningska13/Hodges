class ProductsController < ApplicationController
	# collection_select bombs if validations run unless we define 
	# @departments here. Doesn't work in New and Edit when validations run
	# put it here instead of in the view (where it works also with validations)
	# This is the same as including the @departments in each of the listed actions
  before_filter :instantiate_categories, :except => [:delete]
  
  def instantiate_categories
  	@product_cats = ProductCat.all
  	@page_title = "Product Listing"
  end
  # GET /products
  # GET /products.json
  def index
      if admin?
      	@cursor_style = 'cursor:move;' # show drag cursor on sortable list
      end
      
    if params[:cat]
      @product_cat = ProductCat.find(params[:cat])
      @products = Product.where('product_cat_id = ?', params[:cat]).order(:name).page(params[:page]).per(12)
      @title_text = @product_cat.cat_name + " Listing"  
    elsif params[:search] and (params[:search] != "")
  	  	@products = Product.search(params[:search]).page(params[:page]).per(12)
  	    @title_text='Search Results'
    	  @blurb= (@products.size == 1 ? "There is 1 result." : "There are #{@products.size} results.")
   		else
      @products = Product.order(:name).page(params[:page]).per(12)
      @page_header = "All Products"
      @title_text = "Browse Our Store" 
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @products }
    end
  end
  
  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @showpic = @product.pic_file_name
    @showpic2 = @product.pic2_file_name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @showpic = @product.pic_file_name
    @showpic2 = @product.pic2_file_name
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, :notice => 'Product was successfully created.' }
        format.json { render :json => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    if params[:delete_image]
    	@product.pic=nil
    end

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, :notice => 'Product was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :ok }
    end
  end
end
