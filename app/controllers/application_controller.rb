class ApplicationController < ActionController::Base
    protect_from_forgery
    rescue_from ActiveRecord::RecordInvalid, :with => :handle_record_invalid

    layout :pick_layout

    private

    # TODO: Find a way to avoid this trick
    def pick_layout
        if self.is_a?(Devise::SessionsController)
            "devise"
        else
            "application"
        end
    end
end
