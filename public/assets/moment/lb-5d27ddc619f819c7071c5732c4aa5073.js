!function(e){"function"==typeof define&&define.amd?define(["moment"],e):"object"==typeof exports?module.exports=e(require("../moment")):e(window.moment)}(function(e){function n(e,n,t){var r={m:["eng Minutt","enger Minutt"],h:["eng Stonn","enger Stonn"],d:["een Dag","engem Dag"],dd:[e+" Deeg",e+" Deeg"],M:["ee Mount","engem Mount"],MM:[e+" M\xe9int",e+" M\xe9int"],y:["ee Joer","engem Joer"],yy:[e+" Joer",e+" Joer"]};return n?r[t][0]:r[t][1]}function t(e){var n=e.substr(0,e.indexOf(" "));return d(n)?"a "+e:"an "+e}function r(e){var n=e.substr(0,e.indexOf(" "));return d(n)?"viru "+e:"virun "+e}function u(){var e=this.format("d");return o(e)?"[Leschte] dddd [um] LT":"[Leschten] dddd [um] LT"}function o(e){switch(e=parseInt(e,10)){case 0:case 1:case 3:case 5:case 6:return!0;default:return!1}}function d(e){if(e=parseInt(e,10),isNaN(e))return!1;if(0>e)return!0;if(10>e)return e>=4&&7>=e?!0:!1;if(100>e){var n=e%10,t=e/10;return d(0===n?t:n)}if(1e4>e){for(;e>=10;)e/=10;return d(e)}return e/=1e3,d(e)}return e.lang("lb",{months:"Januar_Februar_M\xe4erz_Abr\xebll_Mee_Juni_Juli_August_September_Oktober_November_Dezember".split("_"),monthsShort:"Jan._Febr._Mrz._Abr._Mee_Jun._Jul._Aug._Sept._Okt._Nov._Dez.".split("_"),weekdays:"Sonndeg_M\xe9indeg_D\xebnschdeg_M\xebttwoch_Donneschdeg_Freideg_Samschdeg".split("_"),weekdaysShort:"So._M\xe9._D\xeb._M\xeb._Do._Fr._Sa.".split("_"),weekdaysMin:"So_M\xe9_D\xeb_M\xeb_Do_Fr_Sa".split("_"),longDateFormat:{LT:"H:mm [Auer]",L:"DD.MM.YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY LT",LLLL:"dddd, D. MMMM YYYY LT"},calendar:{sameDay:"[Haut um] LT",sameElse:"L",nextDay:"[Muer um] LT",nextWeek:"dddd [um] LT",lastDay:"[G\xebschter um] LT",lastWeek:u},relativeTime:{future:t,past:r,s:"e puer Sekonnen",m:n,mm:"%d Minutten",h:n,hh:"%d Stonnen",d:n,dd:n,M:n,MM:n,y:n,yy:n},ordinal:"%d.",week:{dow:1,doy:4}})});