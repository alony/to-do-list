// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require backbone
//= require backbone_rails_sync
//= require backbone_datalink
//= require backbone/to_do_list
//= require_tree .
//= require_self



var Page = {
  init: function() {
    $(".tablesorter").tablesorter();
    Page.defaultTab();

    $("ul.tabs li").live("click", function() {

      $(this).parent().find("li").removeClass("active");
      $(this).addClass("active");
      $(this).parents(".tasks_container").find(".tab_content").hide();

      var activeTab = $(this).find("a").attr("href");
      $(activeTab).fadeIn();
      return false;
    });

    $('.column').equalHeight();
    $("#flash").delay(5000).fadeOut();
  },

  defaultTab: function(){
    if ($("ul.tabs li.active").length != 0) return;
    $.each($("article.module"), function(i, el) {
      $(el).find(".tab_content").hide();
      $(el).find("ul.tabs li:first").addClass("active").show();
      $(el).find(".tab_content:first").show();
    });
  },

  showContent: function(content, node, flash) {
    if (typeof node == "undefined") node = "section#main";
    $(node).html(content);
    Page.defaultTab();
    if (typeof flash != "undefined" && flash.length != 0) Page.showFlash(flash);
  },

  showFlash: function(msg) {
    if ($("#flash").length == 0) $('body').prepend($("<div id='flash'></div>").addClass('invisible'));
    $("#flash").html(msg).fadeIn().delay(5000).fadeOut();
  }
}

var SideList = {
  addItem: function(link) {
    $("ul#task_lists li:last").before($('<li></li>')
        .attr({ id : link.id })
        .addClass("icn_categories")
        .html(link));
  },

  changeItem: function(link) {
    $("ul#task_lists li a#"+$(link).attr('id')).replaceWith(link);
  },

  dropItem: function(item_id) {
    $("ul#task_lists li a#"+item_id).parent().remove();
  }
}

$(document).ready(Page.init);

