class Expense < ActiveRecord::Base
  attr_accessible :name, :amount

  validates :name, :presence => true, :length => { in: 3..128 }
  validates :amount, :presence => true, 
    :format => { :with => /^\d+??(?:\.\d{0,2})?$/, :message => 'must be valid price' }, 
    :numericality => { :greater_than => 0, :decimal => true}
end