
$(document).ready(function($) {
    var objHeight=0;
    $.each($('#p-edit').children(),
        function() {
            if($(this).is(":visible") && $(this).hasClass("sf")){
                objHeight+=$(this).height();
            }
        }

        );
    $("#p-edit").height(objHeight+50+"px");
    $("#needp").click(function(){ alert("You are already logged in as a Client")})
    $("#needc").click(function(){ alert("You are already logged in as a Provider")})
    $("#tabs").tabs({})
    $("#tabs").tabs("option", {
        "selected": 3,
        "disabled": true,
        "hide": { effect: "fade", duration: 150 },
        "show": { effect: "fade", duration: 150}
    });
$("#tabs").hide();
$("#p-edit input[type=checkbox].d-check").each(function(){
    if($(this).is(":checked")){
        $("#tabs").show();
        var regexp, time,value,dlabel;
        value = $(this).val();
        dlabel=value.split('-').pop();
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $('.insert-'.concat(dlabel)).before($(this).data('fields').replace(regexp, time));
        $('#tabs').tabs("enable", value);
        var index = $('#tabs a[href="#'+$(this).val()+'"]').parent().index();
        $('#tabs').tabs("option","active", index);
    }
});
$("#p-edit").find("input[type=checkbox].d-check").each(function(){

    $(this).bind('click', function() {
        if ($(this).is(':checked')) {
            var regexp, time,value,dlabel;
            value = $(this).val();
            dlabel= value.split('-').pop();
            time = new Date().getTime();
            regexp = new RegExp($(this).data('id'), 'g');
            $('.insert-'.concat(dlabel)).before($(this).data('fields').replace(regexp, time));
            $('#tabs').tabs("enable", value);
            var index = $('#tabs a[href="#'+$(this).val()+'"]').parent().index();
            $('#tabs').tabs("option","active", index);

        }
        else{
            $('#tabs #'+$(this).val()+ ' input[type=hidden]#ruhroh').prop('checked',true);
            $('#tabs #'+$(this).val()+ ' fieldset').hide();

            $('#tabs').tabs("disable", $(this).val());
            var index = $('#tabs a[href="#'+$(this).val()+'"]').parent().index();
            $('#tabs').tabs("option","active", index-1);
        }
        if(!$("#p-edit input[type=checkbox].d-check").is(":checked")) {
            $('#tabs').hide();
        } 
        else if(!$('#tabs').is(":visible")) {
            $('#tabs').show();
        }
    })
})

$( ".datepicker" ).datepicker()
$("#p-reg").find("#frb, #agb").each(function (){
    $(this).bind('click', function() {
        $("#btn-input").val($(this).children(".ptype-btn").val());
    })
})
/*.parent(":not(.chosen-search,.search-field)").children().first()*/
$(".flp input[type=text]:not(.notme),.flp input[type=name],.flp input[type=email],.flp input[type=password],.flp textarea:not(.notme)").each(function(){

    if(!$(this).parent().hasClass("chosen-search") && !$(this).parent().hasClass("search-field")){
        if($(this).val()!=""){
            $(this).next().css("top","-25px");
            $(this).next().addClass("focussed");
            $(this).next().addClass("preset");
        }
        var sop = '<span class="ch">'; //span opening

        var scl = '</span>'; //span closing
        //split the label into single letters and inject span tags around them
        $(this).next().html(sop + $(this).next().html().split("").join(scl+sop) + scl);

        //to prevent space-only spans from collapsing
        $(".ch:contains(' ')").html("&nbsp;");
    }

})

$(".flp input[type=text]:not(.notme),.flp input[type=name],.flp input[type=email],.flp input[type=password],.flp textarea:not(.notme)").focus(function(){
    //calculate movement for .ch = half of input height
    //label = next sibling of input
    //to prevent multiple animation trigger by mistake we will use .stop() before animating any character and clear any animation queued by .delay()
    if(!$(this).parent().hasClass("chosen-search") && !$(this).parent().hasClass("search-field")){

        if($(this).next().hasClass("preset")){
            $(this).next().addClass("focussed").children().stop(true).each(function(i){
                $(this).delay(0).animate({top: 0+"px"}, 300, 'easeOutBack');
            })
        }
        else {
            $(this).next().addClass("focussed").children().stop(true).each(function(i){
                $(this).delay(0).animate({top: -25+"px"}, 300, 'easeOutBack');
            })
        }
    }
})
$(".flp input[type=text]:not(.notme),.flp input[type=name],.flp input[type=email],.flp input[type=password],.flp textarea:not(.notme)").blur(function(){
    //animate the label down if content of the input is empty
    if(!$(this).parent().hasClass("chosen-search") && !$(this).parent().hasClass("search-field")){

        if($(this).val() == "") {
            if($(this).next().hasClass("preset")){
                $(this).next().removeClass("focussed").children().stop(true).each(function(i){
                    $(this).delay(0).animate({top: 25}, 200, 'easeInOutBack');
                })
                //$(this).next().removeClass("preset");
            }
            else {
                $(this).next().removeClass("focussed").children().stop(true).each(function(i){
                    $(this).delay(0).animate({top: 0}, 200, 'easeInOutBack');
                })

            }
        }
    }
})
$(".chosen-select").each(function() {
    if($(this).parent().parent().hasClass("citystate")){
        $(this).chosen({
            width:"150px"
        }); 
    }
    else {
        $(this).chosen({
            width:"220px"
        });
    }
});

$(".uni-select").chosen({width:"500px"});
$("input[type=text]").addClass("form-control");
$("#p-edit #avatar-upload").change(function() {
    var oFReader = new FileReader();
    oFReader.readAsDataURL(this.files[0]);
    oFReader.onload = function (oFREvent) {
        $('#preview').html('<img src="'+oFREvent.target.result+'" id="prof" class="img-circle" width="200px" height="200px"">');
    }
})

$("#c-edit #avatar-upload2").change(function() {
    var oFReader1 = new FileReader();
    oFReader1.readAsDataURL(this.files[0]);
    oFReader1.onload = function (oFREvent) {
        $('#preview2').html('<img src="'+oFREvent.target.result+'" id="prof" class="img-circle" width="200px" height="200px"">');
    }
})
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches

$(".next").click(function(){
    if(animating) return false;
    animating = true;

    current_fs = $(this).closest("fieldset.sf");
    next_fs = $(this).closest("fieldset.sf").next();

    $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

    next_fs.show();
    current_fs.animate({opacity: 0}, {
        step: function(now, mx) {
                  opacity = 1 - now;
                  current_fs.css({'left': "50%", 'opacity': opacity});
                  next_fs.css({'left': "50%", 'opacity': opacity});
              }, 
        duration: 800, 
        complete: function(){
            current_fs.hide();
            animating = false;

            $("#p-edit").height($(this).closest("fieldset.sf").next().height()+50+"px");
        }, 
        easing: 'easeInOutBack'
    })
})

$(".previous").click(function(){
    if(animating) return false;
    animating = true;

    current_fs = $(this).parent().parent();
    previous_fs = $(this).parent().parent().prev();

    //de-activate current step on progressbar
    $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

    //show the previous fieldset
    previous_fs.show(); 
    //hide the current fieldset with style

    current_fs.animate({opacity: 0}, {
        step: function(now, mx) {
                  //as the opacity of current_fs reduces to 0 - stored in "now"
                  //1. scale previous_fs from 80% to 100%
                  //2. take current_fs to the right(50%) - from 0%
                  //3. increase opacity of previous_fs to 1 as it moves in
                  opacity = 1 - now;
                  current_fs.css({'left': "50%", 'opacity': opacity});
                  previous_fs.css({'left': "50%", 'opacity': opacity});
              }, 
        duration: 800, 
        complete: function(){
            current_fs.hide();
            animating = false;

            $("#p-edit").height($(this).closest("fieldset.sf").prev().height()+50+"px");
        }, 
        //this comes from the custom easing plugin
        easing: 'easeInOutBack'
    })
})

$(".clockpicker").clockpicker({
    donetext: "Set Time",
twelvehour: true
});
$(".btn-file").click(function() {
    $(this).prev().click();
});
$(".btn-file").prev().change(function () {
    if(!$(this).hasClass("gotFile")){
        $(this).next().html($(this).next().html()+"<span>&nbsp;&nbsp;</span>");
        $(this).next().html($(this).next().html()+"<span style='color: #A1C436;' class='fa fa-check'></span>"); 
        $(this).addClass("gotFile");
    }
});
$(".badge").tooltip({});


$("#tier0 span,#tier1 span, #tier2 span, #tier3 span").hide();
$("#tier0 p,#tier1 p, #tier2 p, #tier3 p").hide();
$("#slider-vertical").slider({
    orientation: "vertical",
    range: "min",
    min: 50,
    max: 500,
    value: 75,
    slide: function( event, ui ) {
        $(this).find('.ui-slider-handle').text('$'+ui.value);
    },
    create: function(event, ui) {
                    
                var v=$(this).slider('value');
                $(this).find('.ui-slider-handle').text('$'+v);
                $("#tier0").animate(
                        {width: "670"},
                        {duration:600,
                            completion: function () {}
                        });
                $("#tier0 span,#tier0 p").fadeIn();
                $("#tier0").addClass("activeTier");

            },
    change: function(event, ui) {
                if(ui.value<140){

                    $("#tier0").animate(
                        {width: "670"},
                        {duration:600,
                            completion: function () {}
                        });
                    $("#tier0 span,#tier0 p").delay(400).fadeIn();
                    $("#tier0").addClass("activeTier");
                } else {
                    $("#tier0").delay(200).animate(
                            {width: "600"},
                            {duration:600,
                                completion: function () {}
                            });
                    $("#tier0 span,#tier0 p").fadeOut();
                    $("#tier0").removeClass("activeTier");
                }
                if(ui.value<260 &&ui.value>=140){
                    $("#tier1").animate(
                            {width: "670"},
                            {duration:600,
                                completion: function () {}
                            });
                    $("#tier1 span,#tier1 p").delay(400).fadeIn();
                    $("#tier1").addClass("activeTier");
                } else {
                    $("#tier1").delay(200).animate(
                            {width: "500"},
                            {duration:600,
                                completion: function () {}
                            });
                    $("#tier1 span,#tier1 p").fadeOut();
                    $("#tier1").removeClass("activeTier");

                }
                if(ui.value<380 && ui.value >= 260){
                    $("#tier2").animate(
                            {width: "670"},
                            {duration:600,
                                completion: function () {}
                            });
                    $("#tier2 span,#tier2 p").delay(400).fadeIn();
                    $("#tier2").addClass("activeTier");
                } else {
                    $("#tier2").delay(200).animate(
                            {width: "400"},
                            {duration:600,
                                completion: function () {}
                            });
                    $("#tier2 span,#tier2 p").fadeOut();
                    $("#tier2").removeClass("activeTier");

                }
                if(ui.value>=380) {
                    $("#tier3").animate(
                            {width: "670"},
                            {duration:600,
                                completion: function () {}
                            });
                    $("#tier3 span,#tier3 p").delay(400).fadeIn();
                    $("#tier3").addClass("activeTier");
                } else {
                    $("#tier3").delay(200).animate(
                            {width: "300"},
                            {duration:600,
                                completion: function () {}
                            });
                    $("#tier3 span, #tier3 p").fadeOut();
                    $("#tier3").removeClass("activeTier");

                }
            }
});
});

