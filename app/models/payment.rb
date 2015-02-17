class Payment < ActiveRecord::Base
  belongs_to :line_item

  def amount
  	line_item.cost * 0.75
  end
end
