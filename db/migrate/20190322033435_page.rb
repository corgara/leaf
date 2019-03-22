class Page < ActiveRecord::Migration[5.2]
    def change
    create_table :pages do |t|
      t.integer :tab_id
      t.string :title
      t.string :description
      t.string :document
      t.timestamps
    end
  end
end
