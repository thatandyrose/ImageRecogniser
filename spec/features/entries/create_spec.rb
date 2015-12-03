require "rails_helper"

RSpec.feature 'create entry' do
  
  context 'when I go to the new entries page and fill out the form' do

    before do
      visit new_entry_path

      fill_in :entry_name, with: 'Picasso'
      click_on 'Create and add images'
    end

    it 'should redirect to entry page' do
      expect(current_path).to eq entry_path(Entry.first)
      expect(page).to have_content 'Picasso'
    end

  end

end