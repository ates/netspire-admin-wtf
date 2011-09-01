class CreatePlans < ActiveRecord::Migration
    def self.up
        create_table :plans do |t|
            t.string :name, :null => false
            t.string :code, :null => false
            t.boolean :active, :null => false, :default => true
            t.boolean :legacy, :null => false, :default => false
            t.timestamp :expires_at
            t.timestamps
        end
    end

    def self.down
        drop_table :plans
    end
end
