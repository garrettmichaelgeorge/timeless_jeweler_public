import select2 from 'select2'

export default function initSelect2 () {
  $('.with-select2').select2({
    // theme: 'bootstrap4',
    tags: true,
  })

  // Set the value, creating a new option if necessary
  // From https://select2.org/programmatic-control/add-select-clear-items#create-if-not-exists
  if ($('#new-person-household-association').find(`option[value='${data.id}']`).length) {
    $('#new-person-household-association').val(data.id).trigger('change')
  } else {
    // Create a DOM Option and pre-select by default
    const newOption = new Option(data.text, data.id, true, true)
    // Append it to the select
    $('#new-person-household-association').append(newOption).trigger('change')
  }
}

// Original initialization from Select2 documentation
// $(document).ready(function() {
//   $('.with-select2').select2({
//     // theme: 'bootstrap4',
//     tags: true,
//   })
// })

