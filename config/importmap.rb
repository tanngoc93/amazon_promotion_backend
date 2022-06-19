# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

# NOTE: pin jquery to jsdelivr. this will make jquery global on import;
#       jspm wraps packages in a module [1], so jquery is not available globally.
pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.js"

# NOTE: a few answers suggested `jquery-ui-dist`. I couldn't add it with 
#       `bin/importmap`; use https://generator.jspm.io/ to get the url.
pin "jquery-ui-dist", to: "https://ga.jspm.io/npm:jquery-ui-dist@1.13.1/jquery-ui.js"

# works fine
pin "jqtree", to: "https://ga.jspm.io/npm:jqtree@1.6.2/lib/tree.jquery.js"

# [1] someone, please, link to/explain what jspm does exactly to cause this.

pin "@nathanvda/cocoon", to: "https://ga.jspm.io/npm:@nathanvda/cocoon@1.2.14/cocoon.js"
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.1.3/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.5/lib/index.js"
pin "@fortawesome/fontawesome-free", to: "https://ga.jspm.io/npm:@fortawesome/fontawesome-free@6.1.1/js/fontawesome.js"
pin "@ckeditor/ckeditor5-build-classic", to: "https://ga.jspm.io/npm:@ckeditor/ckeditor5-build-classic@34.1.0/build/ckeditor.js"
