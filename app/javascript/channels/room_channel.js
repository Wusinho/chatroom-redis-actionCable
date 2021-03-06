import consumer from "./consumer";

document.addEventListener("turbolinks:load", (e) => {
  const room_id = $("#room-id").attr("data-room-id");

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
        const user_id = Number($("#user-id").attr("data-user-id"));

        let html;

        if (user_id === data.message.user_id) {
          html = data.mine;
        } else {
          html = data.theirs;
        }

        $("#messages").append(html);
      },
    }
  );
});
