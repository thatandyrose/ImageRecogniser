class ReferenceImage < ActiveRecord::Base
  extend FriendlyId
  belongs_to :entry
  mount_uploader :image, ReferenceImageUploader
  friendly_id :file_name, use: :slugged

  validates :image, presence: true

  after_commit :save_to_search_apis, on: :create
  after_commit :delete_from_search_apis, on: :destroy

  def file_name
    File.basename(image.file.path) if image && image.file
  end

  def self.search_apis(file)
    response = MoodstockApi.new.search(file)
    
    if response['id']
      friendly.find response['id']
    end

  end

  private

  def save_to_search_apis
    MoodstockApi.new.save_reference self
  end

  def delete_from_search_apis
    MoodstockApi.new.delete_reference self
  end
end
