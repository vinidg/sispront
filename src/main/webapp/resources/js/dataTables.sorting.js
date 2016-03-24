jQuery.extend(jQuery.fn.dataTableExt.oSort, {
	"date-eu-pre" : function(date) {
		date = date.replace(" ", "");

		if (!date) {
			return 0;
		}

		var year;
		var eu_date = date.split(/[\.\-\/]/);

		/* year (optional) */
		if (eu_date[2]) {
			year = eu_date[2];
		} else {
			year = 0;
		}

		/* month */
		var month = eu_date[1];
		if (month.length == 1) {
			month = 0 + month;
		}

		/* day */
		var day = eu_date[0];
		if (day.length == 1) {
			day = 0 + day;
		}

		return (year + month + day) * 1;
	},

	"date-eu-asc" : function(a, b) {
		return ((a < b) ? -1 : ((a > b) ? 1 : 0));
	},

	"date-eu-desc" : function(a, b) {
		return ((a < b) ? 1 : ((a > b) ? -1 : 0));
	}
});

jQuery.extend(jQuery.fn.dataTableExt.oSort, {
	"date-euro-pre" : function(a) {
		var x;

		if ($.trim(a) !== '') {
			var frDatea = $.trim(a).split(' ');
			var frTimea = frDatea[1].split(':');
			var frDatea2 = frDatea[0].split('/');
			x = (frDatea2[2] + frDatea2[1] + frDatea2[0] + frTimea[0]
					+ frTimea[1] + frTimea[2]) * 1;
		} else {
			x = Infinity;
		}

		return x;
	},

	"date-euro-asc" : function(a, b) {
		return a - b;
	},

	"date-euro-desc" : function(a, b) {
		return b - a;
	}
});

(function() {

	/*
	 * Natural Sort algorithm for Javascript - Version 0.7 - Released under MIT
	 * license Author: Jim Palmer (based on chunking idea from Dave Koelle)
	 * Contributors: Mike Grier (mgrier.com), Clint Priest, Kyle Adams,
	 * guillermo See:
	 * http://js-naturalsort.googlecode.com/svn/trunk/naturalSort.js
	 */
	function naturalSort(a, b) {
		var re = /(^-?[0-9]+(\.?[0-9]*)[df]?e?[0-9]?$|^0x[0-9a-f]+$|[0-9]+)/gi, sre = /(^[ ]*|[ ]*$)/g, dre = /(^([\w ]+,?[\w ]+)?[\w ]+,?[\w ]+\d+:\d+(:\d+)?[\w ]?|^\d{1,4}[\/\-]\d{1,4}[\/\-]\d{1,4}|^\w+, \w+ \d+, \d{4})/, hre = /^0x[0-9a-f]+$/i, ore = /^0/,
		// convert all to strings and trim()
		x = a.toString().replace(sre, '') || '', y = b.toString().replace(sre,
				'')
				|| '',
		// chunk/tokenize
		xN = x.replace(re, '\0$1\0').replace(/\0$/, '').replace(/^\0/, '')
				.split('\0'), yN = y.replace(re, '\0$1\0').replace(/\0$/, '')
				.replace(/^\0/, '').split('\0'),
		// numeric, hex or date detection
		xD = parseInt(x.match(hre), 10)
				|| (xN.length !== 1 && x.match(dre) && Date.parse(x)), yD = parseInt(
				y.match(hre), 10)
				|| xD && y.match(dre) && Date.parse(y) || null;

		// first try and sort Hex codes or Dates
		if (yD) {
			if (xD < yD) {
				return -1;
			} else if (xD > yD) {
				return 1;
			}
		}

		// natural sorting through split numeric strings and default strings
		for ( var cLoc = 0, numS = Math.max(xN.length, yN.length); cLoc < numS; cLoc++) {
			// find floats not starting with '0', string or 0 if not defined
			// (Clint Priest)
			var oFxNcL = !(xN[cLoc] || '').match(ore)
					&& parseFloat(xN[cLoc], 10) || xN[cLoc] || 0;
			var oFyNcL = !(yN[cLoc] || '').match(ore)
					&& parseFloat(yN[cLoc], 10) || yN[cLoc] || 0;
			// handle numeric vs string comparison - number < string - (Kyle
			// Adams)
			if (isNaN(oFxNcL) !== isNaN(oFyNcL)) {
				return (isNaN(oFxNcL)) ? 1 : -1;
			}
			// rely on string comparison if different types - i.e. '02' < 2 !=
			// '02' < '2'
			else if (typeof oFxNcL !== typeof oFyNcL) {
				oFxNcL += '';
				oFyNcL += '';
			}
			if (oFxNcL < oFyNcL) {
				return -1;
			}
			if (oFxNcL > oFyNcL) {
				return 1;
			}
		}
		return 0;
	}

	jQuery.extend(jQuery.fn.dataTableExt.oSort, {
		"natural-asc" : function(a, b) {
			return naturalSort(a, b);
		},

		"natural-desc" : function(a, b) {
			return naturalSort(a, b) * -1;
		}
	});

}());