class RemoveColToTransporter < ActiveRecord::Migration
  def change
      remove_column :transporters, :created_at, :datetime
      remove_column :transporters, :updated_at, :datetime
  end
end
