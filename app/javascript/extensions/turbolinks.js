$(document).on("click", ".room", function (e) {
  setTimeout(function () {
    window.location.reload(true);
  }, 100);
});

$(document).on("click", "#submit", function (e) {
  setTimeout(function () {
    $("#message_content").val("");
  }, 10);
});
