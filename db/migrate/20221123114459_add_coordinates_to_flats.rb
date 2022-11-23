class AddCoordinatesToFlats < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :latitude, :float
    add_column :foods, :longitude, :float
  end
end
