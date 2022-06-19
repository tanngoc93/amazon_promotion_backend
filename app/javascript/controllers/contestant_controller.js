import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "gdpr", "email", "form" ]

  connect() {

    const regex = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

    $("form input[name='contestant[email]']").on("change", function (event) {

      let changed = false

      if (event.type === "propertychange") {
        changed = event.originalEvent.propertyName == "value"
      } else {
        changed = true
      }

      if (changed && regex.test($("input#contestant_email").val())) {
        $("input.btn.btn-success").attr("disabled", false)
        $("input[name='contestant[email]']").removeClass("is-invalid")
        $("form").addClass("was-validated")
      } else {
        $("input.btn.btn-success").attr("disabled", true)
        $("input[name='contestant[email]']").addClass("is-invalid")
        $("form").removeClass("was-validated")
      }

    })
  }

  share(event) {

    const isChecked = $(event.target).hasClass("promo-check")

    if ( !isChecked ) {
      $(event.target).addClass("promo-check")
    }
  }

  ajaxSubmit(event) {
    event.preventDefault()

    const gdpr = this.gdprTarget.checked
    const email = this.emailTarget.value

    if (!gdpr)
      return alert("Please, accept advertising terms!")

    $.ajax({
      method: "POST",
      url: this.data.get("url"),
      data: {
        contestant: { email }
      },
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      cache: false,
      dataType: "JSON",
      beforeSend: function() {
        // do something
      }
    })
    .done(function(data) {

      document.cookie = `contestant_secret_code=${ data["contestant"]["secret_code"] }`;

      if ( data["redirect_to"] ) {
        window.location.replace( data["redirect_to"] )
      }
    })
    .fail(function() {
      alert("Something went wrong...")
    })
    .always(function () {
      // always do something
    })
  }

  ajaxResendConfirmation(event) {
    event.preventDefault()

    const { secretCode } = event.target.dataset

    $.ajax({
      method: "POST",
      url: this.data.get("url"),
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      cache: false,
      dataType: "JSON",
      beforeSend: function() {
        // do something
      }
    })
    .done(function(data) {
      console.log(">>>", data["message"])
    })
    .fail(function() {
      alert("Something went wrong...")
    })
    .always(function () {
      // always do something
    })
  }

}
