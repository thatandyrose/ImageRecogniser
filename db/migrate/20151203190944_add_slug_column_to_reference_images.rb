class AddSlugColumnToReferenceImages < ActiveRecord::Migration
  def change
    add_column :reference_images, :slug, :string
    add_index :reference_images, :slug, unique: true
  end
end
