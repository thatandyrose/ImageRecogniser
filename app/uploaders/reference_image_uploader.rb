class ReferenceImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_fit: [800, 800]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :moodstock do
     process :resize_to_fit => [480, 480]
  end

  def extension_white_list
     %w(jpg jpeg gif png)
  end

end
