class AdditionalInfo < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :parent, class_name: 'AdditionalInfo', foreign_key: 'parent_additional_info_id'
  has_many :child_additional_info, class_name: 'AdditionalInfo', foreign_key: 'parent_additional_info_id'
end
