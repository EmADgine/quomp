function cleanUpSpecialChars(str)
{
    str = str.replace(/[ÀÁÂÃÄÅ]/g,"A");
    str = str.replace(/[àáâãäå]/g,"a");
    str = str.replace(/[ÈÉÊË]/g,"E");
    str = str.replace(/[èéêë]/g,"e");

    return str.replace(/[^a-z0-9]/gi,''); // final clean up

}

function uploadFile(data,name,action,tempname,tempnameval,nested,method) {
    var xhr = new XMLHttpRequest();
    var formData = new FormData();
    formData.append('authenticity_token',$('meta[name="csrf-token"]').attr('content'));
    formData.append(name,data);
    if(nested) {
        formData.append(tempname,tempnameval);
    }
    xhr.open(method,action,true);
    xhr.onreadystatechange = function(e) {
        if ( xhr.readyState === 4 ) {
            if ( xhr.status === 200 ) {
                var code = xhr.responseText;
                if (code.indexOf("&amp;") != -1) {
                    code = code.replace(/\&amp/g, "&");
                }
                if (code.indexOf("&quot;") != -1) {
                    code = code.replace(/\&quot;/g, "\"");
                }
                code=code.replace(/(?:\r\n|\r|\n)/g, '');
                eval(code);
            } else {
            }
        }
    };
    xhr.setRequestHeader('accept','*/*;q=0.5, text/javascript');
    xhr.send(formData);
}
                                      function setHeight(obj)
                                      {
                                      var objHeight=0;
                                      $.each(obj.children(),
                                      function() {
                                      if($(this).is(":visible") && $(this).hasClass("sf")){
                                      objHeight+=$(this).height();
                                      }
                                      }

                                      );
                                      obj.height(objHeight+50+"px");

                                      }

                                      jQuery(document).ready(function($) {
                                      $(".chosen-search input[type=text]").css({"background-color":"white!important"});
                                      setHeight($("#p-edit"));
                                      setHeight($("#j-create"));
                                      $("#needp").click(function(){ alert("You are currently logged in as a Client, please log out to join our engine")})
                                      $("#needc").click(function(){ alert("You are currently logged in as a Provider, please log out to post a job")})
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
                                      $('#tabs #'+$(this).val()+ ' .ruhroh').prop('checked',true);
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
$('form .add_fields').click(function () {
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'),'g');
    $(this).before($(this).data('fields').replace(regexp,time));
    event.preventDefault();
});
jQuery(".datepicker").datepicker({
    showOtherMonths: true,
    selectOtherMonths: true,
    dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
});
$("#jobdates").daterangepicker({format: 'MM/DD/YYYY'});
$("#jobdates").on('apply.daterangepicker', function(ev,picker) {
    $("#startdatehidden").val(picker.startDate.format('MM/DD/YYYY'));
    $("#enddatehidden").val(picker.endDate.format('MM/DD/YYYY'));
    $("#jobdates").val("From " +picker.startDate.format('MM/DD/YYYY')+" to "+picker.endDate.format('MM/DD/YYYY'));

});
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
$(".flp input[type=text]:not(.notme),.flip input[type=name],.flp input[type=email],.flp input[type=password],.flp textarea:not(.notme)").change(function() {
    if(!$(this).parent().hasClass("chosen-search") && !$(this).parent().hasClass("search-field")){
        if(!$(this).val()==''&&$(this).css('top')=='auto') {
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
    }
});
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

    $("#progressbar li").eq($("fieldset.sf").index(next_fs)).addClass("active");

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

    current_fs = $(this).closest("fieldset.sf");
    previous_fs = $(this).closest("fieldset.sf").prev();

    //de-activate current step on progressbar
    $("#progressbar li").eq($("fieldset.sf").index(current_fs)).removeClass("active");

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
    if(!$(this).next().hasClass("picup")){
        $(this).parent().find(".insert-prev").html("<span type='button' class='btn btn-default prev-btn' data-toggle='modal' data-target='#"+cleanUpSpecialChars($(this).next().text().split(" ")[1].toLowerCase().trim())+"-prev'>Preview "+$(this).next().text().split(" ")[1]+"</span>");
        var file = this.files[0];
        $(this).closest(".jaxForm").find("#whichprev").data("previd",$(this).parent().next(".docprevtop").attr('id'));
        uploadFile(file,$(this).attr('name'),$(this).closest('.jaxForm').attr('action'),null,null,false,$(this).closest(".jaxForm").find("#whichprev").data('method'));
    }


});

$("#c-edit #usecheck").change(function() {
    $("#c-edit #usehidden").val($(this).prop('checked'));
});
$("#j-create .tooltipfield").tooltip({
    'container':'#createsheet3'
});
$(".badge").tooltip({container: 'body'});

$("#exp-req").change(function () {
});

$("#tier0 span,#tier1 span, #tier2 span, #tier3 span").hide();
$("#tier0 p,#tier1 p, #tier2 p, #tier3 p").hide();
$("#slider-vertical").slider({
    orientation: "vertical",
    range: "min",
    min: 0,
    max: 500,
    value: 230,
    slide: function( event, ui ) {
        $(this).find('.ui-slider-handle').text('$'+ui.value);
    },
    create: function(event, ui) {

                var v=$(this).slider('value');
                $(this).find('.ui-slider-handle').text('$'+v);
                $("#tier1").animate(
                    {width: "670"},
                    {duration:600,
                        completion: function () {}
                    });
                $("#tier1 span,#tier1 p").fadeIn();
                $("#tier1").addClass("activeTier");

            },
    change: function(event, ui) {
                if(ui.value<parseInt($("#tier0").data("thresh"))){

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
                if(ui.value<parseInt($("#tier1").data("thresh")) &&ui.value>=parseInt($("#tier0").data("thresh"))){
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
                if(ui.value<=parseInt($("#tier2").data("thresh")) && ui.value >= parseInt($("#tier1").data("thresh"))){
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
            }
});
var speed=700;
delay=400;
var switchheight=210;
var swapping=false;
$(".rankdisplay").toggle();
var scramblepick= function(excludeme){
    var s="p1 p2 p3 p4";
    s=s.replace(excludeme+" ","")
    var l=s.split(" ");
    var r = l[Math.floor(Math.random()*l.length)];
    return r;
}
var f1 = function () {
    if($("#p1").position().left>213||$("#p1").position().left<211) {

        $("#p1").swap({
            target: document.elementFromPoint(250, switchheight).id,//$($("#createsheet4 .pane")[0]).attr('id'),
            opacity: "1.0",
            speed: speed
        });
        setTimeout(f2,speed+delay);
    } else {
        f2();
    }
}
var f2 = function () {
    if($("#p2").position().left>587||$("#p2").position().left<585) {
        $("#p2").swap({
            target: document.elementFromPoint(600,switchheight).id,
            opacity: "1.0",
            speed: speed
        });
        setTimeout(f3,speed+delay);
    } else {
        f3();
    }
}
var f3= function () {
    if($("#p4").position().left>1335||$("#p4").position().left<1331) {
        $("#p4").swap({
            target: document.elementFromPoint(1348,switchheight).id,
            opacity: "1.0",
            speed: speed                                        
        });
        setTimeout(f5,speed/2);
    } else {
    f5()
    }

}
var f5= function() {
    $('#reorder').css('margin-left','508'+'px')
    $('#reorder').css('margin-right','-616'+'px')

    $("#reorder").text("Randomize");
    $("#reorder").addClass("random");
    swapping=false;
}
var f6 = function() {
$("#p1").swap({
            target: scramblepick("p1"),
            opacity: "1.0",
            speed: speed
        });
setTimeout(f7,speed+delay);
}
var f7 = function() {
$("#p2").swap({
            target: scramblepick("p2"),
            opacity: "1.0",
            speed: speed
        });
setTimeout(f8,speed+delay);
}
var f8 = function() {
$("#p3").swap({
            target: scramblepick("p3"),
            opacity: "1.0",
            speed: speed
        });
        setTimeout(f9,speed/2);
}
var f9 = function () {
    $('#reorder').css('margin-left','472'+'px')
    $('#reorder').css('margin-right','-662'+'px')

    $("#reorder").text("Order by Quomp Ranking");
    $("#reorder").removeClass("random");
    swapping=false;

}


$("#reorder").click(function() {
    if (!swapping){
        swapping=true;
        $(".rankdisplay").toggle(2000);
        if(!$(this).hasClass("random")){
            f1();
        }
        else {
            f6()
        }
    }
});
$(".ranked").next().next().next().find('.chosen-choices').sortable(
{
    items: '.search-choice',
    update: function(event, ui) {
        var i =1;
        $(this).find('.search-choice').each(function () {
            $(this).text(i.toString()+')'+$(this).text().split(')')[1]);
            i++;
        });
        i=0;
    }
}
);
$(".ranked").next().next().next().find('.chosen-choices').disableSelection();
});
