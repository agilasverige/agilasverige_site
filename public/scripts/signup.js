$(document).ready(function() {

  toggleCheckBox();
  
  $('#wants_to_speak').click(function() {
    toggleCheckBox();
  });


  function toggleCheckBox() {
    if($('#wants_to_speak').attr('checked')) {
      $('#speakingproposal').show()
    } else {
      $('#speakingproposal').hide()      
    }    
  }
});
