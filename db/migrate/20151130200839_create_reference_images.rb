class CreateReferenceImages < ActiveRecord::Migration
  def change
    create_table :reference_images do |t|
      t.text :image

      t.timestamps null: false
    end
  end
end
