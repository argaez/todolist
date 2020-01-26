require 'sinatra'
require 'make_todo'


get '/' do
    @tasks = Tarea.all
    redirect '/new' if @tasks.empty?
    erb :index
end

get '/new' do
    @title = "Add a New Task"
    erb :new
end

post '/new' do
    Tarea.create(params[:content])    
    redirect '/'
end

#update
get '/:id/complete' do
    Tarea.update(params[:id])
    redirect '/'
end

#delete
get '/:id/delete' do
    @task = Tarea.find(params[:id])
    erb :delete
end

delete '/:id' do
    Tarea.destroy(params[:id])
    redirect '/'
end





