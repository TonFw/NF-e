class AdditionalInfo < ActiveRecord::Base
  # Associations
  belongs_to :invoice
  belongs_to :parent, class_name: 'AdditionalInfo', foreign_key: 'parent_additional_info_id'
  has_many :child_additional_info, class_name: 'AdditionalInfo', foreign_key: 'parent_additional_info_id'

  # Rails Validation
  validates :key, presence: true

  # ========================    STATIC METHODS  ===================================
  def self.factory(hash, ref)
    hash.keys.each do |key|

    end


    ref.is_a?(AdditionalInfo) ? ref.child_additional_info << additional : ref.additional_infos << additional
  end
end
