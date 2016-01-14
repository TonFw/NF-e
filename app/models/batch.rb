class Batch < ActiveRecord::Base
  include Attachment

  has_many :invoices
end
