class Admin::AccountsController < AdminController
    respond_to :html

    def index
        @accounts = Account.paginate(:page => params[:page])
    end

    def new
        @account = Account.new
    end

    def edit
        @account = Account.find(params[:id])
    end

    def create
        @account = Account.new(params[:account])
        @account.save!
        flash[:success] = "Account was created."
        redirect_to(admin_accounts_path)
    end

    def update
        @account = Account.find(params[:id])
        @account.attributes = params[:account]
        @account.save!
        flash[:success] = "Account was updated."
        redirect_to(edit_admin_account_url(@account))
    end

    def destroy
        @account = Account.find(params[:id])
        @account.destroy
        flash[:success] = "Account was deleted."
        redirect_to(admin_accounts_url)
    end

    protected

    def handle_record_invalid
        respond_with(@account) do |format|
            format.html do
                action = "new"
                action = "edit" unless @account.new_record?
                render :action => action
            end
        end
    end
end
