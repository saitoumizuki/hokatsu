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

// リストに追加する
// function addNursery(name, lat, lng){
//     var li = $('<li>', {
//         text: name,
//         "class": "list-group-item"
//     });
//     li.attr("data-lat", lat);
//     li.attr("data-lng", lng);

//     // 重複チェックしてリストに追加
//     if(!isExistList(li)) {
//         $('#route-list').append(li);
//     }
// }
// // リストの重複をチェックする
// function isExistList(li) {
//     var exist = false;
//     $('#route-list li').each(function() {
//         if($(this).text() == $(li).text()) {
//             exist = true;
//         }
//     })
//     return exist;
// }



// var rendererOptions = {
//     suppressMarkers : true
// }
// var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
// var directionsService = new google.maps.DirectionsService();

// // 複数地点のルートを検索する
// function search() {
//     var points = $('#route-list li');

//     // 2地点以上のとき
//     if (points.length >= 2){
//         var origin; // 開始地点
//         var destination; // 終了地点
//         var waypoints = []; // 経由地点

//         // origin, destination, waypointsを設定する
//         for (var i = 0; i < points.length; i++) {
//             points[i] = new google.maps.LatLng($(points[i]).attr("data-lat"), $(points[i]).attr("data-lng"));
//             if (i == 0){
//                 origin = points[i];
//             } else if (i == points.length-1){
//                 destination = points[i];
//             } else {
//                 waypoints.push({ location: points[i], stopover: true });
//             }
//         }
//         // リクエスト作成
//         var request = {
//             origin:      origin,
//             destination: destination,
//             waypoints: waypoints,
//             travelMode:  google.maps.TravelMode.DRIVING
//         };
//         // ルートサービスのリクエスト
//         directionsService.route(request, function(response, status) {
//             if (status == google.maps.DirectionsStatus.OK) {
//                 // 結果を表示する
//                 directionsDisplay.setDirections(response);
//             }
//         });
//     }
// }