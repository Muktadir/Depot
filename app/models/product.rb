class Product < ActiveRecord::Base
  default_scope :order => 'title'
  validates :title, :presence => true, :uniqueness => true
  validates :description, :presence => true

  # validates :image_url, :presence => true, :format => {
  #     :with => %r{\a \.(gif|png|jpg)$}i,
  #     :message => 'Must be a URL for GIF, PNG or JPG file.'
  # }
  validates :price, :presence => true, :numericality => {:greater_than_or_equal_to => 0.01}

end
