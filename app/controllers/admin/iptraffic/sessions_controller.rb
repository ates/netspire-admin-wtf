class Admin::Iptraffic::SessionsController < AdminController
    def index
        @sessions = ::Iptraffic::Session.filter(params[:status], params[:page])
    end

    def show
        @session = ::Iptraffic::Session.find(params[:id])
    end
end
