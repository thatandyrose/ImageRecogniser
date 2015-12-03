require "rails_helper"

RSpec.feature 'show entry' do

  context 'when I go to the entry page' do
    
    context 'and there are no images' do
      
      let!(:entry){ FactoryGirl.create :entry }

      before do
        visit entry_path(entry)
      end

      it 'should let me go to the new image page' do
        click_on 'Add reference image'
        expect(current_path).to eq new_entry_reference_image_path(entry)
      end

      it 'should let me go to the edit entry page' do
        within(find 'h1'){ click_on "#{entry.name}" }
        expect(current_path).to eq edit_entry_path(entry)
      end

    end

    context 'and there are images' do
      
      let!(:entry){ FactoryGirl.create :entry }
      let!(:reference_image_1){ FactoryGirl.create :reference_image, entry: entry }
      let!(:reference_image_2){ FactoryGirl.create :reference_image, entry: entry }

      before do
        visit entry_path(entry)
      end

      it 'should list images' do
        expect(page).to have_css("img[src='#{reference_image_1.image.url}']")
        expect(page).to have_css("img[src='#{reference_image_2.image.url}']")
      end

      it 'should allow me to delete an image' do
        
        within find(".image-row[data-image-id='#{reference_image_1.id}']") do
          click_on 'delete'
        end
        
        expect(current_path).to eq entry_path(entry)
        expect(page).to_not have_css("img[src='#{reference_image_1.image.url}']")
        expect(ReferenceImage.count).to eq 1
  
      end

    end

  end

end