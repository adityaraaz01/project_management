class Project < ApplicationRecord
    validates :name, presence: true
    has_many :features, :dependent=> :destroy
end
