class Admin::PlansController < AdminController
    respond_to :html

    def index
        @plans = Plan.paginate(:page => params[:page])
    end

    def new
        @plan = Plan.new
    end

    def edit
        @plan = Plan.find(params[:id])
    end

    def create
        @plan = Plan.new(params[:plan])
        @plan.save!
        flash[:success] = "Plan was successfully created."
        redirect_to(edit_admin_plan_url(@plan))
    end

    def update
        @plan = Plan.find(params[:id])
        @plan.attributes = params[:plan]
        @plan.save!
        flash[:success] = "Plan was successfully updated."
        redirect_to(edit_admin_plan_url(@plan))
    end

    def destroy
        @plan = Plan.find(params[:id])
        @plan.destroy
        redirect_to(admin_plans_url)
    end

    protected

    def handle_record_invalid
        respond_with(@plan) do |format|
            format.html do
                action = "new"
                action = "edit" unless @plan.new_record?
                render :action => action
            end
        end
    end
end
