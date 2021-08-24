class Report < ApplicationRecord

  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }
  validates :text,  presence: true, length: { minimum: 5 }
  
end
