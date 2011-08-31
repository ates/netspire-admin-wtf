module Admin::TransactionsHelper
    def transaction_type(transaction)
        case transaction.code
        when Transaction::Type::DEPOSIT
            "DEPOSIT"
        when Transaction::Type::WITHDRAWAL
            "WITHDRAWAL"
        when Transaction::Type::TRANSFER
            "TRANSFER"
        else
            transaction.code
        end
    end
end
