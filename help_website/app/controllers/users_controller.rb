class UsersController < ApplicationController

    before_action :authenticate_admin! , only: [:index, :show, :edit, :update, :destroy, :export ,:sign_up]

    
    def index
      @users = User.all
      respond_to do |format|
        format.xlsx {
          response.headers[
            'Content-Disposition'
          ] = "attachment; filename=Requests.xlsx"
        }
        format.html { render :index }
      end
    end

    def show
        @user = User.find(params[:id])
        
      end

      def new
        @user = User.new
      end


      def create
      
        @user = User.new(user_params)
       
        if @user.save
            
            redirect_to users_new_path, notice: "Request Created Sucsesfully"
         else
            render 'new'
         end


     
      end


      def edit
        @user = User.find(params[:id])
       
      end

      def update
        user = User.find(params[:id])
        user.update(user_params)

        redirect_to users_path 
      end

      def destroy
        User.find(params[:id]).destroy
      
        redirect_to users_path
      end

      private
      def user_params
  params.require(:user).permit(:firstName, :lastName, :email, :phone, :numberOfFamilyMembers, :region)
      end

      def find_user
        @user = User.find(params[:id])
      end


      end
    

