class AssignedRadiusReply < ActiveRecord::Base
    belongs_to :target, :polymorphic => true
    belongs_to :radius_reply

    validates :value, :presence => true
    validates :target_id, :presence => true
    validates :radius_reply_id, :presence => true
end
