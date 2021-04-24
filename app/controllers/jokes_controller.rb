class JokesController < ApplicationController
    get "/jokes/library" do
        erb :'jokes/library'
    end
    get "/jokes/new" do 
        erb :'jokes/new_joke'
    end

end