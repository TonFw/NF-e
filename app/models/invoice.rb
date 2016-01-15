class Invoice < ActiveRecord::Base
  # Associations
  belongs_to :batch
  has_many :additional_infos

  # Rails Validations
  validates :nfe_code, length: { minimum: 5, maximum: 75}, presence: true
  validates :body, length: { minimum: 10 }, presence: true
end