require "rails_helper"

RSpec.feature 'create entry reference image' do

  context 'when I go to the ref image create page and add image' do
    let!(:entry){ FactoryGirl.create :entry }

    before do
      visit new_entry_reference_image_path(entry)
      attach_file :reference_image_image, test_image_path, visible: false
      click_on 'Create image'
      entry.reload
    end

    it 'should create reference image' do
      expect(entry.reference_images.count).to eq 1
    end

    it 'should redirect back to show entry' do
      expect(current_path).to eq entry_path(entry)
    end

  end

end