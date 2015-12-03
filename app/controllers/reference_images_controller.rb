class ReferenceImagesController < ApplicationController
  before_action :load_entry
  before_action :load_reference_image, only: [:destroy]

  def new
    @reference_image = @entry.reference_images.new
  end

  def create
    @reference_image = @entry.reference_images.new strong_params

    if @reference_image.save
      redirect_to entry_path(@entry)
    else
      render :new
    end

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
    @reference_image = @entry.reference_images.find params[:id]
  end

  def strong_params
    params.require(:reference_image).permit :image
  end

end