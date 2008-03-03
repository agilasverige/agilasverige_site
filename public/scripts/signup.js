$(document).ready(function() {

  if($('#attendant_wants_to_speak').attr('checked')) {
    $('#speakingproposal').show('slow')
  } else {
    $('#speakingproposal').hide('slow')      
  }

  
  $('#attendant_wants_to_speak').click(function() {
    if($(this).attr('checked')) {
      $('#speakingproposal').show('slow')
    } else {
      $('#speakingproposal').hide('slow')      
    }
  });

  
});
