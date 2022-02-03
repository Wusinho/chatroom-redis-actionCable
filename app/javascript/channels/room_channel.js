import consumer from "./consumer";

document.addEventListener("turbolinks:load", (e) => {
  const room_id = $("#room-id").attr("data-room-id");

  // consumer.subscriptions.subscriptions.forEach((subscription) => {
  //   consumer.subscriptions.remove(subscription);
  // });

  consumer.subscriptions.create(
    { channel: "RoomChannel", room_id: room_id },
    {
      connected() {
        console.log("connected to" + " " + room_id);
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        const user_id = $("#user-id").attr("data-user-id");

        let html;

        // if (user_id === data.message.user_id) {
        //   html = data.mine;
        // } else {
        //   html = data.theirs;
        // }
        console.log(data);
        console.log(user_id);
        console.log(room_id);
        // const messageContainer = document.getElementById("messages");
        // messageContainer.innerHTML = messageContainer.innerHTML + html;
        // Called when there's incoming data on the websocket for this channel
      },
    }
  );
});
