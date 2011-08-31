class CreateAccounts < ActiveRecord::Migration
    def self.up
        create_table :accounts do |t|
            t.string :contract, :null => false
            t.string :login, :null => false
            t.string :password, :null => false
            t.decimal :balance, :precision => 20, :scale => 10, :default => 0
            t.boolean :active, :null => false, :default => true
            t.timestamps
        end
    end
    
    def self.down
        drop_table :accounts
    end
end
