module FixtureHelpers

  def file_path(name)
    File.join Rails.root, "/spec/fixtures/files/#{name}"
  end

  def uploaded_file(path)
    Rack::Test::UploadedFile.new File.open(path)
  end

  def test_image_path
    file_path 'test_image.jpg'
  end

  def uploaded_test_image
    uploaded_file test_image_path
  end

end

FactoryGirl::SyntaxRunner.send :include, FixtureHelpers