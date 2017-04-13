<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="requiresActiveX=true">
<title>현대자동차 CHATBOT</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<title></title>
<meta name="title" content="">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico">
<link rel="stylesheet" href="/css/jquery-ui.css" media="all">
<link rel="stylesheet" href="/css/wCommon.css" media="all">
<link href="http://bluemembers.hyundai.com/oc/hindex.jsp"
	rel="canonical" />
<link href="http://bluemembers.hyundai.com/oc/hindex.jsp"
	rel="alternate" hreflang="ko" />
<link rel="stylesheet" type="text/css"
	href="http://bluemembers.hyundai.com/oc/hmcss/style.css" />
<link rel="stylesheet" type="text/css"
	href="http://bluemembers.hyundai.com/oc/hmcss/calendar.css" />
<link rel="shortcut icon" type="image/x-icon"
	href="http://bluemembers.hyundai.com/oc/hmimages/BLUEmembers.ico" />
<link rel="apple-touch-icon"
	href="http://bluemembers.hyundai.com/oc/hmimages/hdr/h1_bluememebers.gif" />
<script type="text/javascript"
	src="http://bluemembers.hyundai.com/oc/hmjs/jquery.js"></script>
<script type="text/javascript"
	src="http://bluemembers.hyundai.com/oc/hmjs/jquery.alphanumeric.js"></script>
<script type="text/javascript"
	src="http://bluemembers.hyundai.com/oc/hmjs/common/common.js"></script>

<link rel="stylesheet" type="text/css"
	href="http://bluemembers.hyundai.com/oc/hmcss/main.css" />
<style>
* {
	box-sizing: border-box;
}

body {
	background-color: #edeff2;
	font-family: "Calibri", "Roboto", sans-serif;
}

.chat_window {
	position: absolute;
	width: calc(100% - 20px);
	/*max-width: 800px;*/
	width:45%;
	/*height: 500px; */
	height:90%;
	border-radius: 10px;
	background-color: #fff;
	left: 50%;
	top: 50%;
	transform: translateX(-50%) translateY(-50%);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
	background-color: #f8f8f8;
	overflow: hidden;
}

.top_menu {
	background-color: #fff;
	width: 100%;
	padding: 20px 0 15px;
	box-shadow: 0 1px 30px rgba(0, 0, 0, 0.1);
}

.top_menu .buttons {
	margin: 3px 0 0 20px;
	position: absolute;
}

.top_menu .buttons .button {
	width: 16px;
	height: 16px;
	border-radius: 50%;
	display: inline-block;
	margin-right: 10px;
	position: relative;
}

.top_menu .buttons .button.close {
	background-color: #f5886e;
}

.top_menu .buttons .button.minimize {
	background-color: #fdbf68;
}

.top_menu .buttons .button.maximize {
	background-color: #a3d063;
}

.top_menu .title {
	text-align: center;
	color: #bcbdc0;
	font-size: 20px;
}

.messages {
	position: relative;
	list-style: none;
	padding: 20px 10px 0 10px;
	margin: 0;
	height: 480px;
	overflow: scroll;
}

.messages .message {
	clear: both;
	overflow: hidden;
	margin-bottom: 20px;
	transition: all 0.5s linear;
	opacity: 0;
}

.messages .message.left .avatar {
	background-color: #ffe6cb;
	background-image: url("/img/person.png");
	background-position: center;
	background-repeat: no-repeat;
	float: left;
}

.messages .message.left .text_wrapper {
	background-color: rgb(241, 225, 87);;
	margin-left: 20px;
}

.messages .message.left .text_wrapper::after, .messages .message.left .text_wrapper::before
	{
	right: 100%;
	border-right-color: rgb(241, 225, 87);
}

.messages .message.left .text {
	color: #fff;
}

.messages .message.right .avatar {
	background-color: #fff;
	background-image: url("/img/watson.png");
	background-position: center;
	background-repeat: no-repeat;
	background-size: 80%;
	float: right;
}

.messages .message.right .text_wrapper {
	background-color: #4d94c0;
	margin-right: 20px;
	float: right;
}

.messages .message.right .text_wrapper::after, .messages .message.right .text_wrapper::before
	{
	left: 100%;
	border-left-color: #4d94c0;
}

.messages .message.right .text {
	color: #fff;
}

.messages .message.appeared {
	opacity: 1;
}

.messages .message .avatar {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	display: inline-block;
}

.messages .message .text_wrapper {
	display: inline-block;
	padding: 20px;
	border-radius: 6px;
	width: calc(100% - 85px);
	min-width: 100px;
	position: relative;
}

.messages .message .text_wrapper::after, .messages .message .text_wrapper:before
	{
	top: 18px;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}

.messages .message .text_wrapper::after {
	border-width: 13px;
	margin-top: 0px;
}

.messages .message .text_wrapper::before {
	border-width: 15px;
	margin-top: -2px;
}

.messages .message .text_wrapper .text {
	font-size: 15px;
	font-color: #fff;
	font-weight: 300;
}

.bottom_wrapper {
	position: relative;
	width: 100%;
	background-color: #fff;
	padding: 20px 20px;
	position: absolute;
	bottom: 0;
}

.bottom_wrapper .message_input_wrapper {
	display: inline-block;
	height: 50px;
	border-radius: 25px;
	border: 1px solid #bcbdc0;
	width: calc(100% - 160px);
	position: relative;
	padding: 0 20px;
}

