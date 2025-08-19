class CreatePerfumes < ActiveRecord::Migration[7.1]
  def change
    create_table :perfumes do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
