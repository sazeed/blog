class UsersController < ApplicationController

    def action
    end
    def new 
        @user = User.new
    end

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        @articles = @user.articles
    end

    def edit
        @user = User.find(params[:id])
    end 

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to @user
        else
          render 'edit'
        end
      end

    def create
        @user = User.new(params.require(:user).permit(:username, :email, :password))
       if @user.save
        redirect_to articles_path
    else
        render 'new'
    end
        end

        private
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end

end