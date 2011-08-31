class CreateAssignedRadiusReplies < ActiveRecord::Migration
    def self.up
        create_table :assigned_radius_replies do |t|
            t.references :target, :null => false
            t.string :target_type, :null => false
            t.references :radius_reply, :null => false
            t.string :value
            t.timestamps
        end
    end

    def self.down
        drop_table :assigned_radius_replies
    end
end
