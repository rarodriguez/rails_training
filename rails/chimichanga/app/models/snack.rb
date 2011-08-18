class Snack < ActiveRecord::Base
  validates_presence_of :name, :message=>' tiene que tener algo'
  validates_presence_of :price, :ingredients
  
  validates_numericality_of :price, :only_integer => true
  
  attr_accessor :date
  # party_id
  #belongs_to :party
end
