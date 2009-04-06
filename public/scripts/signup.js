$(document).ready(function() {

  toggleSpeaker();
  toggleDinner();
  
  $('#wants_to_speak').click(function() {
    toggleSpeaker();
  });

  $('#attending_dinner').click(function() {
    toggleDinner();
  });

  function toggleSpeaker() {
    if($('#wants_to_speak').attr('checked')) {
      $('#title').removeAttr("disabled")
      $('#abstract').removeAttr("disabled")
    } else {
      $('#title').attr("disabled", true)
      $('#abstract').attr("disabled", true)
    }    
  }

  function toggleDinner() {
    if($('#attending_dinner').attr('checked')) {
      $('#food_preferences').removeAttr("disabled")
    } else {
      $('#food_preferences').attr("disabled", true)
    }    
  }
});
