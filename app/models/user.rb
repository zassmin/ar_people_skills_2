class User < ActiveRecord::Base
  has_many :ratings
  has_many :skills, through: :ratings

  def proficiency_for(skill)
    self.ratings.find_by_skill_id(skill).proficiency
  end

  def set_proficiency_for(skill, rating)
    Rating.create(proficiency: rating, skill: skill, user: self)
  end
end
