App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    #@perform 'channel_select', select: "chat_channel"

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    #$('#messages_index').append('<li>' + data.message + '</li>')
    #$('.text_message').html data['message']

    if data['user'] is $('#current_user_id').val()
      $('#append_messages').append '<div style="text-align: right">' + data['message'] + '</div>'
    else
      $('#append_messages').append '<div style="text-align: left">' + data['message'] + '</div>'

  
  speak: (message, room_id, user_id) ->
    @perform 'speak', text: message, room: room_id, user: user_id

  $(document).on 'keypress', '[data-behavior~=chat_speak]', (event) ->
    if event.keyCode is 13
      # コンソールで接続確認で使ったコード
      App.chat.speak event.target.value, $('#current_room_id').val(), $('#current_user_id').val()
      event.target.value = ''
      event.preventDefault()