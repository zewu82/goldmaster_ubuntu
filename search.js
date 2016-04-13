var URL = "http://117.74.136.200:9090/quote/"
//http://117.74.136.200:9090/quote/dyna?obj=Au(T+D).SGE
/*!
说明：本代码仅供ubuntu 黑客松 代码示例,不得他用。感谢刘晓国老师在此次活动中给予的指导和帮助。
*/

function Search(keyword, callback) {
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
        if (doc.readyState == XMLHttpRequest.HEADERS_RECEIVED) {
        } else if (doc.readyState === XMLHttpRequest.DONE) {
            if(doc.status != 200) {
                console.log("!!!Network connection failed!")
            }
            else {
                console.log("got some results!");
                if(doc.responseText == null) {
                }
                else {
                    //console.log("result: ", doc.responseText)
                    var json = JSON.parse('' + doc.responseText+ '');
                    json["status"] = "OK";
                    callback.update(json);
                }
            }
        }
    }

    console.log("url !" + URL + keyword);
    doc.open("GET", URL + keyword);
    doc.send();
}
