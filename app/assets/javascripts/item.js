$(function(){
  // テキストカウント
  $('#textBox').keyup(function() {
    let cnt = $(this).val().length;
    $('.showCnt').text(cnt);
  });

  var array1 = [ "未定","らくらくメルカリ便","ゆうメール","レターパック","普通郵便（定型、定型外）",
  "クロネコヤマト","ゆうパック","クリックポスト","ゆうパケット" ]
  var array2 = ["ゆうメール","クロネコヤマト","ゆうパック"]

  function appendOption(method){
    var html = `<option value="${method}">${method}</option>`;
    return html;
  }

  $("#delivery_charge").on("change",function(){
    var delivery_parentCategory = ""

    delivery_parentCategory = document.getElementById("delivery_charge").value;
    if (delivery_parentCategory != "選択してください"){

    $.ajax({
        url: "/items/get_delivery_method",
        type: "GET",
        data: { parent_name: delivery_parentCategory },
        dataType: "json"
        
      })
      

      .done(function(method) {
        $("#delivery_method-parent").remove();
        var methodBoxHtml = "";
        var insertHTML = "";
        if (delivery_parentCategory == "送料込み（出品者負担）"){
          array1.forEach(function(method){
          insertHTML += appendOption(method);
          });
        }else (delivery_parentCategory == "着払い（購入者負担）");{
            array2.forEach(function(method){
            insertHTML += appendOption(method);
            });
          }
        methodBoxHtml = `<div id="delivery_method-parent"> 
                          <span id="label">配送の方法</span> 
                          <span id="required">必須</span> 
                            <select name="item[delivery_method]" class="main__content__item-delivery__select" id="delivery_charge">
                            <option value="">選択してください</option>
                            ${insertHTML}
                            </select>
                          </div>`;
      $(".main__content__item-delivery__method").append(methodBoxHtml);

        console.log(delivery_parentCategory)
      })
    }
    else {$("#delivery_method-parent").remove();}

  });

});