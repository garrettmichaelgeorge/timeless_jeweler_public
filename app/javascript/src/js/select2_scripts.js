import select2 from 'select2';

// Initialize Select2 after the page is fully loaded
$(document).ready(function() {
  $('.with-select2').select2({
    // theme: 'bootstrap4',
    tags: true,
  });
});

// Set the value, creating a new option if necessary
// From https://select2.org/programmatic-control/add-select-clear-items#create-if-not-exists
if ($('#new-person-household-association').find("option[value='" + data.id + "']").length) {
  $('#new-person-household-association').val(data.id).trigger('change');
} else {
  // Create a DOM Option and pre-select by default
  var newOption = new Option(data.text, data.id, true, true);
  // Append it to the select
  $('#new-person-household-association').append(newOption).trigger('change');
}