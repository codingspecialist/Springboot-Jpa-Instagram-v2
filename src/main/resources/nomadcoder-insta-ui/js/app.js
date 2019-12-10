$(document).ready(function() {
  var $heart = $(".heart"),
    $cog = $(".fa-cog"),
    $overlay = $(".profile__overlay"),
    $closeBtn = $(".fa-times"),
    $cancelBtn = $("#cancel"),
    $logoutBtn = $("#logout");
  $heart.click(function() {
    $(this).toggleClass("heart-clicked fa-heart fa-heart-o");
  });

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
