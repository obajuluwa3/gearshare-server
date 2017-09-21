class ApplicationController < Sinatra::Base

	options '*' do
		response['Access-Control-Allow-Headers'] = 'content-type'
		response['Access-Control-Allow-Methods'] = 'GET,POST,PATCH,DELETE'
		200
	end

	before do
		p '-------------something--------------'
		response['Access-Control-Allow-Origin'] = '*'
    	content_type :json
		path = request.fullpath.split("?")[0]
		if ['/users/login','/users/register'].include?(path) || request.request_method == 'OPTIONS'
			pass
		end
		token = params[:token]
		user = User.find_by(token: token)
		if user
			puts '---------------im a user'
			pass
		else
			puts '--------------------no'
			'noooo'
		end
	end
end