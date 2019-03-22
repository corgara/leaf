class Tab < ActiveRecord::Migration[5.2]
    def change
    create_table :tabs do |t|
      t.integer :section_id
      t.string :title
      t.string :description
      t.string :document
      t.timestamps
    end
  end
end
