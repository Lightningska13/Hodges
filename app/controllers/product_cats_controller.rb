class ProductCatsController < ApplicationController
  before_filter :instantiate_categories, :only => [:new, :edit, :create, :update]
  
  def instantiate_categories
  	@page_title = "#{@current_action.titleize} Product Categories"
  end

  # GET /product_cats
  # GET /product_cats.json
  def index
    @product_cats = ProductCat.all
    @page_title = "Product Categories"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @product_cats }
    end
  end

  # GET /product_cats/1
  # GET /product_cats/1.json
  def show
    @product_cat = ProductCat.find(params[:id])
    @showpic = @product_cat.catpic_file_name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @product_cat }
    end
  end

  # GET /product_cats/new
  # GET /product_cats/new.json
  def new
    @product_cat = ProductCat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @product_cat }
    end
  end

  # GET /product_cats/1/edit
  def edit
    @product_cat = ProductCat.find(params[:id])
    @showpic = @product_cat.catpic_file_name
  end

  # POST /product_cats
  # POST /product_cats.json
  def create
    @product_cat = ProductCat.new(params[:product_cat])

    respond_to do |format|
      if @product_cat.save
        format.html { redirect_to @product_cat, :notice => 'Product cat was successfully created.' }
        format.json { render :json => @product_cat, :status => :created, :location => @product_cat }
      else
        format.html { render :action => "new" }
        format.json { render :json => @product_cat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_cats/1
  # PUT /product_cats/1.json
  def update
    @product_cat = ProductCat.find(params[:id])

    respond_to do |format|
      if @product_cat.update_attributes(params[:product_cat])
        format.html { redirect_to @product_cat, :notice => 'Product cat was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @product_cat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_cats/1
  # DELETE /product_cats/1.json
  def destroy
    @product_cat = ProductCat.find(params[:id])
    @product_cat.destroy

    respond_to do |format|
      format.html { redirect_to product_cats_url }
      format.json { head :ok }
    end
  end
end
