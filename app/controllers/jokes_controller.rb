class JokesController < ApplicationController
    get "/jokes/library" do
        @jokes = Joke.all
        erb :'jokes/library'
    end
    get "/jokes/new" do 
        if logged_in?
            erb :'jokes/new_joke'
        else
            redirect to("/login")
        end
    end
    get "/jokes/show/:id" do 
        @joke = Joke.find(params[:id])
        if logged_in? 
            erb :'jokes/show'
        else
            redirect to('/login')
        end
    end
    get "/jokes/edit/:id" do
        @joke = Joke.find(params[:id])
        if logged_in? && @joke.user == current_user
            @joke = Joke.find(params[:id])
            erb :'jokes/edit'
        else
            redirect to("/")
        end
    end
    post "/jokes/new" do
        if logged_in?
            @joke = Joke.create(params.merge(date: Date.today, user_id: current_user.id))
            redirect to("/")
        else
            redirect to ("/login")
        end
    end
    patch "/jokes/edit/:id" do
        joke = Joke.find(params[:id])
        joke.jokes = params[:jokes]
        joke.joke_type = params[:joke_type]
        joke.save
        redirect to("jokes/show/#{params[:id]}")
    end
    delete "/jokes/delete/:id" do
        joke = Joke.find(params[:id])
        if logged_in? && joke.user == current_user
            joke.destroy
            redirect to('/')
        else
            redirect to('/')
        end
    end
end