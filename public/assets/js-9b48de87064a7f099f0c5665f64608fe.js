
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


    var d;
    //breakdown the labels into single character spans
    $(".flp input[type=text],.flp input[type=name],.flp input[type=email],.flp input[type=password],.flp textarea").each(function(){
        if($(this).val()!=""){
            $(this).next().css("top","-22px");
            $(this).next().addClass("focussed");
            $(this).next().addClass("preset");
        }
        var sop = '<span class="ch">'; //span opening

        var scl = '</span>'; //span closing
        //split the label into single letters and inject span tags around them
        $(this).next().html(sop + $(this).next().html().split("").join(scl+sop) + scl);
        //to prevent space-only spans from collapsing
        $(".ch:contains(' ')").html("&nbsp;");

    })

    //animation time
    var tm=-23;
    $(".flp input[type=text],.flp input[type=name],.flp input[type=email],.flp input[type=password],.flp textarea").focus(function(){
        //calculate movement for .ch = half of input height
        //label = next sibling of input
        //to prevent multiple animation trigger by mistake we will use .stop() before animating any character and clear any animation queued by .delay()
        if($(this).next().hasClass("preset")){
            $(this).next().addClass("focussed").children().stop(true).each(function(i){
                d = i*50;//delay
                $(this).delay(d).animate({top: 0+"px"}, 300, 'easeOutBack');
            })
        }
        else {
            $(this).next().addClass("focussed").children().stop(true).each(function(i){
                d = i*50;//delay
                $(this).delay(d).animate({top: -23+"px"}, 300, 'easeOutBack');
            })
        }
    })
    $(".flp input[type=text],.flp input[type=name],.flp input[type=email],.flp input[type=password],.flp textarea").blur(function(){
        //animate the label down if content of the input is empty
        if($(this).val() == "") {
            if($(this).next().hasClass("preset")){
                $(this).next().removeClass("focussed").children().stop(true).each(function(i){
                    d = i*50;
                    $(this).delay(d).animate({top: 22}, 200, 'easeInOutBack');
                })
                //$(this).next().removeClass("preset");
            }
            else {
                $(this).next().removeClass("focussed").children().stop(true).each(function(i){
                    d = i*50;
                    $(this).delay(d).animate({top: 0}, 200, 'easeInOutBack');
                })

            }
        }
    })

    $(".chosen-select").chosen({
        width: "200px"
    }); 
});


