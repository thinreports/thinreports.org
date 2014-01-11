/**
 * JavaScript Utilities.
 * Copyright (c) Matsukei Co.,Ltd.
 */
(function($) {
  $.h = function(val) {
    return $('<div>').text(val).html();
  };
  $.showFeeds = function(target, url, opt_limit) {
    var qs, d = new Date();
    // Per 2 hours.
    qs = [d.getFullYear(), d.getMonth() + 1, d.getDate(), Math.ceil(d.getHours() / 2)];

    url += '?' + qs.join('');
    $.jGFeed(url,
      function(feeds) {
        var container = $(target);
        var emptySet = container.children(':first');
        
        if (!feeds || feeds.entries.length == 0) {
          emptySet.addClass('no-feed').text('No news');
          return;
        }
        // Remove empty-set node.
        emptySet.remove();
        // Create feeds.
        $.each(feeds.entries, function(i, entry) {
          var d = new Date(entry.publishedDate);
          var title = $.h(entry.title);
          var postedAt = [d.getFullYear(), d.getMonth() + 1, d.getDate()].join('.');
          var tooltip = postedAt + ' - ' + title + ' by ' + $.h(entry.author);
          var className = i == 0 ? ' class="latest"' : '';
          
          container.append('<a href="' + $.h(entry.link) + '" title="' + tooltip + '" target="_blank"' + className +'>' +
                              '<p class="title">' + title + '</p>' +
                              '<p class="posted-at">' + postedAt + '</p>' +
                           '</a>');
        });
      }, opt_limit, 'ABQIAAAATomI7IKAAJdQZ7ig7MOpfRRJN2wrevFPrcyRxELB0FLXaA2dmhSZVr_7SyltJWfRdo52Y_4_ruf0zA');
  };
})(jQuery);
