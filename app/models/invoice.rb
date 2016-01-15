class Invoice < ActiveRecord::Base
  belongs_to :batch
end