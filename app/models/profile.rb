class Profile < ActiveRecord::Base
  belongs_to :user
  validates :user_name, presence: true, length: { minimum: 2 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  validates :location, presence: true
  #validates :intro, presence: true
  #validates :interest, presence: true
  validates :avatar, attachment_presence: true
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  GENDERS =	['Male','Female']

end
