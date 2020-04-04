class UsersController < ApplicationController

    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
        
      end

      def new
        @user = User.new
      end


      def create
        User.create(params.require(:user).permit(:firstName, :lastName, :email, :phone, :numberOfFamilyMembers, :region))
        redirect_to root_path
      end


      def edit
        @user = User.find(params[:id])
      end

      def update
        user = User.find(params[:id])
        User.update(params.require(:user).permit(:firstName, :lastName, :email, :phone, :numberOfFamilyMembers, :region))
        redirect_to users_path 
      end

      def destroy
        User.find(params[:id]).destroy
      
        redirect_to users_path
      end


      end
    

