<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>websocket</title>
</head>
<body>
	<div>
		<input type="submit" value="Start" onclick="start()" />
	</div>
	<div id="messages"></div>
	<script type="text/javascript">
		var webSocket = 
			new WebSocket('ws://localhost:8080/EstateSales/websocket');

		webSocket.onerror = function(event) {
			onError(event)
		};

		webSocket.onopen = function(event) {
			onOpen(event)
		};
		webSocket.onclose=function(event){
			alert("连接已关闭");
		}
		webSocket.onmessage = function(event) {
			onMessage(event)
		};

		function onMessage(event) {
			document.getElementById('messages').innerHTML 
				+= '<br />' + event.data;
		}

		function onOpen(event) {
			document.getElementById('messages').innerHTML 
				= 'Connection established';
		}

		function onError(event) {
			alert(event.data);
		}

		function start() {
			webSocket.send('hello');
			return false;
		}
	</script>
</body>
</html>