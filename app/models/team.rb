class Team < ActiveRecord::Base

  has_many :matches

  def toggle_favorite!
    self.favorite = !self.favorite
    save
  end

end
