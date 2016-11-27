class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
 
  process resize_to_limit: [200, 200]

  version :thumb do
    process :resize_to_fit => [200, 200]
  end

  version :small do
    process :resize_to_fit => [50, 50]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
