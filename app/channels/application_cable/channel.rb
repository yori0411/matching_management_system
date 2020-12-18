module ApplicationCable
  class Channel < ActionCable::Channel::Base
 #   def subscribed
 #     stream_from 'chat_channel'
 #   end
  
 #   def unsubscribed
 #     # Any cleanup needed when channel is unsubscribed
 #   end
  
 #   def post(data)
 #     ActionCable.server.broadcast('chat_channel', data)
 #   end
  end
end