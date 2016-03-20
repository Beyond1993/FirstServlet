
//alert("start");

var ws = null;

function setConnected(connected) {
    document.getElementById('connect').disabled = connected;
  //  document.getElementById('disconnect').disabled = !connected;
   // document.getElementById('echo').disabled = !connected;
}

function output(message) {
   // alert("output function");
    var console = document.getElementById('console');
    
    var p = document.createElement('p');
    p.style.wordWrap = 'break-word';
    p.appendChild(document.createTextNode(message));
    console.appendChild(p);
    while (console.childNodes.length > 25) {
        console.removeChild(console.firstChild);
    }
    console.scrollTop = console.scrollHeight;
}

function connect() {

    //alert("connect function");
    var target = "ws://127.0.0.1:8080/FirstServlet/websocket/echoAnnotation";
    if (target == '') {
        alert('Please select server side connection implementation.');
        return;
    }
    if ('WebSocket' in window) {
        ws = new WebSocket(target);
    } else if ('MozWebSocket' in window) {
        ws = new MozWebSocket(target);
    } else {
        alert('WebSocket is not supported by this browser.');
        return;
    }
    ws.onopen = function () {
     //   alert("open");
        output('Info: WebSocket connection opened.');
        setConnected(true);
    };
    ws.onmessage = function (event) {
        output('Received: ' + event.data);
    };
    ws.onclose = function (event) {
        setConnected(false);
        output('Info: WebSocket connection closed, Code: ' + event.code + (event.reason == "" ? "" : ", Reason: " + event.reason));
    };
}

function disconnect() {
    if (ws != null) {
        ws.close();
        ws = null;
    }
    setConnected(false);
}

function echo() {
    if (ws != null) {
        var message = document.getElementById('message').value;
        output('Sent: ' + message);
        ws.send(message + "wayne");
    } else {
        alert('WebSocket connection not established, please connect.');
    }
}

function echo(value) {
    if (ws != null) {
        var id = 'message'+ value;
        var message = document.getElementById(id).value;
        output('Sent: ' + message);
        ws.send(message + "wayne");
        selectPic();
    } else {
        alert('WebSocket connection not established, please connect.');
    }
}

function updateTarget(target) {
    if (window.location.protocol == 'http:') {
        document.getElementById('target').value = 'ws://' + window.location.host + target;
    } else {
        document.getElementById('target').value = 'wss://' + window.location.host + target;
    }
}

function selectPic(){
    var num = Math.round(Math.random()*10);
    //alert(num);
    document.getElementById('word').src = "resource/img/"+ num +".jpg";
}
document.addEventListener("DOMContentLoaded", function() {
    // Remove elements with "noscript" class - <noscript> is not allowed in XHTML
    var noscripts = document.getElementsByClassName("noscript");
    for (var i = 0; i < noscripts.length; i++) {
        noscripts[i].parentNode.removeChild(noscripts[i]);
    }
}, false);
