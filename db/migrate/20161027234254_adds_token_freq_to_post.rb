class AddsTokenFreqToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :words_freq, :string
  end
end
