class ReferenceImagesController < ApplicationController
  before_action :load_entry
  before_action :load_reference_image, only: [:destroy]

  def new
    @reference_image = @entry.reference_images.new
  end

  def create_multiple
    ReferenceImage.transaction do

      params[:images].each do |file|
        @entry.reference_images.create! image: file
      end
      
    end
    
    
    redirect_to entry_path(@entry)
  end

  def destroy
    @reference_image.destroy!
    redirect_to entry_path(@entry)
  end
  
  private

  def load_entry
    @entry = Entry.find params[:entry_id]
  end

  def load_reference_image
    @reference_image = @entry.reference_images.friendly.find params[:id]
  end

end