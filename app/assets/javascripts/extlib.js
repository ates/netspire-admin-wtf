/*
 * Use predefined HTML as template.
 */
(function($) {
    $.extend({
        templates: {
            cache: {},
            init: function() {
                $(".template").each(function() {
                    var template = $(this).remove();
                    var name = template.attr("data-name");
                    $.templates.cache[name] = template;
                });
            },
            get: function(name) {
                return this.cache[name].clone();
            }
        }
    });
})(jQuery);

