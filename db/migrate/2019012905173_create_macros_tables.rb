class CreateMacrosTables < ActiveRecord::Migration[5.2]
  def change
    create_table :macros do |t|
      t.string :name
      t.integer :macro_type
      t.text :subject
      t.text :body
      t.integer :macro_category_id

      t.timestamps
    end
    add_index :macros, :macro_category_id
  end
end
