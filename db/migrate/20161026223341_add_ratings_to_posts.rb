class AddRatingsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :init_rating, :integer
    add_column :posts, :end_rating, :integer
  end
end
