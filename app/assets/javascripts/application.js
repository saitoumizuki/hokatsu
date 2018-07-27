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
//= require jquery
//= require bootstrap-sprockets
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
        $(".user-message",this).slideUp(900);
    });
});


// nursery/index一覧、hover時の動き
$(function() {
 
  //マウスを乗せたら発動
  $('.nursery-area-list').hover(function() {
 
    //マウスを乗せたら色が変わる
    $(this).css('background', '#fffc9c');
 
  //ここにはマウスを離したときの動作を記述
  }, function() {
 
    //色指定を空欄にすれば元の色に戻る
    $(this).css('background', '');
 
  });
});

// ラジオボタンのチェックを外せるようにする
var number;
$(function(){
    $('.checkbox01-input').click(function(){
        if($(this).val() == number) {
            $(this).prop('checked', false);
            number = 0;
        } else {
            number = $(this).val();
        }
    });
});


// footer、hover時の動き
$(function() {
 
  //マウスを乗せたら発動
  $('.footer-item').hover(function() {
 
    //マウスを乗せたら色が変わる
    $(this).css('background', '#fff');
  //ここにはマウスを離したときの動作を記述
  }, function() {
 
    //色指定を空欄にすれば元の色に戻る
    $(this).css('background', '');
 
  });
});