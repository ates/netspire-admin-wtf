class Transaction < ActiveRecord::Base
    class Type < Enum
        option :DEPOSIT, 0
        option :WITHDRAW, 1
        option :TRANSFER, 2
    end

    attr_accessible :amount, :code

    belongs_to :account

    default_scope order("created_at DESC").includes(:account)

    validates :account_id, :presence => true
    validates :amount, :presence => true, :numericality => true
    validates :code, :inclusion => { :in => Type.values }

    def code
        Type.from_value(self[:code])
    end
end
