class HomeController < ApplicationController
  def index
  end
  def write
    @title = params[:title]
    @address = params[:address]
    @content = params[:content]
    
    mg_client = Mailgun::Client.new("key-47bb1ecdf1f1b5c0f96348adbde65dbe")

    message_params =  {
                       from: 'bob@example.com',
                       to:   @address,
                       subject: @title,
                       text:    @content
                      }
    
    result = mg_client.send_message('sandbox8575b1d043224a7da7d2dcfc0d098400.mailgun.org', message_params).to_h!
    
    message_id = result['id']
    message = result['message']
  end
end