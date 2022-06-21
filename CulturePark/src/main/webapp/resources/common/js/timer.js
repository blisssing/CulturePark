function startTimer(count, display) {

    var minutes, seconds;
    timer = setInterval(function () {
        minutes = parseInt(count / 60, 10);
        seconds = parseInt(count % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.html(minutes + ":" + seconds);

        // 타이머 끝
        if (--count < 0) {
            clearInterval(timer);
            alert("시간초과");
            display.html("시간초과");
            $('.code_ok_btn').attr("disabled","disabled");
            isRunning = false;
        }
    }, 1000);
    isRunning = true;
}