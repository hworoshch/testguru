document.addEventListener('turbolinks:load', function(){
    var timerData = document.querySelector('#timer')
    if (timerData) {
        startTimer(timerData)
    }
})

function startTimer(timerData) {
    var timeLeft = timerData.dataset.timeLeft
    var timeStart = (new Date()).getTime()/1000
    var counterSpan = document.querySelector('#counter')
    setTimeout(function updateTimer() {
        var delta = (new Date()).getTime()/1000 - timeStart
        var timer = Math.round(timeLeft - delta)
        if (timer > 0) {
            counterSpan.innerText = timer + ' сек.'
            setTimeout(updateTimer, 500)
        } else {
            setTimeout(submitForm, 500)
        }
    }, 500)
}

function submitForm() {
    var form = document.querySelector('#test-form')
    if (form) {
        form.submit()
    }
}