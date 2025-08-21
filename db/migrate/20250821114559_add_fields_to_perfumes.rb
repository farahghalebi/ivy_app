class AddFieldsToPerfumes < ActiveRecord::Migration[7.1]
  def change
    add_column :perfumes, :brand, :string
    add_column :perfumes, :notes, :text
    add_column :perfumes, :style, :string
    add_column :perfumes, :occasion, :string
  end
end
