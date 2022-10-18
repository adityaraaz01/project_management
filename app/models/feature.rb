class Feature < ApplicationRecord
  before_validation :set_token_id
  belongs_to :project
  has_many :tasks, dependent: :destroy
  has_many_attached :documents
  validates :project_id, presence: true
  validates :Title, presence: true, length: { maximum: 140 }
  validates :Description, presence: true
  validates :Category, presence: true
  validates :token_id, uniqueness: true
  validate :validate_document_filetypes

  def set_token_id
    self.token_id = "F"+ Random.hex(4)
  end

  def validate_document_filetypes
    return unless documents.attached?
    documents.each do |document|
      unless document.content_type.in?(%w[image/jpeg image/png application/pdf application/vnd.ms-excel application/vnd.openxmlformats-officedocument.wordprocessingml.document])
        errors.add(:documents, 'Invalid file type')
      end
    end 
  end


end
