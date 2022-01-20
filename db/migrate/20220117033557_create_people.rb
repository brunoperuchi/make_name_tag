class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :description
      t.string :url_image
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
