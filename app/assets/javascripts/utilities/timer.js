document.addEventListener('turbolinks:load', function(){
    var timerData = document.querySelector('#timer')
    if (timerData) {
        startTimer(timerData)
    }
})

function startTimer(timerData) {
    var timer = Math.round(timerData.dataset.timeLeft)
    setTimeout(function updateTimer() {
        if (timer > 0) {
            setTimer(timer--)
            setTimeout(updateTimer, 1000)
        } else {
            window.location.href = window.location.href + '/result'
        }
    }, 0)
}

function setTimer(timer) {
    var counterSpan = document.querySelector('#counter')
    counterSpan.innerText = timer + ' сек.'
}

