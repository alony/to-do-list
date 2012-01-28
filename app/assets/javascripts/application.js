// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require_self

var Page = {
  init: function() {
    $(".tablesorter").tablesorter();
    Page.defaultTab();

    //On Click Event
    $("ul.tabs li").live("click", function() {

      $("ul.tabs li").removeClass("active"); //Remove any "active" class
      $(this).addClass("active"); //Add "active" class to selected tab
      $(".tab_content").hide(); //Hide all tab content

      var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
      $(activeTab).fadeIn(); //Fade in the active ID content
      return false;
    });

    $('.column').equalHeight();
  },

  defaultTab: function(){
    if ($("ul.tabs li.active").length != 0) return;
    $(".tab_content").hide(); //Hide all content
    $("ul.tabs li:first").addClass("active").show(); //Activate first tab
    $(".tab_content:first").show(); //Show first tab content
  },

  showContent: function(content, node) {
    if (typeof node == "undefined") node = "section#main";
    $(node).html(content);
    Page.defaultTab();
  }
}

var SideList = {
  addItem: function(link) {
    $("ul#task_lists li:last").before($('<li></li>')
        .attr({ id : link.id })
        .addClass("icn_categories")
        .html(link));
  },

  dropItem: function(item_id) {
    $("ul#task_lists li a#"+item_id).parent().remove();
  }
}

$(document).ready(Page.init);

