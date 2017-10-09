
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-30210234-1']);
_gaq.push(['_trackPageview']);
(function() {
	var ga = document.createElement('script');
	ga.type = 'text/javascript';
	ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	var s = document.getElementsByTagName('script')[0];
	s.parentNode.insertBefore(ga, s);
})();




var a = $kit.els8cls($kit.ui.Form.ComboBox.Select.defaultConfig.transformCls), a1 = [];
for(var i = 0; i < a.length; i++) {
	a1.push(a[i])
}
a = a1;
var b1 = new $kit.ui.Form.ComboBox.Select({
	el : a[0],
	data : (function() {
		var provTreeDict = new TreeDict();
		for(var prov in chinaJSON) {
			provTreeDict.ad(prov, prov);
		}
		return provTreeDict;
	})()
});
b1.transform();
b1.ev({
	ev : 'change',
	fn : function() {
		var prov = chinaJSON[b1.inputEl.value];
		if(prov == null) {
			return;
		}
		var cityTree = new TreeDict();
		for(var city in prov) {
			cityTree.ad(city, city);
		}
		b2.inputEl.value = '';
		b2.formEl.value = '';
		b2.config.data = cityTree;
		b2.list.buildList(cityTree.search(''));
	}
});
var b2 = new $kit.ui.Form.ComboBox.Select({
	el : a[1],
	data : undefined
});
b2.transform();
b2.ev({
	ev : 'change',
	fn : function() {
		var city = chinaJSON[b1.inputEl.value][b2.inputEl.value];
		if(city == null) {
			return;
		}
		var districtTree = new TreeDict();
		for(var district in city) {
			districtTree.ad(district, city[district]);
		}
		b3.inputEl.value = '';
		b3.formEl.value = '';
		b3.config.data = districtTree;
		b3.list.buildList(districtTree.search(''));
	}
});
var b3 = new $kit.ui.Form.ComboBox.Select({
	el : a[2],
	data : undefined
});
b3.transform();