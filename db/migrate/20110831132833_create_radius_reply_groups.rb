class CreateRadiusReplyGroups < ActiveRecord::Migration
    def self.up
        create_table :radius_reply_groups do |t|
            t.string :name, :null => false
            t.text :description
            t.boolean :active, :default => true
            t.timestamps
        end
    end

    def self.down
        drop_table :radius_reply_groups
    end
end
