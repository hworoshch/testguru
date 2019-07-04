document.addEventListener('turbolinks:load', function() {
    var progressData = document.querySelector('#progressbar')
    if (progressData) {
        var questionNumber = progressData.dataset.questionNumber
        var questionsCount = progressData.dataset.questionsCount
        console.log(questionNumber + ' / ' + questionsCount)
        var progress = (questionNumber / questionsCount) * 100
        progressData.style.width = progress + '%'
        console.log(progress)
    }
})