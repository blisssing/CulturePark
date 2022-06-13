function getToday() {
    var today = new Date();

    var year=today.getFullYear();
    var month=today.getMonth()+1;
    var date = today.getDate();
    var day = today.getDay();
    var dayList = new Array('일','월','화','수','목','금','토');
    var day_kor =  dayList[day];

    var today_str = year+'.'+month+'.'+date+'('+day_kor+')';

    return today_str;
}