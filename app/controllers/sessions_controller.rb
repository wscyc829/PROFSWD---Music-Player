class SessionsController < ApplicationController
	skip_before_action :require_login, except: :logout
	def login_page
		if session[:user_id]
			redirect_to '/music_player'
		end
	end

	def login
		user = User.authenticate(params[:username], params[:password])
		if user 
			session[:user_id] = user.id
			session[:username] = user.username 
			session[:playlist_id] = nil
			redirect_to '/music_player'
		else
		 	redirect_to action: :login_page
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to action: :login_page
	end

	def register_page
	end

	def register
	  	@username = params[:new_username]
	  	@password = params[:new_password]
	  	@password_confirm = params[:new_password_confirm]

	  	user = User.create_user(@username, @password, @password_confirm)

		if user
		  	redirect_to root_path
		else
			redirect_to '/music_player/register'
		end
	end
end
