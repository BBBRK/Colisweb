class AddColToCarriers < ActiveRecord::Migration
  def change
      add_column :carriers, :name, :string
      add_column :carriers, :age, :integer
      add_column :carriers, :has_driver_licence_a, :boolean
      add_column :carriers, :has_driver_licence_b, :boolean
      add_column :carriers, :has_driver_licence_c, :boolean
  end
end
