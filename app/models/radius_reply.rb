class RadiusReply < ActiveRecord::Base
    has_many :assigned_radius_replies, :dependent => :delete_all

    validates :name, :presence => true, :uniqueness => true, :format => { :with => /^[A-Za-z\d_-]+$/ }
    validates :active, :inclusion => { :in => [true, false] }
end
