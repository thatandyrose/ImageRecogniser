class AddEntryReferenceToReferenceImages < ActiveRecord::Migration
  def change
    add_reference :reference_images, :entry, index: true, foreign_key: true
  end
end
