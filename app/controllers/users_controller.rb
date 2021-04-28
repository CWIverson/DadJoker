require 'pry'
class UsersController < ApplicationController
    get "/login" do
        erb :'users/login'
    end
    get '/signup' do 
        erb :'users/signup'
    end
    post '/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            
            redirect to('/')
            
        else
            erb :"users/signup"
        end
    end
    post "/signup" do
        @user = User.create(params.merge(date_joined: Date.today))
        session[:user_id] = @user.id
        redirect to('/')
    end 
    get '/logout' do 
        if logged_in?
            
            @user = current_user 
            
            @user = nil
            session.destroy
            redirect to('/login')
        else
            redirect to('/login')
        end
    end

end 