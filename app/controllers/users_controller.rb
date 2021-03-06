class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def action
    end
    def new 
        @user = User.new
    end

    def index
        @users = User.all
    end

    def show
       
        @articles = @user.articles
    end

    def edit
      
    end 

    def destroy
        @user.destroy
        session[:user_id]= nil
        redirect_to articles_path

    end

    def update
        
        if @user.update(user_params)
          redirect_to @user
        else
          render 'edit'
        end
      end

    def create
        @user = User.new(params.require(:user).permit(:username, :email, :password))
       if @user.save
        session[:user_id] = @user.id
        redirect_to articles_path
    else
        render 'new'
    end
        end

        private
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end

        def set_user
            @user = User.find(params[:id])
        end

        def require_same_user
            if current_user !=@user
                redirect_to @user
            end
        end





end