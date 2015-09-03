class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    Boat.limit(5)
  end

  def self.dinghy
    Boat.where("length < ?", 20)
  end

  def self.ship
    Boat.where("length >= ?", 20)
  end

  def self.last_three_alphabetically
    Boat.order(name: :desc).limit(3)
  end

  def self.without_a_captain
    Boat.where(captain: nil)
  end

  def self.sailboats
    Boat.joins(:classifications).where('classifications.name' => "Sailboat")
  end

  def self.with_three_classifications
    
  end


end

# 1) Boat::first_five returns the first five Boats
#      Failure/Error: expect(Boat.first_five.pluck(:name)).to eq(boats)
#      NoMethodError:
#        undefined method `first_five' for #<Class:0x007ffb6d550198>
