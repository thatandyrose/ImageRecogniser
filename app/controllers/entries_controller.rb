class EntriesController < ApplicationController
  before_action :load_entry, only: [:edit, :update, :show]

  def index
    @entries = Entry.all
  end

  def show
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new strong_params

    if @entry.save
      redirect_to entry_path(@entry)
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @entry.update_attributes strong_params
      redirect_to entry_path(@entry)
    else
      render :edit
    end
  end

  def search
  end

  def invoke_search
    if reference_image = ReferenceImage.search_apis(params[:search_image])
      @entry = reference_image.entry
    end

    render :search
  end

  private

  def load_entry
    @entry = Entry.find params[:id]
  end

  def strong_params
    params.require(:entry).permit :name
  end

end