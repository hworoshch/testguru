document.addEventListener('turbolinks:load', function() {
    var progressData = document.querySelector('#progressbar')
    if (progressData) {
        var questionNumber = progressData.dataset.questionNumber
        if (questionNumber > 1) {
            var questionsCount = progressData.dataset.questionsCount
            var progress = ((questionNumber - 1) / questionsCount) * 100
            progressData.style.width = progress + '%'
        }
    }
})