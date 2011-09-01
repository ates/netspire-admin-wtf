class RadiusReplyGroup < ActiveRecord::Base
    has_many :assigned_radius_reply_groups, :dependent => :delete_all
    has_many :assigned_radius_replies, :dependent => :delete_all, :as => :target

    accepts_nested_attributes_for :assigned_radius_replies, :allow_destroy => true

    validates :name, :presence => true, :uniqueness => true, :format => { :with => /^[A-Za-z\d_-]+$/ }
    validates :active, :inclusion => { :in => [true, false] }
end
