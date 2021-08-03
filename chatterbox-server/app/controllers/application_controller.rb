class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    messages = Message.by_created
    messages.to_json
  end

  post '/messages' do
    message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    message.to_json
  end

  patch '/messages/:id' do
    message = Message.find(params[:id])
    message.update(
      body: params[:body]
    )
    message.to_json
  end 


  delete '/messages/:id' do
    # find the review using the ID
    message = Message.find(params[:id])
    # delete the review
    message.destroy
    # send a response with the deleted review as JSON
    message.to_json
  end 
  
end
