class Notebook < ActiveRecord::Migration[5.2]
  def change
    create_table :notebooks do |t|
      t.string :title
      t.string :description
      t.string :document
      t.timestamps
    end
  end
end
