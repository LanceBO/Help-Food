class AddPhotoToFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :photo, :string
  end
end
