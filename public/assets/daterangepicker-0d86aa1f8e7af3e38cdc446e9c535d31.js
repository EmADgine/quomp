!function(t,e){if("function"==typeof define&&define.amd)define(["moment","jquery","exports"],function(a,i,s){t.daterangepicker=e(t,s,a,i)});else if("undefined"!=typeof exports){var a,i=require("moment");try{a=require("jquery")}catch(s){if(a=window.jQuery,!a)throw new Error("jQuery dependency not found")}e(t,exports,i,a)}else t.daterangepicker=e(t,{},t.momentjs,t.jQuery||t.Zepto||t.ender||t.$)}(this,function(t,e,a,i){var s=function(t,e,a){this.parentEl="body",this.element=i(t),this.isShowing=!1;var s='<div class="daterangepicker dropdown-menu"><div class="calendar left"></div><div class="calendar right"></div><div class="ranges"><div class="range_inputs"><div class="daterangepicker_start_input"><label for="daterangepicker_start"></label><input class="input-mini" type="text" name="daterangepicker_start" value="" /></div><div class="daterangepicker_end_input"><label for="daterangepicker_end"></label><input class="input-mini" type="text" name="daterangepicker_end" value="" /></div><button class="applyBtn" disabled="disabled"></button>&nbsp;<button class="cancelBtn"></button></div></div></div>';("object"!=typeof e||null===e)&&(e={}),this.parentEl=i("object"==typeof e&&e.parentEl&&i(e.parentEl).length?e.parentEl:this.parentEl),this.container=i(s).appendTo(this.parentEl),this.setOptions(e,a);var n=this.container;i.each(this.buttonClasses,function(t,e){n.find("button").addClass(e)}),this.container.find(".daterangepicker_start_input label").html(this.locale.fromLabel),this.container.find(".daterangepicker_end_input label").html(this.locale.toLabel),this.applyClass.length&&this.container.find(".applyBtn").addClass(this.applyClass),this.cancelClass.length&&this.container.find(".cancelBtn").addClass(this.cancelClass),this.container.find(".applyBtn").html(this.locale.applyLabel),this.container.find(".cancelBtn").html(this.locale.cancelLabel),this.container.find(".calendar").on("click.daterangepicker",".prev",i.proxy(this.clickPrev,this)).on("click.daterangepicker",".next",i.proxy(this.clickNext,this)).on("click.daterangepicker","td.available",i.proxy(this.clickDate,this)).on("mouseenter.daterangepicker","td.available",i.proxy(this.hoverDate,this)).on("mouseleave.daterangepicker","td.available",i.proxy(this.updateFormInputs,this)).on("change.daterangepicker","select.yearselect",i.proxy(this.updateMonthYear,this)).on("change.daterangepicker","select.monthselect",i.proxy(this.updateMonthYear,this)).on("change.daterangepicker","select.hourselect,select.minuteselect,select.ampmselect",i.proxy(this.updateTime,this)),this.container.find(".ranges").on("click.daterangepicker","button.applyBtn",i.proxy(this.clickApply,this)).on("click.daterangepicker","button.cancelBtn",i.proxy(this.clickCancel,this)).on("click.daterangepicker",".daterangepicker_start_input,.daterangepicker_end_input",i.proxy(this.showCalendars,this)).on("change.daterangepicker",".daterangepicker_start_input,.daterangepicker_end_input",i.proxy(this.inputsChanged,this)).on("keydown.daterangepicker",".daterangepicker_start_input,.daterangepicker_end_input",i.proxy(this.inputsKeydown,this)).on("click.daterangepicker","li",i.proxy(this.clickRange,this)).on("mouseenter.daterangepicker","li",i.proxy(this.enterRange,this)).on("mouseleave.daterangepicker","li",i.proxy(this.updateFormInputs,this)),this.element.is("input")?this.element.on({"click.daterangepicker":i.proxy(this.show,this),"focus.daterangepicker":i.proxy(this.show,this),"keyup.daterangepicker":i.proxy(this.updateFromControl,this)}):this.element.on("click.daterangepicker",i.proxy(this.toggle,this))};s.prototype={constructor:s,setOptions:function(t,e){if(this.startDate=moment().startOf("day"),this.endDate=moment().endOf("day"),this.minDate=!1,this.maxDate=!1,this.dateLimit=!1,this.showDropdowns=!1,this.showWeekNumbers=!1,this.timePicker=!1,this.timePickerIncrement=30,this.timePicker12Hour=!0,this.singleDatePicker=!1,this.ranges={},this.opens="right",this.element.hasClass("pull-right")&&(this.opens="left"),this.buttonClasses=["btn","btn-small btn-sm"],this.applyClass="btn-success",this.cancelClass="btn-default",this.format="MM/DD/YYYY",this.separator=" - ",this.locale={applyLabel:"Apply",cancelLabel:"Cancel",fromLabel:"From",toLabel:"To",weekLabel:"W",customRangeLabel:"Custom Range",daysOfWeek:moment()._lang._weekdaysMin.slice(),monthNames:moment()._lang._monthsShort.slice(),firstDay:moment()._lang._week.dow},this.cb=function(){},"string"==typeof t.format&&(this.format=t.format),"string"==typeof t.separator&&(this.separator=t.separator),"string"==typeof t.startDate&&(this.startDate=moment(t.startDate,this.format)),"string"==typeof t.endDate&&(this.endDate=moment(t.endDate,this.format)),"string"==typeof t.minDate&&(this.minDate=moment(t.minDate,this.format)),"string"==typeof t.maxDate&&(this.maxDate=moment(t.maxDate,this.format)),"object"==typeof t.startDate&&(this.startDate=moment(t.startDate)),"object"==typeof t.endDate&&(this.endDate=moment(t.endDate)),"object"==typeof t.minDate&&(this.minDate=moment(t.minDate)),"object"==typeof t.maxDate&&(this.maxDate=moment(t.maxDate)),"string"==typeof t.applyClass&&(this.applyClass=t.applyClass),"string"==typeof t.cancelClass&&(this.cancelClass=t.cancelClass),"object"==typeof t.dateLimit&&(this.dateLimit=t.dateLimit),"object"==typeof t.locale&&("object"==typeof t.locale.daysOfWeek&&(this.locale.daysOfWeek=t.locale.daysOfWeek.slice()),"object"==typeof t.locale.monthNames&&(this.locale.monthNames=t.locale.monthNames.slice()),"number"==typeof t.locale.firstDay&&(this.locale.firstDay=t.locale.firstDay),"string"==typeof t.locale.applyLabel&&(this.locale.applyLabel=t.locale.applyLabel),"string"==typeof t.locale.cancelLabel&&(this.locale.cancelLabel=t.locale.cancelLabel),"string"==typeof t.locale.fromLabel&&(this.locale.fromLabel=t.locale.fromLabel),"string"==typeof t.locale.toLabel&&(this.locale.toLabel=t.locale.toLabel),"string"==typeof t.locale.weekLabel&&(this.locale.weekLabel=t.locale.weekLabel),"string"==typeof t.locale.customRangeLabel&&(this.locale.customRangeLabel=t.locale.customRangeLabel)),"string"==typeof t.opens&&(this.opens=t.opens),"boolean"==typeof t.showWeekNumbers&&(this.showWeekNumbers=t.showWeekNumbers),"string"==typeof t.buttonClasses&&(this.buttonClasses=[t.buttonClasses]),"object"==typeof t.buttonClasses&&(this.buttonClasses=t.buttonClasses),"boolean"==typeof t.showDropdowns&&(this.showDropdowns=t.showDropdowns),"boolean"==typeof t.singleDatePicker&&(this.singleDatePicker=t.singleDatePicker),"boolean"==typeof t.timePicker&&(this.timePicker=t.timePicker),"number"==typeof t.timePickerIncrement&&(this.timePickerIncrement=t.timePickerIncrement),"boolean"==typeof t.timePicker12Hour&&(this.timePicker12Hour=t.timePicker12Hour),0!=this.locale.firstDay)for(var a=this.locale.firstDay;a>0;)this.locale.daysOfWeek.push(this.locale.daysOfWeek.shift()),a--;var s,n,r;if("undefined"==typeof t.startDate&&"undefined"==typeof t.endDate&&i(this.element).is("input[type=text]")){var o=i(this.element).val(),h=o.split(this.separator);s=n=null,2==h.length?(s=moment(h[0],this.format),n=moment(h[1],this.format)):this.singleDatePicker&&(s=moment(o,this.format),n=moment(o,this.format)),null!==s&&null!==n&&(this.startDate=s,this.endDate=n)}if("object"==typeof t.ranges){for(r in t.ranges)s=moment(t.ranges[r][0]),n=moment(t.ranges[r][1]),this.minDate&&s.isBefore(this.minDate)&&(s=moment(this.minDate)),this.maxDate&&n.isAfter(this.maxDate)&&(n=moment(this.maxDate)),this.minDate&&n.isBefore(this.minDate)||this.maxDate&&s.isAfter(this.maxDate)||(this.ranges[r]=[s,n]);var l="<ul>";for(r in this.ranges)l+="<li>"+r+"</li>";l+="<li>"+this.locale.customRangeLabel+"</li>",l+="</ul>",this.container.find(".ranges ul").remove(),this.container.find(".ranges").prepend(l)}if("function"==typeof e&&(this.cb=e),this.timePicker||(this.startDate=this.startDate.startOf("day"),this.endDate=this.endDate.endOf("day")),this.singleDatePicker?(this.opens="right",this.container.find(".calendar.right").show(),this.container.find(".calendar.left").hide(),this.container.find(".ranges").hide(),this.container.find(".calendar.right").hasClass("single")||this.container.find(".calendar.right").addClass("single")):(this.container.find(".calendar.right").removeClass("single"),this.container.find(".ranges").show()),this.oldStartDate=this.startDate.clone(),this.oldEndDate=this.endDate.clone(),this.oldChosenLabel=this.chosenLabel,this.leftCalendar={month:moment([this.startDate.year(),this.startDate.month(),1,this.startDate.hour(),this.startDate.minute()]),calendar:[]},this.rightCalendar={month:moment([this.endDate.year(),this.endDate.month(),1,this.endDate.hour(),this.endDate.minute()]),calendar:[]},"right"==this.opens){var d=this.container.find(".calendar.left"),c=this.container.find(".calendar.right");d.removeClass("left").addClass("right"),c.removeClass("right").addClass("left")}"undefined"!=typeof t.ranges||this.singleDatePicker||this.container.addClass("show-calendar"),this.container.addClass("opens"+this.opens),this.updateView(),this.updateCalendars()},setStartDate:function(t){"string"==typeof t&&(this.startDate=moment(t,this.format)),"object"==typeof t&&(this.startDate=moment(t)),this.timePicker||(this.startDate=this.startDate.startOf("day")),this.oldStartDate=this.startDate.clone(),this.updateView(),this.updateCalendars(),this.updateInputText()},setEndDate:function(t){"string"==typeof t&&(this.endDate=moment(t,this.format)),"object"==typeof t&&(this.endDate=moment(t)),this.timePicker||(this.endDate=this.endDate.endOf("day")),this.oldEndDate=this.endDate.clone(),this.updateView(),this.updateCalendars(),this.updateInputText()},updateView:function(){this.leftCalendar.month.month(this.startDate.month()).year(this.startDate.year()).hour(this.startDate.hour()).minute(this.startDate.minute()),this.rightCalendar.month.month(this.endDate.month()).year(this.endDate.year()).hour(this.endDate.hour()).minute(this.endDate.minute()),this.updateFormInputs()},updateFormInputs:function(){this.container.find("input[name=daterangepicker_start]").val(this.startDate.format(this.format)),this.container.find("input[name=daterangepicker_end]").val(this.endDate.format(this.format)),this.startDate.isSame(this.endDate)||this.startDate.isBefore(this.endDate)?this.container.find("button.applyBtn").removeAttr("disabled"):this.container.find("button.applyBtn").attr("disabled","disabled")},updateFromControl:function(){if(this.element.is("input")&&this.element.val().length){var t=this.element.val().split(this.separator),e=null,a=null;2===t.length&&(e=moment(t[0],this.format),a=moment(t[1],this.format)),(this.singleDatePicker||null===e||null===a)&&(e=moment(this.element.val(),this.format),a=e),a.isBefore(e)||(this.oldStartDate=this.startDate.clone(),this.oldEndDate=this.endDate.clone(),this.startDate=e,this.endDate=a,this.startDate.isSame(this.oldStartDate)&&this.endDate.isSame(this.oldEndDate)||this.notify(),this.updateCalendars())}},notify:function(){this.updateView(),this.cb(this.startDate,this.endDate,this.chosenLabel)},move:function(){var t={top:0,left:0};this.parentEl.is("body")||(t={top:this.parentEl.offset().top-this.parentEl.scrollTop(),left:this.parentEl.offset().left-this.parentEl.scrollLeft()}),"left"==this.opens?(this.container.css({top:this.element.offset().top+this.element.outerHeight()-t.top,right:i(window).width()-this.element.offset().left-this.element.outerWidth()-t.left,left:"auto"}),this.container.offset().left<0&&this.container.css({right:"auto",left:9})):(this.container.css({top:this.element.offset().top+this.element.outerHeight()-t.top,left:this.element.offset().left-t.left,right:"auto"}),this.container.offset().left+this.container.outerWidth()>i(window).width()&&this.container.css({left:"auto",right:0}))},toggle:function(){this.element.hasClass("active")?this.hide():this.show()},show:function(){this.isShowing||(this.element.addClass("active"),this.container.show(),this.move(),this._outsideClickProxy=i.proxy(function(t){this.outsideClick(t)},this),i(document).on("mousedown.daterangepicker",this._outsideClickProxy).on("click.daterangepicker","[data-toggle=dropdown]",this._outsideClickProxy).on("focusin.daterangepicker",this._outsideClickProxy),this.isShowing=!0,this.element.trigger("show.daterangepicker",this))},outsideClick:function(t){var e=i(t.target);e.closest(this.element).length||e.closest(this.container).length||e.closest(".calendar-date").length||this.hide()},hide:function(){this.isShowing&&(i(document).off("mousedown.daterangepicker").off("click.daterangepicker","[data-toggle=dropdown]").off("focusin.daterangepicker"),this.element.removeClass("active"),this.container.hide(),this.startDate.isSame(this.oldStartDate)&&this.endDate.isSame(this.oldEndDate)||this.notify(),this.oldStartDate=this.startDate.clone(),this.oldEndDate=this.endDate.clone(),this.isShowing=!1,this.element.trigger("hide.daterangepicker",this))},enterRange:function(t){var e=t.target.innerHTML;if(e==this.locale.customRangeLabel)this.updateView();else{var a=this.ranges[e];this.container.find("input[name=daterangepicker_start]").val(a[0].format(this.format)),this.container.find("input[name=daterangepicker_end]").val(a[1].format(this.format))}},showCalendars:function(){this.container.addClass("show-calendar"),this.move(),this.element.trigger("showCalendar.daterangepicker",this)},hideCalendars:function(){this.container.removeClass("show-calendar"),this.element.trigger("hideCalendar.daterangepicker",this)},inputsChanged:function(t){var e=i(t.target),a=moment(e.val());if(a.isValid()){var s,n;"daterangepicker_start"===e.attr("name")?(s=a,n=this.endDate):(s=this.startDate,n=a),this.setCustomDates(s,n)}},inputsKeydown:function(t){13===t.keyCode&&(this.inputsChanged(t),this.notify())},updateInputText:function(){this.element.is("input")&&!this.singleDatePicker?this.element.val(this.startDate.format(this.format)+this.separator+this.endDate.format(this.format)):this.element.is("input")&&this.element.val(this.startDate.format(this.format))},clickRange:function(t){var e=t.target.innerHTML;if(this.chosenLabel=e,e==this.locale.customRangeLabel)this.showCalendars();else{var a=this.ranges[e];this.startDate=a[0],this.endDate=a[1],this.timePicker||(this.startDate.startOf("day"),this.endDate.endOf("day")),this.leftCalendar.month.month(this.startDate.month()).year(this.startDate.year()).hour(this.startDate.hour()).minute(this.startDate.minute()),this.rightCalendar.month.month(this.endDate.month()).year(this.endDate.year()).hour(this.endDate.hour()).minute(this.endDate.minute()),this.updateCalendars(),this.updateInputText(),this.hideCalendars(),this.hide(),this.element.trigger("apply.daterangepicker",this)}},clickPrev:function(t){var e=i(t.target).parents(".calendar");e.hasClass("left")?this.leftCalendar.month.subtract("month",1):this.rightCalendar.month.subtract("month",1),this.updateCalendars()},clickNext:function(t){var e=i(t.target).parents(".calendar");e.hasClass("left")?this.leftCalendar.month.add("month",1):this.rightCalendar.month.add("month",1),this.updateCalendars()},hoverDate:function(t){var e=i(t.target).attr("data-title"),a=e.substr(1,1),s=e.substr(3,1),n=i(t.target).parents(".calendar");n.hasClass("left")?this.container.find("input[name=daterangepicker_start]").val(this.leftCalendar.calendar[a][s].format(this.format)):this.container.find("input[name=daterangepicker_end]").val(this.rightCalendar.calendar[a][s].format(this.format))},setCustomDates:function(t,e){if(this.chosenLabel=this.locale.customRangeLabel,t.isAfter(e)){var a=this.endDate.diff(this.startDate);e=moment(t).add("ms",a)}this.startDate=t,this.endDate=e,this.updateView(),this.updateCalendars()},clickDate:function(t){var e,a,s=i(t.target).attr("data-title"),n=s.substr(1,1),r=s.substr(3,1),o=i(t.target).parents(".calendar");if(o.hasClass("left")){if(e=this.leftCalendar.calendar[n][r],a=this.endDate,"object"==typeof this.dateLimit){var h=moment(e).add(this.dateLimit).startOf("day");a.isAfter(h)&&(a=h)}}else if(e=this.startDate,a=this.rightCalendar.calendar[n][r],"object"==typeof this.dateLimit){var l=moment(a).subtract(this.dateLimit).startOf("day");e.isBefore(l)&&(e=l)}this.singleDatePicker&&o.hasClass("left")?a=e.clone():this.singleDatePicker&&o.hasClass("right")&&(e=a.clone()),o.find("td").removeClass("active"),i(t.target).addClass("active"),this.setCustomDates(e,a),this.timePicker||a.endOf("day"),this.singleDatePicker&&this.clickApply(),this.element.trigger("apply.daterangepicker",this)},clickApply:function(){this.updateInputText(),this.hide(),this.element.trigger("apply.daterangepicker",this)},clickCancel:function(){this.startDate=this.oldStartDate,this.endDate=this.oldEndDate,this.chosenLabel=this.oldChosenLabel,this.updateView(),this.updateCalendars(),this.hide(),this.element.trigger("cancel.daterangepicker",this)},updateMonthYear:function(t){var e=i(t.target).closest(".calendar").hasClass("left"),a=e?"left":"right",s=this.container.find(".calendar."+a),n=parseInt(s.find(".monthselect").val(),10),r=s.find(".yearselect").val();this[a+"Calendar"].month.month(n).year(r),this.updateCalendars()},updateTime:function(t){var e=i(t.target).closest(".calendar"),a=e.hasClass("left"),s=parseInt(e.find(".hourselect").val(),10),n=parseInt(e.find(".minuteselect").val(),10);if(this.timePicker12Hour){var r=e.find(".ampmselect").val();"PM"===r&&12>s&&(s+=12),"AM"===r&&12===s&&(s=0)}if(a){var o=this.startDate.clone();o.hour(s),o.minute(n),this.startDate=o,this.leftCalendar.month.hour(s).minute(n)}else{var h=this.endDate.clone();h.hour(s),h.minute(n),this.endDate=h,this.rightCalendar.month.hour(s).minute(n)}this.updateCalendars()},updateCalendars:function(){this.leftCalendar.calendar=this.buildCalendar(this.leftCalendar.month.month(),this.leftCalendar.month.year(),this.leftCalendar.month.hour(),this.leftCalendar.month.minute(),"left"),this.rightCalendar.calendar=this.buildCalendar(this.rightCalendar.month.month(),this.rightCalendar.month.year(),this.rightCalendar.month.hour(),this.rightCalendar.month.minute(),"right"),this.container.find(".calendar.left").empty().html(this.renderCalendar(this.leftCalendar.calendar,this.startDate,this.minDate,this.maxDate)),this.container.find(".calendar.right").empty().html(this.renderCalendar(this.rightCalendar.calendar,this.endDate,this.startDate,this.maxDate)),this.container.find(".ranges li").removeClass("active");var t=!0,e=0;for(var a in this.ranges)this.timePicker?this.startDate.isSame(this.ranges[a][0])&&this.endDate.isSame(this.ranges[a][1])&&(t=!1,this.chosenLabel=this.container.find(".ranges li:eq("+e+")").addClass("active").html()):this.startDate.format("YYYY-MM-DD")==this.ranges[a][0].format("YYYY-MM-DD")&&this.endDate.format("YYYY-MM-DD")==this.ranges[a][1].format("YYYY-MM-DD")&&(t=!1,this.chosenLabel=this.container.find(".ranges li:eq("+e+")").addClass("active").html()),e++;t&&(this.chosenLabel=this.container.find(".ranges li:last").addClass("active").html(),this.showCalendars())},buildCalendar:function(t,e,a,i){var s,n=moment([e,t]).daysInMonth(),r=moment([e,t,1]),o=moment([e,t,n]),h=moment(r).subtract("month",1).month(),l=moment(r).subtract("month",1).year(),d=moment([l,h]).daysInMonth(),c=r.day(),m=[];for(m.firstDay=r,m.lastDay=o,s=0;6>s;s++)m[s]=[];var p=d-c+this.locale.firstDay+1;p>d&&(p-=7),c==this.locale.firstDay&&(p=d-6);var f,u,g=moment([l,h,p,12,i]);for(s=0,f=0,u=0;42>s;s++,f++,g=moment(g).add("hour",24))s>0&&f%7===0&&(f=0,u++),m[u][f]=g.clone().hour(a),g.hour(12);return m},renderDropdowns:function(t,e,a){for(var i=t.month(),s='<select class="monthselect">',n=!1,r=!1,o=0;12>o;o++)(!n||o>=e.month())&&(!r||o<=a.month())&&(s+="<option value='"+o+"'"+(o===i?" selected='selected'":"")+">"+this.locale.monthNames[o]+"</option>");s+="</select>";for(var h=t.year(),l=a&&a.year()||h+5,d=e&&e.year()||h-50,c='<select class="yearselect">',m=d;l>=m;m++)c+='<option value="'+m+'"'+(m===h?' selected="selected"':"")+">"+m+"</option>";return c+="</select>",s+c},renderCalendar:function(t,e,a,s){var n='<div class="calendar-date">';n+='<table class="table-condensed">',n+="<thead>",n+="<tr>",this.showWeekNumbers&&(n+="<th></th>"),n+=!a||a.isBefore(t.firstDay)?'<th class="prev available"><i class="fa fa-arrow-left icon-arrow-left glyphicon glyphicon-arrow-left"></i></th>':"<th></th>";var r=this.locale.monthNames[t[1][1].month()]+t[1][1].format(" YYYY");this.showDropdowns&&(r=this.renderDropdowns(t[1][1],a,s)),n+='<th colspan="5" class="month">'+r+"</th>",n+=!s||s.isAfter(t.lastDay)?'<th class="next available"><i class="fa fa-arrow-right icon-arrow-right glyphicon glyphicon-arrow-right"></i></th>':"<th></th>",n+="</tr>",n+="<tr>",this.showWeekNumbers&&(n+='<th class="week">'+this.locale.weekLabel+"</th>"),i.each(this.locale.daysOfWeek,function(t,e){n+="<th>"+e+"</th>"}),n+="</tr>",n+="</thead>",n+="<tbody>";for(var o=0;6>o;o++){n+="<tr>",this.showWeekNumbers&&(n+='<td class="week">'+t[o][0].week()+"</td>");for(var h=0;7>h;h++){var l="available ";l+=t[o][h].month()==t[1][1].month()?"":"off",a&&t[o][h].isBefore(a,"day")||s&&t[o][h].isAfter(s,"day")?l=" off disabled ":t[o][h].format("YYYY-MM-DD")==e.format("YYYY-MM-DD")?(l+=" active ",t[o][h].format("YYYY-MM-DD")==this.startDate.format("YYYY-MM-DD")&&(l+=" start-date "),t[o][h].format("YYYY-MM-DD")==this.endDate.format("YYYY-MM-DD")&&(l+=" end-date ")):t[o][h]>=this.startDate&&t[o][h]<=this.endDate&&(l+=" in-range ",t[o][h].isSame(this.startDate)&&(l+=" start-date "),t[o][h].isSame(this.endDate)&&(l+=" end-date "));var d="r"+o+"c"+h;n+='<td class="'+l.replace(/\s+/g," ").replace(/^\s?(.*?)\s?$/,"$1")+'" data-title="'+d+'">'+t[o][h].date()+"</td>"}n+="</tr>"}n+="</tbody>",n+="</table>",n+="</div>";var c;if(this.timePicker){n+='<div class="calendar-time">',n+='<select class="hourselect">';var m=0,p=23,f=e.hour();for(this.timePicker12Hour&&(m=1,p=12,f>=12&&(f-=12),0===f&&(f=12)),c=m;p>=c;c++)n+=c==f?'<option value="'+c+'" selected="selected">'+c+"</option>":'<option value="'+c+'">'+c+"</option>";for(n+="</select> : ",n+='<select class="minuteselect">',c=0;60>c;c+=this.timePickerIncrement){var u=c;10>u&&(u="0"+u),n+=c==e.minute()?'<option value="'+c+'" selected="selected">'+u+"</option>":'<option value="'+c+'">'+u+"</option>"}n+="</select> ",this.timePicker12Hour&&(n+='<select class="ampmselect">',n+=e.hour()>=12?'<option value="AM">AM</option><option value="PM" selected="selected">PM</option>':'<option value="AM" selected="selected">AM</option><option value="PM">PM</option>',n+="</select>"),n+="</div>"}return n},remove:function(){this.container.remove(),this.element.off(".daterangepicker"),this.element.removeData("daterangepicker")}},i.fn.daterangepicker=function(t,e){return this.each(function(){var a=i(this);a.data("daterangepicker")&&a.data("daterangepicker").remove(),a.data("daterangepicker",new s(a,t,e))}),this}});