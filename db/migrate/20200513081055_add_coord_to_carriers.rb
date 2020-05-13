class AddCoordToCarriers < ActiveRecord::Migration
  def change
      add_column :carriers, :latitude, :double
      add_column :carriers, :longitude, :double
      add_column :carriers, :altitude, :double
  end
end
