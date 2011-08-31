class CreateServices < ActiveRecord::Migration
    def self.up
        create_table :services do |t|   
            t.string :name, :null => false
            t.string :title, :null => false
            t.text :description
            t.boolean :active, :null => false, :default => true
            t.timestamps
        end
    end

    def self.down
        drop_table :services
    end
end
