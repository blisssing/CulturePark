function fileDown(filename, filepath) {

    var element = document.createElement('a');
    element.setAttribute('href', filepath);
    element.setAttribute('download', filename);
    document.body.appendChild(element);
    element.click();
    

}