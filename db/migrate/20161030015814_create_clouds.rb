class CreateClouds < ActiveRecord::Migration[5.0]
  def change
    create_table :clouds do |t|

      t.timestamps
    end
  end
end
