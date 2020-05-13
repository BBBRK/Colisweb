class AddCarrierToTransporter < ActiveRecord::Migration
  def change
      add_column :transporters, :carriers, :string
  end
end
