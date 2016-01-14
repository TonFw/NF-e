module Attachment
  extend ActiveSupport::Concern

  # Upload validations for which include it
  included do
    has_attached_file :attached,
                      path: "#{self.to_s.downcase.pluralize}/:attachment/:id/:style/#{self.to_s.downcase}_work_flow",
                      styles: { original: '300x300>', thumb: '75x75>' },
                      default_url: 'defaults/how_works_flow.png', if: :attached?
    validates_attachment_content_type :attached, content_type: /\Aimage\/.*\Z/, if: :attached?
    validates_attachment_size :attached, less_than: 200.kilobyte, if: :attached?
  end

  def attached?
    self.attached_file_name
  end
end