#######################################################################################################################

#-## HTTP Route Request Example Notes ##-#
# |  HTTP VERB  |      ROUTE	          |      Action	      |              Used For                    |

#     GET	      |  '/articles'	        |   index action	  |  index page to display all articles
#     GET       |  '/articles/new'      |   new action  	  |  displays create article form
#     POST	    |  '/articles'  	      |   create action	  |  creates one article
#     GET    	  |  '/articles/:id'	    |   show action  	  |  displays one article based on ID in the url
#     GET	      |  '/articles/:id/edit' |   edit action	    |  displays edit form based on ID in the url
#     PATCH	    |  '/articles/:id'	    |   update action	  |  modifies an existing article based on ID in the url
#     PUT	      |  '/articles/:id'	    |   update action	  |  replaces an existing article based on ID in the url
#     DELETE	  |  '/articles/:id'	    |   delete action	  |  deletes one article based on ID in the url

#######################################################################################################################

require_relative  '../../config/environment'

class ApplicationController < Sinatra::Base
  #register Sinatra::ActiveRecordExtension
  #set :views, Proc.new { File.join(root, "../views/") }

  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  get '/home' do
    erb :home
  end

  get '/index' do
    erb :'/recipe_views/index'
  end

  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  get '/registrations/failure' do
    erb :'/registrations/failure'
  end

  post '/registrations/signup' do
    if params[:name].empty? || params[:email].empty? || params[:password].empty?
      redirect '/registrations/failure'
    end

    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:user_id] = @user.id

    redirect '/users/home'
  end

  get '/sessions/login' do
    # the line of code below render the view page in app/views/sessions/login.erb
    erb :'sessions/login'
  end

  post '/sessions' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/users/home'
    end
    redirect '/sessions/failure'
  end

  get '/sessions/failure' do
    erb :'/sessions/failure'
  end

  get '/sessions/logout' do
    session.clear
    erb :home
  end

  get '/users/home' do
    @user = User.find(session[:user_id])
    erb :'/users/home'
  end

  #User authentication example ---vv
  post "/login" do
		@user = User.find_by(username: params[:username])
		if @user && @user.authenticate(params[:password]) # .authenticate is a hidden method inside of Ruby's ActiveRecord Gem. Metaprogramming...
			session[:user_id] = @user.id
			redirect "/success"
		else
			redirect "/failure"
		end
	end

  # Although a helpers folder was created with its own class, we can also utilize it the same way below --vv
  # The Helper Methods at the bottom of this controller are part of Sinatra's configurations for helper methods.
  # These are methods that allow us to add logic to our views.
  # Views automatically have access to all helper methods thanks to Sinatra.

  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end

  ####--START OF RECIPE ROUTES ( Includes CRUD [Create, Read, Update, Delete] )--####

  get '/recipes' do
    @recipes = Recipe.all
    erb :'/recipe_views/index'
  end

  get '/recipes/new' do
    erb :'/recipe_views/new'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :'/recipe_views/show'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :'/recipe_views/edit'
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
   @recipe = Recipe.find(params[:id])
   @recipe.delete
   redirect '/recipes'
  end

end
