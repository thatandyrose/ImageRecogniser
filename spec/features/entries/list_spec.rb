require "rails_helper"

RSpec.feature 'list entries' do

  context 'when I have entries and I visit the index page' do

    let!(:entry_1){ FactoryGirl.create :entry, name: 'entry 1' }
    let!(:entry_2){ FactoryGirl.create :entry, name: 'entry 2' }

    before do
      visit entries_path
    end

    it 'should list the entries' do
      expect(page).to have_content('entry 1')
      expect(page).to have_content('entry 2')
    end

    it 'should show link to add entry' do
      click_on 'Create new entry'
      expect(current_path).to eq new_entry_path
    end

    it 'should let me go to entry' do
      click_on 'entry 1'
      expect(current_path).to eq entry_path(entry_1)
    end

  end

end