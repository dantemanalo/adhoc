// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require turbolinks

// $(function () {
//     $('#datetimepicker6').datetimepicker({format: 'DD-MMM-YYYY'});
//     $('#datetimepicker7').datetimepicker({format: 'DD-MMM-YYYY'});
//     $("#datetimepicker6").on("dp.change", function (e) {
//         $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
//     });
//     $("#datetimepicker7").on("dp.change", function (e) {
//         $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
//     });
// });
//
// $(function () {
//     $('#datetimepicker8').datetimepicker({format: 'DD-MMM-YYYY'});
//     $('#datetimepicker9').datetimepicker({format: 'DD-MMM-YYYY'});
//     $("#datetimepicker8").on("dp.change", function (e) {
//         $('#datetimepicker9').data("DateTimePicker").minDate(e.date);
//     });
//     $("#datetimepicker9").on("dp.change", function (e) {
//         $('#datetimepicker8').data("DateTimePicker").maxDate(e.date);
//     });
// });

function showInput() {
    document.getElementById('display').innerHTML =
                document.getElementById("user_input").value;
}
