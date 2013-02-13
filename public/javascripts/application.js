
$(window).load(function() {
  if (location.hash == "#register") {
    $("#register-box").removeClass("hidden");    
  }
  $(".register-button").click(function() {
    $("#register-box").removeClass("hidden");
  });  
})
