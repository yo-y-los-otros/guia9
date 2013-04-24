class ProductsController < ApplicationController
  
  helper_method :sort_column, :sort_direction
  autocomplete :brand, :name, :full => true

  def index
    @products = Product.all
    @products = Product.order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  
  def show
    @product = Product.find(params[:id])
  end

 
  def new
    @product = Product.new
  end

  
  def edit
    @product = Product.find(params[:id])
  end

  
  def create
    @product = Product.new(params[:product])
    render :action => :new unless @product.save
  end

 
  def update
    @product = Product.find(params[:id])
    render :action => :edit unless @product.update_attributes(params[:product])
  end

  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end
  
  private 
  def sort_column
    Product.column_names.include?([:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end