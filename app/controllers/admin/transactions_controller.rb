class Admin::TransactionsController < AdminController
    respond_to :html

    def index
        @transanctions = scope.paginate(:page => params[:page])
    end

    def new
        @transaction = Transaction.new
    end

    def deposit
        parent.deposit(params[:amount])
        flash[:success] = "Payment accepted successfully."
    end

    def withdraw
        parent.withdraw(params[:amount])
        flash[:success] = "Withdrawal was created successfully."
    end

    protected

    def parent
        if id = params[:a]
            Account.find(id)
        else
            Transaction.all
        end
    end

    def scope
        if id = params[:a]
            Account.find(id).transactions
        else
            Transaction
        end
    end

    def handle_record_invalid
        respond_with(@transaction) do |format|
            format.html do
                action = "new"
                render :action => action
            end
        end
    end
end
