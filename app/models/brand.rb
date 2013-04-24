class Brand < ActiveRecord::Base
  attr_accessible :name
  
  has_many :products

  def funky_method
  	"#{self.name}.camelize"
  end
end

