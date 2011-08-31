class CreateIptrafficSessions < ActiveRecord::Migration
    def self.up
        create_table :iptraffic_sessions do |t|
            t.references :account, :null => false
            t.string :sid, :limit => 64, :null => false
            t.string :ip
            t.integer :octets_in, :limit => 8, :null => false, :default => 0
            t.integer :octets_out, :limit => 8, :null => false, :default => 0
            t.decimal :amount, :precision => 20, :scale => 10, :null => false, :default => 0
            t.timestamp :started_at, :null => false
            t.timestamp :finished_at
            t.timestamp :updated_at
            t.boolean :expired
        end
    end

    def self.down
        drop_table :iptraffic_sessions
    end
end
