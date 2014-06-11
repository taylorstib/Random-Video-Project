require 'sinatra'
require 'sinatra/reloader'
require 'pry'

configure do
	enable :sessions
end


def randvid(videos)
	vid = rand(videos.length)
	"http://www.youtube.com/embed/" + videos[vid] + "?autoplay=1"
end

get '/' do
	erb :home	
end


get '/frylaurie' do 
	if session[:videos] == nil
		session[:videos] = ['J691coIfFvs', 'gv2B7444Bsk', 'U8ko2nCk_hE', 'e9YcWLqjb9k', 'rLo7Ao54TJA']
	end

	result = randvid(session[:videos])

	# # pass the results back to index.erb

	erb :random, :locals => {:result => result}

end

binding.pry 

post '/' do
	vidURL = params['vidURL']
	vidURL = vidURL.split('?v=')
	vidURL = vidURL[1]

	session[:videos].push(vidURL)
	result = randvid(session[:videos])

	erb :random, :locals => {:result => result}
binding.pry

end


binding.pry













