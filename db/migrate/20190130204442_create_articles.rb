class CreateArticles < ActiveRecord::Migration[5.2]
	def change
		create_table :articles do |t|
			t.string :title
			t.text :description 
			t.belongs_to :articleInterface, polymorphic: true
		end
		add_index :articles, [:articleInterface_id, :articleInterface_type]
	end
end
