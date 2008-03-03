$(document).ready(function() {

  toggleCheckBox();
  
  $('#attendant_wants_to_speak').click(function() {
    toggleCheckBox();
  });


  function toggleCheckBox() {
    if($('#attendant_wants_to_speak').attr('checked')) {
      $('#speakingproposal').show('slow')
    } else {
      $('#speakingproposal').hide('slow')      
    }    
  }
});
