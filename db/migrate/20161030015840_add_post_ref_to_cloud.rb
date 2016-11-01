class AddPostRefToCloud < ActiveRecord::Migration[5.0]
  def change
    add_reference :clouds, :post, index: true, foreign_key: true
  end
end
