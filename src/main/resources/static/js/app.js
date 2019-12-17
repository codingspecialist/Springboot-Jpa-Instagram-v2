$(document).ready(function() {
    $cog = $(".fa-cog"),
    $overlay = $(".profile__overlay"),
    $closeBtn = $(".fa-times"),
    $cancelBtn = $("#cancel"),
    $logoutBtn = $("#logout");

  $cog.click(function() {
    $overlay.fadeIn();
  });

  $closeBtn.click(closePopup);
  $cancelBtn.click(closePopup);

  function closePopup() {
    $overlay.fadeOut();
  }

  $logoutBtn.click(function() {
    closePopup();
    window.location = "index.html";
  });
});
