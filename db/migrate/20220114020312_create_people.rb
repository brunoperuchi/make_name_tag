class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :function
      t.string :url_image

      t.timestamps
    end
  end
end
