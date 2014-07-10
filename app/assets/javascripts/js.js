
$(document).ready(function($) { 
    $("#tabs").tabs({
        });
    $("#tabs").tabs("option", {
        "selected": 3,
        "disabled": [],
        "hide": { effect: "fade", duration: 150 },
        "show": { effect: "fade", duration: 150}
    });
    $( "input[type=checkbox]" ).click(function(){
        if ($(this).is(':checked')) {
            $('#tabs').tabs("enable", $(this).val());
            $('#tabs').tabs("select", $(this).val() );
        }
        else{
            $('#tabs').tabs("disable", $(this).val());
        }
    });

    $( "#datepicker1" ).datepicker();
    $( "#datepicker2" ).datepicker();

});
