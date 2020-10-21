App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function(){
    //called when the subscription is ready for use on the server
  },

  disconnected: function(){
    //called when the subscription has been terminated by the server
  },

  received: function(data){
   //* return $('#chat-index).append('<li>' + data.message + '</li>');
  }, 

  post: function() {
    return this.perform('post');
  },

  post: function(message) {
    //window.alert(message);
   // return this.perform('post',{ message: message });
  }
}, $(document).on('keypress', '[data-behavior~=chat_post]', function(event) {
  if (event.keyCode === 13) {
    var chatForm = $('#chat-form');
    App.chat.post(chatForm.val());
    return chatForm.val();
  }
}));