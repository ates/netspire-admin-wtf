class Admin < ActiveRecord::Base
    devise :database_authenticatable, :rememberable

    validates :login, :presence => true, :uniqueness => true, :length => { :in => 3..32 }
    validates :password, :presence => true, :length => { :minimum => 6 }, :if => :password_required?

    private

    def password_required?
        new_record? || !password.nil? || !password_confirmation.nil?
    end
end
