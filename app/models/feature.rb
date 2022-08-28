class Feature < ApplicationRecord
  belongs_to :project
  validates :project_id, presence: true
  validates :Title, presence: true, length: { maximum: 140 }
  validates :Description, presence: true
  validates :Category, presence: true
end
