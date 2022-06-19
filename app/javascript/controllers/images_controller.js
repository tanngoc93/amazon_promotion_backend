import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {

    $(".add-image-file").on("change", function (e) {

      let file = $(this).find("input.image-file-input")[0].files[0]

      let fd = new FormData()
          fd.append('data', file)

      upload(fd)

    })

    const upload = (data) => {
      $.ajax({
        method: 'POST',
        url: '/images',
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        mimeType: 'multipart/form-data',
        dataType: 'JSON',
        beforeSend: function() {
          // do something
        }
      })
      .done(function (data) {
        $("div.d-flex.flex-wrap").prepend( data['image_preview'] )
      })
      .fail(function() {
        alert("Something went wrong...")
      })
      .always(function () {
        // always do something
      })
    }
  }

  remove(event) {
    event.preventDefault()

    const { id } = event.target.dataset

    $.ajax({
      method: "DELETE",
      url: `/images/${id}`
    })
    .done(function( msg ) {
      $(`.image-file-${id}`).remove()
    })
    .always(function () {
      // always do something
    })
  }

}
