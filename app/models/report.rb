class Report < ApplicationRecord

  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }
  validates :text,  presence: true, length: { minimum: 5 }

  def self.ransackable_attributes(auth_object = nil)
    %w[title created_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
  
end
