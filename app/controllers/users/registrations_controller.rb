class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    private
  
    def current_token
      request.env['warden-jwt_auth.token']
    end

    def respond_with(resource, _opts = {})
      register_success && return if resource.persisted?
  
      register_failed
    end
  
    def register_success
      @token = current_token
      render json: { message: 'Signed up sucessfully.', user: current_user, token: @token }
    end
  
    def register_failed
      render json: { message: "Something went wrong." }
    end
    
  end