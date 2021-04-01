import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<div class="mt-4 message-container" id="test-#{data.id}">
    <div>
      <p><a href="/users/${data.user.id}">@${data.user.nickname}</a></p>
    </div>
    <div class=""text-container"">
      <p>${data.content.text}</p>
    </div>
  </div>`;

    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_text');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value = '';
  }
});
