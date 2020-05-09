$(document).on('turbolinks:load', ()=> {
  // テキストカウント
  $('#textBox').keyup(function() {
    let cnt = $(this).val().length;
    $('.showCnt').text(cnt);
  });

  // 配送方法
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
      })
    }
    else {$("#delivery_method-parent").remove();}
  });
  // 画像プレビュー
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file main__content__img-up__file__l__field__file" type="file"
                    name="item[images_attributes][${index}][url]"
                    id="item_images_attributes_${index}_url">
                    <div class="js-remove"><i class="far fa-times-circle"></i></div>
                  </div>`;
    return html;
  }
  
  const buildImg = (index, url)=> {
    const html = `
    <img data-index="${index}" src="${url}"">
    `;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
      const targetIndex = $(this).parent().data('index');
      const file = e.target.files[0];
      const blobUrl = window.URL.createObjectURL(file);
      if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
        img.setAttribute('url', blobUrl);
      } else {
        $('#previews').append(buildImg(targetIndex, blobUrl));
        if ( fileIndex[0] < 10 ){
          $('#image-box').append(buildFileField(fileIndex[0]));
          fileIndex.shift();
          fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
        }
      }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });


//item詳細ページの画面表示
$(function () {
  $(".itembox__body__image__sub__thumb").first().addClass("active");
  $(".itembox__body__image__sub__thumb__photo").click(function () { 
    image_url = $(this).attr("src");
    $(".itembox__body__image__main__photo").attr("src", image_url).hide().fadeIn();
    $(".itembox__body__image__sub__thumb.active").removeClass("active");
    $(this).parent().addClass("active"); 
  });
});
});