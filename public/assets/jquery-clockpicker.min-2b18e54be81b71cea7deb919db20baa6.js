/*!
 * ClockPicker v0.0.6 (http://weareoutman.github.io/clockpicker/)
 * Copyright 2014 Wang Shenwei.
 * Licensed under MIT (https://github.com/weareoutman/clockpicker/blob/master/LICENSE)
 */

!function(){function t(t){return document.createElementNS(a,t)}function i(t){return(10>t?"0":"")+t}function e(t){var i=++v+"";return t?t+i:i}function s(s,n){function a(t,i){var e=l.offset(),s=/^touch/.test(t.type),c=e.left+g,a=e.top+g,p=(s?t.originalEvent.touches[0]:t).pageX-c,u=(s?t.originalEvent.touches[0]:t).pageY-a,f=Math.sqrt(p*p+u*u),v=!1;if(!i||!(m-w>f||f>m+w)){t.preventDefault();var b=setTimeout(function(){o.addClass("clockpicker-moving")},200);h&&l.append(H.canvas),H.setHand(p,u,!i,!0),r.off(d).on(d,function(t){t.preventDefault();var i=/^touch/.test(t.type),e=(i?t.originalEvent.touches[0]:t).pageX-c,s=(i?t.originalEvent.touches[0]:t).pageY-a;(v||e!==p||s!==u)&&(v=!0,H.setHand(e,s,!1,!0))}),r.off(k).one(k,function(t){t.preventDefault();var e=/^touch/.test(t.type),s=(e?t.originalEvent.changedTouches[0]:t).pageX-c,h=(e?t.originalEvent.changedTouches[0]:t).pageY-a;(i||v)&&s===p&&h===u&&H.setHand(s,h),"hours"===H.currentView?H.toggleView("minutes",A/2):n.autoclose&&(H.minutesView.addClass("clockpicker-dial-out"),setTimeout(function(){H.done()},A/2)),l.prepend(z),clearTimeout(b),o.removeClass("clockpicker-moving"),r.off(d)})}}var p=c(M),l=p.find(".clockpicker-plate"),f=p.find(".clockpicker-hours"),v=p.find(".clockpicker-minutes"),V="INPUT"===s.prop("tagName"),T=V?s:s.find("input"),C=s.find(".input-group-addon"),H=this;this.id=e("cp"),this.element=s,this.options=n,this.isAppended=!1,this.isShown=!1,this.currentView="hours",this.isInput=V,this.input=T,this.addon=C,this.popover=p,this.plate=l,this.hoursView=f,this.minutesView=v,this.spanHours=p.find(".clockpicker-span-hours"),this.spanMinutes=p.find(".clockpicker-span-minutes"),n.autoclose||c('<button type="button" class="btn btn-sm btn-default btn-block clockpicker-button">'+n.donetext+"</button>").click(c.proxy(this.done,this)).appendTo(p),"top"!==n.placement&&"bottom"!==n.placement||"top"!==n.align&&"bottom"!==n.align||(n.align="left"),"left"!==n.placement&&"right"!==n.placement||"left"!==n.align&&"right"!==n.align||(n.align="top"),p.addClass(n.placement),p.addClass("clockpicker-align-"+n.align),this.spanHours.click(c.proxy(this.toggleView,this,"hours")),this.spanMinutes.click(c.proxy(this.toggleView,this,"minutes")),T.on("focus.clockpicker click.clockpicker",c.proxy(this.show,this)),C.on("click.clockpicker",c.proxy(this.toggle,this));var x,E,S,I=c('<div class="clockpicker-tick"></div>');for(x=0;24>x;x+=1){E=I.clone(),S=x/6*Math.PI;var D=x>0&&13>x,P=D?b:m;E.css({left:g+Math.sin(S)*P-w,top:g-Math.cos(S)*P-w}),D&&E.css("font-size","120%"),E.html(0===x?"00":x),f.append(E),E.on(u,a)}for(x=0;60>x;x+=5)E=I.clone(),S=x/30*Math.PI,E.css({left:g+Math.sin(S)*m-w,top:g-Math.cos(S)*m-w}),E.css("font-size","120%"),E.html(i(x)),v.append(E),E.on(u,a);if(l.on(u,function(t){0===c(t.target).closest(".clockpicker-tick").length&&a(t,!0)}),h){var z=p.find(".clockpicker-canvas"),B=t("svg");B.setAttribute("class","clockpicker-svg"),B.setAttribute("width",y),B.setAttribute("height",y);var L=t("g");L.setAttribute("transform","translate("+g+","+g+")");var U=t("circle");U.setAttribute("class","clockpicker-canvas-bearing"),U.setAttribute("cx",0),U.setAttribute("cy",0),U.setAttribute("r",2);var W=t("line");W.setAttribute("x1",0),W.setAttribute("y1",0);var j=t("circle");j.setAttribute("class","clockpicker-canvas-bg"),j.setAttribute("r",w);var N=t("circle");N.setAttribute("class","clockpicker-canvas-fg"),N.setAttribute("r",3.5),L.appendChild(W),L.appendChild(j),L.appendChild(N),L.appendChild(U),B.appendChild(L),z.append(B),this.hand=W,this.bg=j,this.fg=N,this.bearing=U,this.g=L,this.canvas=z}}var o,c=window.jQuery,n=c(window),r=c(document),a="http://www.w3.org/2000/svg",h="SVGAngle"in window&&function(){var t,i=document.createElement("div");return i.innerHTML="<svg/>",t=(i.firstChild&&i.firstChild.namespaceURI)==a,i.innerHTML="",t}(),p=function(){var t=document.createElement("div").style;return"transition"in t||"WebkitTransition"in t||"MozTransition"in t||"msTransition"in t||"OTransition"in t}(),l="ontouchstart"in window,u="mousedown"+(l?" touchstart":""),d="mousemove.clockpicker"+(l?" touchmove.clockpicker":""),k="mouseup.clockpicker"+(l?" touchend.clockpicker":""),f=navigator.vibrate?"vibrate":navigator.webkitVibrate?"webkitVibrate":null,v=0,g=100,m=80,b=54,w=13,y=2*g,A=p?350:1,M=['<div class="popover clockpicker-popover">','<div class="arrow"></div>','<div class="popover-title">','<span class="clockpicker-span-hours text-primary"></span>'," : ",'<span class="clockpicker-span-minutes"></span>',"</div>",'<div class="popover-content">','<div class="clockpicker-plate">','<div class="clockpicker-canvas"></div>','<div class="clockpicker-dial clockpicker-hours"></div>','<div class="clockpicker-dial clockpicker-minutes clockpicker-dial-out"></div>',"</div>","</div>","</div>"].join("");s.DEFAULTS={"default":"",fromnow:0,placement:"bottom",align:"left",donetext:"完成",autoclose:!1,vibrate:!0},s.prototype.toggle=function(){this[this.isShown?"hide":"show"]()},s.prototype.locate=function(){var t=this.element,i=this.popover,e=t.offset(),s=t.outerWidth(),o=t.outerHeight(),c=this.options.placement,n=this.options.align,r={};switch(i.show(),c){case"bottom":r.top=e.top+o;break;case"right":r.left=e.left+s;break;case"top":r.top=e.top-i.outerHeight();break;case"left":r.left=e.left-i.outerWidth()}switch(n){case"left":r.left=e.left;break;case"right":r.left=e.left+s-i.outerWidth();break;case"top":r.top=e.top;break;case"bottom":r.top=e.top+o-i.outerHeight()}i.css(r)},s.prototype.show=function(){if(!this.isShown){var t=this;this.isAppended||(o=c(document.body).append(this.popover),n.on("resize.clockpicker"+this.id,function(){t.isShown&&t.locate()}),this.isAppended=!0);var e=((this.input.prop("value")||this.options["default"]||"")+"").split(":");if("now"===e[0]){var s=new Date(+new Date+this.options.fromnow);e=[s.getHours(),s.getMinutes()]}this.hours=+e[0]||0,this.minutes=+e[1]||0,this.spanHours.html(i(this.hours)),this.spanMinutes.html(i(this.minutes)),this.toggleView("hours"),this.locate(),this.isShown=!0,r.on("click.clockpicker."+this.id+" focusin.clockpicker."+this.id,function(i){var e=c(i.target);0===e.closest(t.popover).length&&0===e.closest(t.addon).length&&0===e.closest(t.input).length&&t.hide()}),r.on("keyup.clockpicker."+this.id,function(i){27===i.keyCode&&t.hide()})}},s.prototype.hide=function(){this.isShown=!1,r.off("click.clockpicker."+this.id+" focusin.clockpicker."+this.id),r.off("keyup.clockpicker."+this.id),this.popover.hide()},s.prototype.toggleView=function(t,i){var e="hours"===t,s=e?this.hoursView:this.minutesView,o=e?this.minutesView:this.hoursView;this.currentView=t,this.spanHours.toggleClass("text-primary",e),this.spanMinutes.toggleClass("text-primary",!e),o.addClass("clockpicker-dial-out"),s.css("visibility","visible").removeClass("clockpicker-dial-out"),this.resetClock(i),clearTimeout(this.toggleViewTimer),this.toggleViewTimer=setTimeout(function(){o.css("visibility","hidden")},A)},s.prototype.resetClock=function(t){var i=this.currentView,e=this[i],s="hours"===i,o=Math.PI/(s?6:30),c=e*o,n=s&&e>0&&13>e?b:m,r=Math.sin(c)*n,a=-Math.cos(c)*n,p=this;h&&t?(p.canvas.addClass("clockpicker-canvas-out"),setTimeout(function(){p.canvas.removeClass("clockpicker-canvas-out"),p.setHand(r,a)},t)):this.setHand(r,a)},s.prototype.setHand=function(t,e,s,o){var n,r=Math.atan2(t,-e),a="hours"===this.currentView,p=Math.PI/(a||s?6:30),l=Math.sqrt(t*t+e*e),u=(this.options,a&&(m+b)/2>l),d=u?b:m;if(0>r&&(r=2*Math.PI+r),n=Math.round(r/p),r=n*p,a?(12===n&&(n=0),n=u?0===n?12:n:0===n?0:n+12):(s&&(n*=5),60===n&&(n=0)),this[this.currentView]!==n&&f&&this.options.vibrate&&(this.vibrateTimer||(navigator[f](10),this.vibrateTimer=setTimeout(c.proxy(function(){this.vibrateTimer=null},this),100))),this[this.currentView]=n,this[a?"spanHours":"spanMinutes"].html(i(n)),!h)return void this[a?"hoursView":"minutesView"].find(".clockpicker-tick").each(function(){var t=c(this);t.toggleClass("active",n===+t.html())});o||!a&&n%5?(this.g.insertBefore(this.hand,this.bearing),this.g.insertBefore(this.bg,this.fg),this.bg.setAttribute("class","clockpicker-canvas-bg clockpicker-canvas-bg-trans")):(this.g.insertBefore(this.hand,this.bg),this.g.insertBefore(this.fg,this.bg),this.bg.setAttribute("class","clockpicker-canvas-bg"));var k=Math.sin(r)*d,v=-Math.cos(r)*d;this.hand.setAttribute("x2",k),this.hand.setAttribute("y2",v),this.bg.setAttribute("cx",k),this.bg.setAttribute("cy",v),this.fg.setAttribute("cx",k),this.fg.setAttribute("cy",v)},s.prototype.done=function(){this.hide();var t=this.input.prop("value"),e=i(this.hours)+":"+i(this.minutes);this.input.prop("value",e),e!==t&&(this.input.triggerHandler("change"),this.isInput||this.element.trigger("change"))},s.prototype.remove=function(){this.element.removeData("clockpicker"),this.input.off("focus.clockpicker click.clockpicker"),this.addon.off("click.clockpicker"),this.isShown&&this.hide(),this.isAppended&&(n.off("resize.clockpicker"+this.id),this.popover.remove())},c.fn.clockpicker=function(t){var i=Array.prototype.slice.call(arguments,1);return this.each(function(){var e=c(this),o=e.data("clockpicker");if(o)"function"==typeof o[t]&&o[t].apply(o,i);else{var n=c.extend({},s.DEFAULTS,e.data(),"object"==typeof t&&t);e.data("clockpicker",new s(e,n))}})}}();
