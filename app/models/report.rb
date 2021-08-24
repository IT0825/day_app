class Report < ApplicationRecord

  validates :title, presence: true, length: { maximum: 30 }
  validates :text,  presence: true, length: { minimum: 5 }
  
end
