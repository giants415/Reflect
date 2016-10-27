class AddWordCountToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :words_counted, :integer
  end
end
