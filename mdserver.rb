require 'sinatra'

configure do
  set :port,    7654
  set :logging, false
end

get /ajax(.*)/ do
  fn = params[:captures][0]
  File.read fn
end

get /(.*)/ do
  fn = params[:captures][0]
  title = fn.split('/')[-1].split('.')[0]
  erb :wrapper, :locals => {:title => title}
end

