class CreateRadiusReplies < ActiveRecord::Migration
    def self.up
        create_table :radius_replies do |t|
            t.string :name
            t.text :description
            t.boolean :active, :default => true
            t.timestamps
        end
    end

    def self.down
        drop_table :radius_replies
    end
end
