$(document).ready(function(){
  $('select').formSelect();

  // Date of birth picker
  $('#dateofbirth').val('1990-01-01');
  $('.datepicker').datepicker({
    defaultDate : new Date(1990, 0, 1),
    setDefaultDate : true,
    yearRange: 100,
    format : 'yyyy-mm-dd',
    i18n : {
      cancel: 'ยกเลิก',
      done: 'ตกลง',
      clear: 'Rensa',
      months: [ 'มกราคม', 'กุมภาพันธ์', 'มีนาคม', 'เมษายน', 'พฤษภาคม', 'มิถุนายน', 'กรกฎาคม', 'สิงหาคม', 'กันยายน', 'ตุลาคม', 'พฤษจิกายน', 'ธันวาคม' ],
      monthsShort: [ 'ม.ค.', 'ก.พ.', 'มี.ค.', 'เม.ย.', 'พ.ค.', 'มิ.ย.', 'ก.ค.', 'ส.ค.', 'ก.ย.', 'ต.ค.', 'พ.ย.', 'ธ.ค.' ],
      weekdays: [ 'วันอาทิตย์', 'จันทร์', 'อังคาร', 'พุธ', 'พฤหัสบดี', 'ศุกร์', 'เสาร์' ],
      weekdaysShort: [ 'อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส' ],
      weekdaysLetter: [ 'อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส' ],
    },
  });

  // LUA event listener
  window.addEventListener('message', function(event) {
    if (event.data.action == 'open') {
      $('#wrapper').show();
    } else if (event.data.action == 'close') {
      $('#wrapper').hide();
    }
  });

  // Register button
  $('#register').click(function() {
    if ($('#lastname').val() != '' && $('#firstname').val() != '' && $('#dateofbirth').val() != '' && $('#sex select').val() != null && $('#height').val() != '') {
      if ($('#height').val().length > 1 && $('#dateofbirth').val().length == 10) {
        var dob = $('#dateofbirth').val();

        $.post('http://jsfour-register/register', JSON.stringify({
          firstname: $("#firstname").val(),
          lastname: $("#lastname").val(),
          dateofbirth: $("#dateofbirth").val(),
          sex: $("#sex select").val(),
          height: $("#height").val()
        }));
      }
    }
  });

  // Disable space on the input
  $("form").on({
	  keydown: function(e) {
	    if (e.which === 32)
	      return false;
	  },
	});

  // Disable form submit
  $("form").submit(function() {
		return false;
	});
});
