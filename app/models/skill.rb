class Skill < ActiveRecord::Base
  has_many :ratings
  has_many :users, through: :ratings
  validates_uniqueness_of :name, :context

  def user_with_proficiency(rating)
    self.ratings.find_by_proficiency(rating).user
  end
end
