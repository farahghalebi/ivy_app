class RenameUrlToFilenameInPerfumes < ActiveRecord::Migration[7.1]
  def change
    rename_column :perfumes, :url, :filename
  end
end
