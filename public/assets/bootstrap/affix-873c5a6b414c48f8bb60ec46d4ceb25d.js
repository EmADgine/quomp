+function(t){"use strict";var i=function(e,o){this.options=t.extend({},i.DEFAULTS,o),this.$window=t(window).on("scroll.bs.affix.data-api",t.proxy(this.checkPosition,this)).on("click.bs.affix.data-api",t.proxy(this.checkPositionWithEventLoop,this)),this.$element=t(e),this.affixed=this.unpin=this.pinnedOffset=null,this.checkPosition()};i.RESET="affix affix-top affix-bottom",i.DEFAULTS={offset:0},i.prototype.getPinnedOffset=function(){if(this.pinnedOffset)return this.pinnedOffset;this.$element.removeClass(i.RESET).addClass("affix");var t=this.$window.scrollTop(),e=this.$element.offset();return this.pinnedOffset=e.top-t},i.prototype.checkPositionWithEventLoop=function(){setTimeout(t.proxy(this.checkPosition,this),1)},i.prototype.checkPosition=function(){if(this.$element.is(":visible")){var e=t(document).height(),o=this.$window.scrollTop(),f=this.$element.offset(),n=this.options.offset,s=n.top,h=n.bottom;"object"!=typeof n&&(h=s=n),"function"==typeof s&&(s=n.top(this.$element)),"function"==typeof h&&(h=n.bottom(this.$element));var a=null!=this.unpin&&o+this.unpin<=f.top?!1:null!=h&&f.top+this.$element.height()>=e-h?"bottom":null!=s&&s>=o?"top":!1;if(this.affixed!==a){null!=this.unpin&&this.$element.css("top","");var p="affix"+(a?"-"+a:""),l=t.Event(p+".bs.affix");this.$element.trigger(l),l.isDefaultPrevented()||(this.affixed=a,this.unpin="bottom"==a?this.getPinnedOffset():null,this.$element.removeClass(i.RESET).addClass(p).trigger(t.Event(p.replace("affix","affixed"))),"bottom"==a&&this.$element.offset({top:f.top}))}}};var e=t.fn.affix;t.fn.affix=function(e){return this.each(function(){var o=t(this),f=o.data("bs.affix"),n="object"==typeof e&&e;f||o.data("bs.affix",f=new i(this,n)),"string"==typeof e&&f[e]()})},t.fn.affix.Constructor=i,t.fn.affix.noConflict=function(){return t.fn.affix=e,this},t(window).on("load",function(){t('[data-spy="affix"]').each(function(){var i=t(this),e=i.data();e.offset=e.offset||{},e.offsetBottom&&(e.offset.bottom=e.offsetBottom),e.offsetTop&&(e.offset.top=e.offsetTop),i.affix(e)})})}(jQuery);