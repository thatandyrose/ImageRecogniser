require "rails_helper"

RSpec.describe ReferenceImage, type: :model do
  describe 'create' do

    before do
      @ref_image = ReferenceImage.new
      @ref_image.save
    end

    it 'should not let me create without an image' do
      expect(ReferenceImage.count).to eq 0
      expect(@ref_image.errors.full_messages).to include("Image can't be blank")
    end
    
  end
end
