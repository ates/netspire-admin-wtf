class Account < ActiveRecord::Base

    class BalanceTooLow < StandardError; end

    self.per_page = 10 # pagination

    has_many :transactions, :dependent => :delete_all

    validates :contract, :presence => true
    validates :login, :presence => true, :uniqueness => true, :length => { :in => 3..32 }
    validates :password, :presence => true, :length => { :minimum => 6 }
    validates :active, :inclusion => { :in => [true, false] }

    def deposit(amount)
        assert_valid_amount(amount)

        transaction do
            lock!
            transactions.create!(:amount => amount, :code => Transaction::Type::DEPOSIT)
            self.balance += amount
            save!
        end
    end

    def withdraw(amount)
        assert_valid_amount(amount)

        transaction do
            lock!
            transactions.create!(:amount => (- amount), :code => Transaction::Type::WITHDRAW)
            raise BalanceTooLow if balance < amount
            self.balance -= amount
            save!
        end
    end

    private

    def assert_valid_amount(amount)
        raise ArgumentError, "Argument is not numeric" unless amount.is_a?(Numeric)
        raise ArgumentError, "Argument must be greater than zero" unless amount > 0
    end
end
