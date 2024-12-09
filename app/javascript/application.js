// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', function () {
    if (window.location.pathname === "/forms/new") {
        const checkbox = document.getElementById('show_email_checkbox');
        const emailField = document.getElementById('email_field');

        checkbox.addEventListener('change', function () {
            if (checkbox.checked) {
                emailField.classList.remove('hidden');
            } else {
                emailField.classList.add('hidden');
            }
        });
    }
});
