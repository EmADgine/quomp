function cleanUpSpecialChars(e){return e=e.replace(/[\xc0\xc1\xc2\xc3\xc4\xc5]/g,"A"),e=e.replace(/[\xe0\xe1\xe2\xe3\xe4\xe5]/g,"a"),e=e.replace(/[\xc8\xc9\xca\xcb]/g,"E"),e=e.replace(/[\xe8\xe9\xea\xeb]/g,"e"),e.replace(/[^a-z0-9]/gi,"")}function uploadFile(data,name,action,tempname,tempnameval,nested,method){var xhr=new XMLHttpRequest,formData=new FormData;formData.append("authenticity_token",$('meta[name="csrf-token"]').attr("content")),formData.append(name,data),nested&&formData.append(tempname,tempnameval),xhr.open(method,action,!0),xhr.onreadystatechange=function(e){if(4===xhr.readyState&&200===xhr.status){var code=xhr.responseText;-1!=code.indexOf("&amp;")&&(code=code.replace(/\&amp/g,"&")),-1!=code.indexOf("&quot;")&&(code=code.replace(/\&quot;/g,'"')),code=code.replace(/(?:\r\n|\r|\n)/g,""),eval(code)}},xhr.setRequestHeader("accept","*/*;q=0.5, text/javascript"),xhr.send(formData)}function setHeight(e){var t=0;$.each(e.children(),function(){$(this).is(":visible")&&$(this).hasClass("sf")&&(t+=$(this).height())}),e.height(t+50+"px")}jQuery(document).ready(function(e){e(".chosen-search input[type=text]").css({"background-color":"white!important"}),setHeight(e("#p-edit")),setHeight(e("#j-create")),e("#needp").click(function(){alert("You are currently logged in as a Client, please log out to join our engine")}),e("#needc").click(function(){alert("You are currently logged in as a Provider, please log out to post a job")}),e("#tabs").tabs({}),e("#tabs").tabs("option",{selected:3,disabled:!0,hide:{effect:"fade",duration:150},show:{effect:"fade",duration:150}}),e("#tabs").hide(),e("#p-edit input[type=checkbox].d-check").each(function(){if(e(this).is(":checked")){e("#tabs").show();var t,a,i,s;i=e(this).val(),s=i.split("-").pop(),a=(new Date).getTime(),t=new RegExp(e(this).data("id"),"g"),e(".insert-".concat(s)).before(e(this).data("fields").replace(t,a)),e("#tabs").tabs("enable",i);var n=e('#tabs a[href="#'+e(this).val()+'"]').parent().index();e("#tabs").tabs("option","active",n)}}),e("#p-edit").find("input[type=checkbox].d-check").each(function(){e(this).bind("click",function(){if(e(this).is(":checked")){var t,a,i,s;i=e(this).val(),s=i.split("-").pop(),a=(new Date).getTime(),t=new RegExp(e(this).data("id"),"g"),e(".insert-".concat(s)).before(e(this).data("fields").replace(t,a)),e("#tabs").tabs("enable",i);var n=e('#tabs a[href="#'+e(this).val()+'"]').parent().index();e("#tabs").tabs("option","active",n)}else{e("#tabs #"+e(this).val()+" .ruhroh").prop("checked",!0),e("#tabs #"+e(this).val()+" fieldset").hide(),e("#tabs").tabs("disable",e(this).val());var n=e('#tabs a[href="#'+e(this).val()+'"]').parent().index();e("#tabs").tabs("option","active",n-1)}e("#p-edit input[type=checkbox].d-check").is(":checked")?e("#tabs").is(":visible")||e("#tabs").show():e("#tabs").hide()})}),e("form .add_fields").click(function(){time=(new Date).getTime(),regexp=new RegExp(e(this).data("id"),"g"),e(this).before(e(this).data("fields").replace(regexp,time)),event.preventDefault()}),jQuery(".datepicker").datepicker({showOtherMonths:!0,selectOtherMonths:!0,dayNamesMin:["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]}),e("#jobdates").daterangepicker({format:"MM/DD/YYYY"}),e("#jobdates").on("apply.daterangepicker",function(t,a){e("#startdatehidden").val(a.startDate.format("MM/DD/YYYY")),e("#enddatehidden").val(a.endDate.format("MM/DD/YYYY")),e("#jobdates").val("From "+a.startDate.format("MM/DD/YYYY")+" to "+a.endDate.format("MM/DD/YYYY"))}),e("#p-reg").find("#frb, #agb").each(function(){e(this).bind("click",function(){e("#btn-input").val(e(this).children(".ptype-btn").val())})}),e(".flp input[type=text]:not(.notme),.flp input[type=name],.flp input[type=email],.flp input[type=password],.flp textarea:not(.notme)").each(function(){if(!e(this).parent().hasClass("chosen-search")&&!e(this).parent().hasClass("search-field")){""!=e(this).val()&&(e(this).next().css("top","-25px"),e(this).next().addClass("focussed"),e(this).next().addClass("preset"));var t='<span class="ch">',a="</span>";e(this).next().html(t+e(this).next().html().split("").join(a+t)+a),e(".ch:contains(' ')").html("&nbsp;")}}),e(".flp input[type=text]:not(.notme),.flp input[type=name],.flp input[type=email],.flp input[type=password],.flp textarea:not(.notme)").focus(function(){e(this).parent().hasClass("chosen-search")||e(this).parent().hasClass("search-field")||e(this).next().addClass("focussed").children().stop(!0).each(e(this).next().hasClass("preset")?function(){e(this).delay(0).animate({top:"0px"},300,"easeOutBack")}:function(){e(this).delay(0).animate({top:"-25px"},300,"easeOutBack")})}),e(".flp input[type=text]:not(.notme),.flp input[type=name],.flp input[type=email],.flp input[type=password],.flp textarea:not(.notme)").blur(function(){e(this).parent().hasClass("chosen-search")||e(this).parent().hasClass("search-field")||""==e(this).val()&&e(this).next().removeClass("focussed").children().stop(!0).each(e(this).next().hasClass("preset")?function(){e(this).delay(0).animate({top:25},200,"easeInOutBack")}:function(){e(this).delay(0).animate({top:0},200,"easeInOutBack")})}),e(".flp input[type=text]:not(.notme),.flip input[type=name],.flp input[type=email],.flp input[type=password],.flp textarea:not(.notme)").change(function(){e(this).parent().hasClass("chosen-search")||e(this).parent().hasClass("search-field")||""==!e(this).val()&&"auto"==e(this).css("top")&&e(this).next().addClass("focussed").children().stop(!0).each(e(this).next().hasClass("preset")?function(){e(this).delay(0).animate({top:"0px"},300,"easeOutBack")}:function(){e(this).delay(0).animate({top:"-25px"},300,"easeOutBack")})}),e(".chosen-select").each(function(){e(this).chosen(e(this).parent().parent().hasClass("citystate")?{width:"150px"}:{width:"220px"})}),e(".uni-select").chosen({width:"500px"}),e("input[type=text]").addClass("form-control"),e("#p-edit #avatar-upload").change(function(){var t=new FileReader;t.readAsDataURL(this.files[0]),t.onload=function(t){e("#preview").html('<img src="'+t.target.result+'" id="prof" class="img-circle" width="200px" height="200px"">')}}),e("#c-edit #avatar-upload2").change(function(){var t=new FileReader;t.readAsDataURL(this.files[0]),t.onload=function(t){e("#preview2").html('<img src="'+t.target.result+'" id="prof" class="img-circle" width="200px" height="200px"">')}});var t,a,i,s,n;e(".next").click(function(){return n?!1:(n=!0,t=e(this).closest("fieldset.sf"),a=e(this).closest("fieldset.sf").next(),e("#progressbar li").eq(e("fieldset.sf").index(a)).addClass("active"),a.show(),void t.animate({opacity:0},{step:function(e){s=1-e,t.css({left:"50%",opacity:s}),a.css({left:"50%",opacity:s})},duration:800,complete:function(){t.hide(),n=!1,e("#p-edit").height(e(this).closest("fieldset.sf").next().height()+50+"px")},easing:"easeInOutBack"}))}),e(".previous").click(function(){return n?!1:(n=!0,t=e(this).closest("fieldset.sf"),i=e(this).closest("fieldset.sf").prev(),e("#progressbar li").eq(e("fieldset.sf").index(t)).removeClass("active"),i.show(),void t.animate({opacity:0},{step:function(e){s=1-e,t.css({left:"50%",opacity:s}),i.css({left:"50%",opacity:s})},duration:800,complete:function(){t.hide(),n=!1,e("#p-edit").height(e(this).closest("fieldset.sf").prev().height()+50+"px")},easing:"easeInOutBack"}))}),e(".clockpicker").clockpicker({donetext:"Set Time",twelvehour:!0}),e(".btn-file").click(function(){e(this).prev().click()}),e(".btn-file").prev().change(function(){if(e(this).hasClass("gotFile")||(e(this).next().html(e(this).next().html()+"<span>&nbsp;&nbsp;</span>"),e(this).next().html(e(this).next().html()+"<span style='color: #A1C436;' class='fa fa-check'></span>"),e(this).addClass("gotFile")),!e(this).next().hasClass("picup")){e(this).parent().find(".insert-prev").html("<span type='button' class='btn btn-default prev-btn' data-toggle='modal' data-target='#"+cleanUpSpecialChars(e(this).next().text().split(" ")[1].toLowerCase().trim())+"-prev'>Preview "+e(this).next().text().split(" ")[1]+"</span>");var t=this.files[0];e(this).closest(".jaxForm").find("#whichprev").data("previd",e(this).parent().next(".docprevtop").attr("id")),uploadFile(t,e(this).attr("name"),e(this).closest(".jaxForm").attr("action"),null,null,!1,e(this).closest(".jaxForm").find("#whichprev").data("method"))}}),e("#c-edit #usecheck").change(function(){e("#c-edit #usehidden").val(e(this).prop("checked"))}),e("#j-create .tooltipfield").tooltip({container:"#createsheet3"}),e(".badge").tooltip({container:"body"}),e("#exp-req").change(function(){}),e("#tier0 span,#tier1 span, #tier2 span, #tier3 span").hide(),e("#tier0 p,#tier1 p, #tier2 p, #tier3 p").hide(),e("#slider-vertical").slider({orientation:"vertical",range:"min",min:0,max:500,value:230,slide:function(t,a){e(this).find(".ui-slider-handle").text("$"+a.value)},create:function(){var t=e(this).slider("value");e(this).find(".ui-slider-handle").text("$"+t),e("#tier1").animate({width:"670"},{duration:600,completion:function(){}}),e("#tier1 span,#tier1 p").fadeIn(),e("#tier1").addClass("activeTier")},change:function(t,a){a.value<parseInt(e("#tier0").data("thresh"))?(e("#tier0").animate({width:"670"},{duration:600,completion:function(){}}),e("#tier0 span,#tier0 p").delay(400).fadeIn(),e("#tier0").addClass("activeTier")):(e("#tier0").delay(200).animate({width:"600"},{duration:600,completion:function(){}}),e("#tier0 span,#tier0 p").fadeOut(),e("#tier0").removeClass("activeTier")),a.value<parseInt(e("#tier1").data("thresh"))&&a.value>=parseInt(e("#tier0").data("thresh"))?(e("#tier1").animate({width:"670"},{duration:600,completion:function(){}}),e("#tier1 span,#tier1 p").delay(400).fadeIn(),e("#tier1").addClass("activeTier")):(e("#tier1").delay(200).animate({width:"500"},{duration:600,completion:function(){}}),e("#tier1 span,#tier1 p").fadeOut(),e("#tier1").removeClass("activeTier")),a.value<=parseInt(e("#tier2").data("thresh"))&&a.value>=parseInt(e("#tier1").data("thresh"))?(e("#tier2").animate({width:"670"},{duration:600,completion:function(){}}),e("#tier2 span,#tier2 p").delay(400).fadeIn(),e("#tier2").addClass("activeTier")):(e("#tier2").delay(200).animate({width:"400"},{duration:600,completion:function(){}}),e("#tier2 span,#tier2 p").fadeOut(),e("#tier2").removeClass("activeTier"))}});var r=700;delay=400;var o=210,p=!1;e(".rankdisplay").toggle();var c=function(e){var t="p1 p2 p3 p4";t=t.replace(e+" ","");var a=t.split(" "),i=a[Math.floor(Math.random()*a.length)];return i},l=function(){e("#p1").position().left>213||e("#p1").position().left<211?(e("#p1").swap({target:document.elementFromPoint(250,o).id,opacity:"1.0",speed:r}),setTimeout(d,r+delay)):d()},d=function(){e("#p2").position().left>587||e("#p2").position().left<585?(e("#p2").swap({target:document.elementFromPoint(600,o).id,opacity:"1.0",speed:r}),setTimeout(h,r+delay)):h()},h=function(){e("#p4").position().left>1335||e("#p4").position().left<1331?(e("#p4").swap({target:document.elementFromPoint(1348,o).id,opacity:"1.0",speed:r}),setTimeout(f,r/2)):f()},f=function(){e("#reorder").css("margin-left","508px"),e("#reorder").css("margin-right","-616px"),e("#reorder").text("Randomize"),e("#reorder").addClass("random"),p=!1},u=function(){e("#p1").swap({target:c("p1"),opacity:"1.0",speed:r}),setTimeout(m,r+delay)},m=function(){e("#p2").swap({target:c("p2"),opacity:"1.0",speed:r}),setTimeout(x,r+delay)},x=function(){e("#p3").swap({target:c("p3"),opacity:"1.0",speed:r}),setTimeout(v,r/2)},v=function(){e("#reorder").css("margin-left","472px"),e("#reorder").css("margin-right","-662px"),e("#reorder").text("Order by Quomp Ranking"),e("#reorder").removeClass("random"),p=!1};e("#reorder").click(function(){p||(p=!0,e(".rankdisplay").toggle(2e3),e(this).hasClass("random")?u():l())}),e(".ranked").next().next().next().find(".chosen-choices").sortable({items:".search-choice",update:function(){var t=1;e(this).find(".search-choice").each(function(){e(this).text(t.toString()+")"+e(this).text().split(")")[1]),t++}),t=0}}),e(".ranked").next().next().next().find(".chosen-choices").disableSelection()});