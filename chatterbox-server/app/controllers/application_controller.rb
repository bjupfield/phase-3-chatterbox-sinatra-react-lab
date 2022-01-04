class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  get '/messages' do
    Message.all.order(created_at: :asc).to_json
  end
  post '/messages' do
    Message.create({body:params[:body], username:params[:username]}).to_json
  end
  patch '/messages/:id' do
    b = Message.find(params[:id]).update(body:params[:body])
    b = Message.find(params[:id])
    b.to_json
  end
  delete '/messages/:id' do
    Message.find(params[:id]).destroy
  end
end
