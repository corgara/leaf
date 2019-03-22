class Section < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.integer :notebook_id
      t.string :title
      t.string :description
      t.string :document
      t.timestamps
    end
  end
end
