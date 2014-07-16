$(document).ready(function($) { 
    $("#tabs").tabs({
    });
    $("#tabs").tabs("option", {
        "selected": 3,
        "disabled": true,
        "hide": { effect: "fade", duration: 150 },
        "show": { effect: "fade", duration: 150}
    });
    $("#tabs").hide();
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
            if(!$("#p-edit input[type='checkbox']").is(":checked")) {
                $('#tabs').toggle();
            } 
            else if(!$('#tabs').is(":visible")) {
                $('#tabs').toggle();
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


    //breakdown the labels into single character spans
    $(".flp input[type=text]:not(.notme),.flp input[type=name],.flp input[type=email],.flp input[type=password],.flp textarea").each(function(){
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
    $(".flp input[type=text]:not(.notme),.flp input[type=name],.flp input[type=email],.flp input[type=password],.flp textarea").focus(function(){
        //calculate movement for .ch = half of input height
        //label = next sibling of input
        //to prevent multiple animation trigger by mistake we will use .stop() before animating any character and clear any animation queued by .delay()
        if($(this).next().hasClass("preset")){
            $(this).next().addClass("focussed").children().stop(true).each(function(i){
                $(this).delay(0).animate({top: 0+"px"}, 300, 'easeOutBack');
            })
        }
        else {
            $(this).next().addClass("focussed").children().stop(true).each(function(i){
                $(this).delay(0).animate({top: -23+"px"}, 300, 'easeOutBack');
            })
        }
    })
    $(".flp input[type=text]:not(.notme),.flp input[type=name],.flp input[type=email],.flp input[type=password],.flp textarea").blur(function(){
        //animate the label down if content of the input is empty
        if($(this).val() == "") {
            if($(this).next().hasClass("preset")){
                $(this).next().removeClass("focussed").children().stop(true).each(function(i){
                    $(this).delay(0).animate({top: 22}, 200, 'easeInOutBack');
                })
                //$(this).next().removeClass("preset");
            }
            else {
                $(this).next().removeClass("focussed").children().stop(true).each(function(i){
                    $(this).delay(0).animate({top: 0}, 200, 'easeInOutBack');
                })

            }
        }
    })

    $(".chosen-select").chosen({
        width: "220px"
    }); 

    $("#p-edit #avatar-upload").change(function() {
        var oFReader1 = new FileReader();
        oFReader1.readAsDataURL(this.files[0]);
        oFReader1.onload = function (oFREvent) {
            $('#preview').html('<img src="'+oFREvent.target.result+'" id="prof" class="img-circle" width="200" height="200"">');
        };
    });

    $("#c-edit #avatar-upload2").change(function() {
        alert("client change");
    }


    //jQuery time
    var current_fs, next_fs, previous_fs; //fieldsets
    var left, opacity, scale; //fieldset properties which we will animate
    var animating; //flag to prevent quick multi-click glitches

    $(".next").click(function(){
        if(animating) return false;
        animating = true;

        current_fs = $(this).parent().parent();
        next_fs = $(this).parent().parent().next();

        $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

        next_fs.show(); 
        current_fs.animate({opacity: 0}, {
            step: function(now, mx) {
                      scale = 1 - (1 - now) * 0.2;
                      left = (now * 50)+"%";
                      opacity = 1 - now;
                      current_fs.css({'transform': 'scale('+scale+')'});
                          next_fs.css({'left': "50%", 'opacity': opacity});
                          }, 
                          duration: 800, 
                          complete: function(){
                              current_fs.hide();
                              animating = false;
                          }, 
                          easing: 'easeInOutBack'
                          });
                      });

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
                          scale = 0.8 + (1 - now) * 0.2;
                          //2. take current_fs to the right(50%) - from 0%
                          left = ((1-now) * 50)+"%";
                          //3. increase opacity of previous_fs to 1 as it moves in
                          opacity = 1 - now;
                          current_fs.css({'left': left});
                          previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
                              }, 
                              duration: 800, 
                              complete: function(){
                                  current_fs.hide();
                                  animating = false;
                              }, 
                              //this comes from the custom easing plugin
                              easing: 'easeInOutBack'
                              });
                          });
            $(".clockpicker").clockpicker({
                donetext: "Set Time"
            });
});


