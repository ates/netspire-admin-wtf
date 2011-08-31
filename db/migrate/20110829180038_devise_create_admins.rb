class DeviseCreateAdmins < ActiveRecord::Migration
    def self.up
        create_table(:admins) do |t|
            t.string :login, :null => false
            t.database_authenticatable :encryptor => :sha1, :null => true
            t.rememberable
            t.trackable
            t.timestamps
        end
        
        add_index :admins, :login,                :unique => true
    end
    
    def self.down
        drop_table :admins
    end
end
