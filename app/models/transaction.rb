class Transaction < ActiveRecord::Base
  attr_accessible :address, :cardnum, :dateofexpire, :name
end
