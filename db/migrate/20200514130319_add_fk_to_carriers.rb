class AddFkToCarriers < ActiveRecord::Migration
    def change
        add_column :carriers, :transporter_id, :integer, foreign_key: true
    end
end
