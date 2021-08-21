class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in, only: [:create, :new]
  before_action :ensure_owner_logged_in, only: [:index]  
  
  def new
        if current_user
          redirect_to(menus_path, notice: "Your'e already signed up user")
        end
    end  
    
    def index
        @clerks = User.clerks.order(:id)
        @customers = User.customers.order(:id)
        @owners = User.owners
    end
    
    def create
        name, email = params[:name], params[:email]
        password = params[:password]
        password_confirmation = params[:password_confirmation]
        user = User.new(name: name.capitalize,
                        email: email,
                        role: "customer",
                        password: password,
                        password_confirmation: password_confirmation)
        if user.save && password.length > 4
          session[:current_user_id] = user.id
          redirect_to(menus_path, notice: "Welcome #{user.name}!")
        else
          flash[:error] = user.errors.full_messages + password(password)
          redirect_to new_user_path
        end
    end
    

end
