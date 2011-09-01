class Admin::RadiusReplyGroupsController < AdminController
  respond_to :html

  def index
    @radius_reply_groups = RadiusReplyGroup.paginate(:page => params[:page])
  end

  def new
    @radius_reply_group = RadiusReplyGroup.new
  end

  def edit
    @radius_reply_group = RadiusReplyGroup.find(params[:id])
  end

  def create
    @radius_reply_group = RadiusReplyGroup.new(params[:radius_reply_group])
    @radius_reply_group.save!
    flash[:success] = "RadiusReplyGroup was successfully created."
    redirect_to(admin_radius_reply_groups_path(@radius_reply_group))
  end

  def update
    @radius_reply_group = RadiusReplyGroup.find(params[:id])
    @radius_reply_group.attributes = params[:radius_reply_group]
    @radius_reply_group.save!
    flash[:success] = "RadiusReplyGroup was successfully updated."
    redirect_to(edit_admin_radius_reply_group_path(@radius_reply_group))
  end

  def destroy
    @radius_reply_group = RadiusReplyGroup.find(params[:id])
    @radius_reply_group.destroy
    redirect_to(admin_radius_reply_groups_url)
  end

  protected

  def handle_record_invalid
    respond_with(@radius_reply_group) do |format|
      format.html do
        action = "new"
        action = "edit" unless @radius_reply_group.new_record?
        render :action => action
      end
    end
  end

end
