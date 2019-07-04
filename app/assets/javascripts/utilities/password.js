document.addEventListener('turbolinks:load', function() {
    var password = document.querySelector('#user_password')
    var passwordConfirmation = document.querySelector('#user_password_confirmation')

    if (password && passwordConfirmation) {
        password.addEventListener('input', inputValidation)
        passwordConfirmation.addEventListener('input', inputValidation)

        function inputValidation() {
            if (password.value && passwordConfirmation.value) {
                if (password.value == passwordConfirmation.value) {
                    passwordConfirmation.classList.remove('border-danger')
                    passwordConfirmation.classList.add('border-success')
                } else {
                    passwordConfirmation.classList.remove('border-success')
                    passwordConfirmation.classList.add('border-danger')
                }
            } else {
                passwordConfirmation.classList.remove('border-success', 'border-danger')
            }
        }
    }
})

