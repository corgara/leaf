class Paragraph < ActiveRecord::Migration[5.2]
    def change
    create_table :paragraphs do |t|
      t.integer :page_id
      t.string :title
      t.string :description
      t.string :document
      t.timestamps
    end
  end
end
