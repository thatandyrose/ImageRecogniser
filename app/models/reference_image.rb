class ReferenceImage < ActiveRecord::Base
  belongs_to :entry
  mount_uploader :image, ReferenceImageUploader

  validates :image, presence: true
end
