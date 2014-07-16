
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


    //breakdown the labels into single character spans
    $(".flp label").each(function(){
        var sop = '<span class="ch">'; //span opening
        var scl = '</span>'; //span closing
        //split the label into single letters and inject span tags around them
        $(this).html(sop + $(this).html().split("").join(scl+sop) + scl);
        //to prevent space-only spans from collapsing
        $(".ch:contains(' ')").html("&nbsp;");
    })

    var d;
    //animation time
    $(".flp input").focus(function(){
        //calculate movement for .ch = half of input height
        var tm = $(this).outerHeight()/2 *-1 + "px";
        //label = next sibling of input
        //to prevent multiple animation trigger by mistake we will use .stop() before animating any character and clear any animation queued by .delay()
        $(this).next().addClass("focussed").children().stop(true).each(function(i){
            d = i*50;//delay
            $(this).delay(d).animate({top: tm}, 200, 'easeOutBack');
        })
    })
    $(".flp input").blur(function(){
        //animate the label down if content of the input is empty
        if($(this).val() == "")
    {
        $(this).next().removeClass("focussed").children().stop(true).each(function(i){
            d = i*50;
            $(this).delay(d).animate({top: 0}, 500, 'easeInOutBack');
        })
    }
    })

    $("#heap-select").heapbox();
    $("#heap-select-2").heap-box(
    );
});


