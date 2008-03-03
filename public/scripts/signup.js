$(document).ready(function() {
  
  $('#attendant_wants_to_speak').click(function() {
    if($(this).attr('checked')) {
      $('#speakingproposal').show('slow')
    } else {
      $('#speakingproposal').hide('slow')      
    }
  });

  
});
