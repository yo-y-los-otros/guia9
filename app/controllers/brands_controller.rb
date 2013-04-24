class BrandsController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    @brands = Brand.all
    @brands = Brand.order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brands }
    end
  end

 
  def show
    @brand = Brand.find(params[:id])
  end

 
  def new
    @brand = Brand.new
  end


  def edit
    @brand = Brand.find(params[:id])
  end

 
  def create
    @brand = Brand.new(params[:brand])
    render :action => :new unless @brand.save
  end

 
  def update
    @brand = Brand.find(params[:id])
    render :action => :edit unless @brand.update_attributes(params[:brand])
 end

  
  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
  end

  private
  
  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
