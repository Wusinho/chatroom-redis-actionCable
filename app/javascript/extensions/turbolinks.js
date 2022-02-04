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

// $("#submit").bind("ajax:complete", function (event, xhr, status) {
//   $("#message_content").val("");
// });

// $("#submit").submit(function (e) {
//   e.preventDefault();
//   this.submit();
//   $("#message_content").val("");
// });
