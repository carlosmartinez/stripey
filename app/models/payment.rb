class Payment < ActiveRecord::Base
  belongs_to :line_item
end
