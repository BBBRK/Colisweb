class AddColToTransporter < ActiveRecord::Migration
  def change
      add_column :transporters, :siret, :string
      add_column :transporters, :postal_codes, :string

  end
end
