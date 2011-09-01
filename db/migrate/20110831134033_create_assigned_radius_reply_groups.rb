class CreateAssignedRadiusReplyGroups < ActiveRecord::Migration
    def self.up
        create_table :assigned_radius_reply_groups do |t|
            t.references :target, :null => false
            t.references :radius_reply_group, :null => false
            t.string :target_type, :null => false
            t.timestamps
        end
    end

    def self.down
        drop_table :assigned_radius_reply_groups
    end
end
