require "rails_helper"

RSpec.feature 'search entries' do

  context 'when I have an entry with a ref image and I visit the search page and upload an image' do

    let!(:entry){ FactoryGirl.create :entry, name: 'entry 1' }
    let!(:reference_image){ FactoryGirl.create :reference_image, entry: entry }

    before do
      allow(ReferenceImage).to receive(:search_apis).and_return(reference_image)

      visit search_entries_path
      attach_file :search_image, test_image_path
      click_on 'Search'
    end

    it 'should return an entry' do
      expect(page).to have_content('entry 1')
    end

  end

end