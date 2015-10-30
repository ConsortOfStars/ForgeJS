(function() {
  var Selector;

  Selector = (function() {
    Selector.prototype.data = [];

    Selector.prototype.length = 0;

    function Selector(selector) {
      var el, i, len, list, ref;
      this.selector = selector;
      list = {
        '.': 'sByClassName',
        '@': 'sByName',
        '=': 'sByTagName'
      };
      this.data = [];
      ref = document['getElement' + list[this.selector[0]]](this.selector.slice(1));
      for (i = 0, len = ref.length; i < len; i++) {
        el = ref[i];
        this.data.push(el);
        this.length++;
      }
    }

    return Selector;

  })();

  window.$ = function(str) {
    if (/^\W/.test(str)) {
      return new Selector(str);
    }
  };

}).call(this);

