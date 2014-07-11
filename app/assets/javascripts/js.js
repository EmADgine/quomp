
$(document).ready(function($) { 
    $("#tabs").tabs({
    });
    $("#tabs").tabs("option", {
        "selected": 3,
        "disabled": true,
        "hide": { effect: "fade", duration: 150 },
        "show": { effect: "fade", duration: 150}
    });
    $("#p-edit").find("input[type=checkbox]").each(function(){
        $(this).bind('click', function() {

            if ($(this).is(':checked')) {
                var regexp, time,value,dlabel;
                value = $(this).val();
                dlabel= value.split('-').pop();
                time = new Date().getTime();
                regexp = new RegExp($(this).data('id'), 'g');
                $('.insert-'.concat(dlabel)).before($(this).data('fields').replace(regexp, time));
                $('#tabs').tabs("enable", value);
                $('#tabs').tabs("select", value);
            }
            else{
                $('#tabs').tabs("disable", $(this).val());
            }
        });
    });

    $( "#datepicker1" ).datepicker();
    $( "#datepicker2" ).datepicker();

    $("#p-reg").find("#frb, #agb").each(function (){
        $(this).bind('click', function() {
            $("#btn-input").val($(this).children(".ptype-btn").val());
        });
    });

    $('form').on('click', '.remove_fields', function(event) {
        $(this).prev('input[type=hidden]').val('1');
        $(this).closest('fieldset').hide();
        return event.preventDefault();
    });



});



