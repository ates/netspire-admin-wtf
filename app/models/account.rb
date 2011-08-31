class Account < ActiveRecord::Base
    self.per_page = 10 # pagination

    validates :contract, :presence => true
    validates :login, :presence => true, :uniqueness => true, :length => { :in => 3..32 }
    validates :password, :presence => true, :length => { :minimum => 6 }
    validates :active, :inclusion => { :in => [true, false] }
end
