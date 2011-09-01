class AssignedRadiusReplyGroup < ActiveRecord::Base
    belongs_to :target, :polymorphic => true
    belongs_to :radius_reply_group

    validates :target_id, :presence => true, :uniqueness => true
    validates :radius_reply_group_id, :presence => true
end