.bottom_wrapper .message_input_wrapper .message_input {
	border: none;
	height: 100%;
	box-sizing: border-box;
	width: calc(100% - 40px);
	position: absolute;
	outline-width: 0;
	color: gray;
}

.bottom_wrapper .send_message {
	width: 140px;
	height: 50px;
	display: inline-block;
	border-radius: 50px;
	background-color: #a3d063;
	border: 2px solid #a3d063;
	color: #fff;
	cursor: pointer;
	transition: all 0.2s linear;
	text-align: center;
	float: right;
}

.bottom_wrapper .send_message:hover {
	color: #a3d063;
	background-color: #fff;
}

.bottom_wrapper .send_message .text {
	font-size: 18px;
	font-color: #fff;
	font-weight: 300;
	display: inline-block;
	line-height: 48px;
}

.message_template {
	display: none;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/common.ui.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#headerImg").on("click",function(){
			var leftFrame = '<input type="image" src="/img/wva.png" class="mp-input-wat">';
	
	        var trHtml = $("#div01");
	        var trHtml1 = $("#div03");
	
	        trHtml.append(leftFrame);
	        trHtml1.append(leftFrame);
	    });
	});
    (function () {
    var Message;
    
    Message = function (arg) {
        this.text = arg.text, this.message_side = arg.message_side;
        this.draw = function (_this) {
            return function () {
                var $message;
                $message = $($('.message_template').clone().html());
                $message.addClass(_this.message_side).find('.text').html(_this.text);
                $('.messages').append($message);
                return setTimeout(function () {
                    return $message.addClass('appeared');
                }, 0);
            };
        }(this);
        return this;
    };

    $(function () {
        var getMessageText, message_side, sendMessage;
        getMessageText = function () {
            var $message_input;
            $message_input = $('.message_input');
            return $message_input.val();
        };
        sendMessage = function (text, message_side) {
            var $messages, message;
            if (text.trim() === '') {
                return;
            }
            $('.message_input').val('');
            $messages = $('.messages');
            //message_side = message_side === 'left' ? 'right' : 'left';
            message = new Message({
                text: text,
                message_side: message_side
            });

            message.draw();
            return $messages.animate({ scrollTop: $messages.prop('scrollHeight') }, 300);
        };
        $('.send_message').click(function (e) {
            return watsonDialog(getMessageText(), true);
        });
        $('.message_input').keyup(function (e) {
            if (e.which === 13) {
                return watsonDialog(getMessageText(), true);
            }
        });

        /*
         * Watson Conversation
         */
        function watsonDialog(say, echo)
        {
           if ( echo == true)
               sendMessage(say, 'left');
           
           $.ajax({
               type: "POST",
               contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
               url: "/HkmcChatbot?say=" + say + "&lang=KR",
               dataType: "json",
               error: function () {
                   alert('통신실패!!');
               },
               success: function (data) {
                   sendMessage(data.results, 'right');
                   console.log(data.debug);
               }
           });
        }
        
        /* START */
        watsonDialog("@@hello", false);
    });         
    }.call(this));
    
    </script>
<body style="background-color: #e1e1e1;">
	<div class="mp-wrap">
		<div class="mp-header">
			<div class="mp-gnb">
				<input type="image" id="headerImg" src='/img/header.png'
					style='width: 100%; height: 35px;'>
			</div>
		</div>
		<div class="mp-contents-wrap">
			<div class="mp-contents2">

				<div class="mp-content-grid grid-type1">
					<div class="mp-control-col col-5">
						<div class="mp-table-type4" id="div01" style='text-align: center;'>
							<table>
		                        <tbody>
		                        	<tr>
										<td style='padding-top:30px;'><input type="image" src='/img/img_blankimg.png' style='margin-left:0%;height:150px;margin-bottom:20px;'></td>
			                        </tr>
			                        <tr>
	                        			<th id="tid" style='text-align: center;'>홍길동님 환영합니다.</th>
	                        		</tr>
			                        <tr>
			                        	<td style='padding-left:0px;padding-top:15px;'><input type="image" src='/img/Personality.png' style='width:85%;'></td>
			                        </tr>
		                        </tbody>
	                    	</table>
						</div>
					</div>
					<div class="mp-control-col col-6">
						<div class="mp-table-type4" id="div02">
							<div class="chat_window">							
								<div class="top_menu">
									<div class="buttons">
										<div class="button close"></div>
										<div class="button minimize"></div>
										<div class="button maximize"></div>
									</div>
									<div class="title">현대자동차</div>
								</div>
								<ul class="messages">
								</ul>
								<div class="bottom_wrapper clearfix">
									<div class="message_input_wrapper">
										<input class="message_input" placeholder="메시지를 입력하세요...">
									</div>
									<div class="send_message">
										<div class="icon"></div>
										<div class="text">Send</div>
									</div>
								</div>
							</div>
							<div class="message_template">
								<li class="message">
									<div class="avatar"></div>
									<div class="text_wrapper">
										<div class="text"></div>
									</div>
								</li>
							</div>
						</div>
					</div>
					<div class="mp-control-col col-7">
						<div class="mp-table-type4" id="div03"></div>
					</div>
				</div>
				<!-- //mp-content-grid -->

			</div>
		</div>
	</div>
</body>
</html>