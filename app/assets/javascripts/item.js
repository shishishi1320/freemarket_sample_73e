 $(document).on('turbolinks:load', ()=> {
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="main__content__img-up__file__l__field__file" type="file"
                    name="item[images_attributes][${index}][url]"
                    id="item_images_attributes_${index}_url">
                    <div class="js-remove"><i class="far fa-times-circle"></i></div>
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `
    <img data-index="${index}" src="${url}" width="118px" height="118px">
    `;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.main__content__img-up__file__l__field__file', function(e) {
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

    if ($('.main__content__img-up__file__l__field__file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});