class Service < ActiveRecord::Base
    has_many :options, :dependent => :destroy
    has_many :assigned_services, :dependent => :restrict

    validates :name, :presence => true, :uniqueness => true, :format => { :with => /^[a-z\d_]+$/ }
    validates :active, :inclusion => { :in => [true, false] }
    validates :title, :presence => true, :uniqueness => true
end
