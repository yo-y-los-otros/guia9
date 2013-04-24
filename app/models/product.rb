class Product < ActiveRecord::Base
  belongs_to :brand
  attr_accessible :brand_name ,:name

  belongs_to :brand

  def brand_name
      brand.name if brand
  end

  def brand_name=(name)
    self.brand = Brand.find_or_create_by_name(name) unless name.blank?      
  end
  
end
