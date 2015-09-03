class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    Captain.joins(:boats :boat_classifications :classifications).where('classifications.name' => 'Catamaran')
  end

end
