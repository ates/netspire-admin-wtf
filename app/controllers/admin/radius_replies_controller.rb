class Admin::RadiusRepliesController < AdminController
    respond_to :html

    def index
        @radius_replies = RadiusReply.paginate(:page => params[:page])
    end

    def new
        @radius_reply = RadiusReply.new
    end

    def edit
        @radius_reply = RadiusReply.find(params[:id])
    end

    def create
        @radius_reply = RadiusReply.new(params[:radius_reply])
        @radius_reply.save!
        flash[:success] = "RadiusReply was created."
        redirect_to(admin_radius_replies_path)
    end

    def update
        @radius_reply = RadiusReply.find(params[:id])
        @radius_reply.attributes = params[:radius_reply]
        @radius_reply.save!
        flash[:success] = "RadiusReply was updated."
        redirect_to(edit_admin_radius_reply_path(@radius_reply))
    end

    def destroy
        @radius_reply = RadiusReply.find(params[:id])
        @radius_reply.destroy
        flash[:success] = "RadiusReply was deleted."
        redirect_to(admin_radius_replies_path)
    end

    protected

    def handle_record_invalid
        respond_with(@radius_reply) do |format|
            format.html do
                action = "new"
                action = "edit" unless @radius_reply.new_record?
                render :action => action
            end
        end
    end
end
