class Profile < ActiveRecord::Base
  belongs_to :user

  validate :first_name_or_last_name_present
  validate :male_not_named_sue
  validates :gender, inclusion: { 
    in: %w(male female),
    message: "%{value} is not a valid gender" 
  }

  scope :get_all_profiles, -> (min_year, max_year){
    where("birth_year between ? and ?", min_year, max_year).
      order(:birth_year)
  }

  def first_name_or_last_name_present
    if first_name.nil? and last_name.nil?
      msg = 'either first_name or last_name must be present'
      errors.add(:first_name, msg)
      errors.add(:last_name, msg)
    end
  end

  def male_not_named_sue
    if gender == 'male' && first_name == 'Sue'
      msg = "a male cannot be named #{first_name}"
      errors.add(:first_name, msg)
      errors.add(:gender, msg)
    end
  end

end
