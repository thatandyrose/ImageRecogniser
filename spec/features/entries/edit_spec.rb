require "rails_helper"

RSpec.feature 'edit entry' do
  
  context 'when I go to the edit entry page and fill out the form' do
    let!(:entry){ FactoryGirl.create :entry }

    before do
      visit edit_entry_path(entry)

      fill_in :entry_name, with: 'super New name'
      click_on 'Update entry'
    end

    it 'should redirect to entry page' do
      expect(current_path).to eq entry_path(entry)
      expect(page).to have_content 'super New name'
    end

  end

end