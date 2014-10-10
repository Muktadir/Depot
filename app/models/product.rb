class Product < ActiveRecord::Base
  default_scope :order => 'title'
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items Present')
      return false
    end
  end

  validates :title, :presence => true, :uniqueness => true
  validates :description, :presence => true

  # validates :image_url, :presence => true, :format => {
  #     :with => %r{\a \.(gif|png|jpg)$}i,
  #     :message => 'Must be a URL for GIF, PNG or JPG file.'
  # }
  validates :price, :presence => true, :numericality => {:greater_than_or_equal_to => 0.01}

end
