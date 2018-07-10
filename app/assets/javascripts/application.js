// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require_tree .

// ヘッダー　マイページのプルダウンメニュー
$(function(){
    $('.mypage').hover(function(){
        $("ul:not(:animated)", this).slideDown(300);
    });
    $('html').click(function() {
         $('.mypage-ul').slideUp(200);
     });
    $('.mypage-ul').click(function() {　event.stopPropagation();　});
});

// リンク先の案内ふきだし
$(function(){
    $('.s').hover(function(){
        $(".hukidasi:not(:animated)", this).fadeIn();
    }, function(){
        $(".hukidasi",this).fadeOut();
    });
});

// マイリスト登録ボタン　クリックでボタンのデザイン・文字を切り替える


// パスワード変更、退会ボタンの説明
$(function(){
    $('.s').hover(function(){
        $(".user-message:not(:animated)", this).slideDown(900);
    }, function(){
        $(".user-message",this).slideUp();
    });
});