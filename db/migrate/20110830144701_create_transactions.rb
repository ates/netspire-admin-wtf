class CreateTransactions < ActiveRecord::Migration
    def self.up
        create_table :transactions do |t|
            t.references :account, :null => false
            t.decimal :amount, :precision => 12, :scale => 2, :null => false
            t.integer :code, :null => false
            t.string :comment
            t.timestamps
        end
    end

    def self.down
        drop_table :transactions
    end
end
