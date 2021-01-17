<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>TA_IN 스토리</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>
            <style>
                body {
                    width: 100%;
                    height: 100%;
                }
                
                #story_con {
                    display: flex;
                    justify-content: center;
                    width: 100%;
                    height: 783px;
                }
                
                #story_big_con {
                    width: 1000px;
                    max-height: 98%;
                    margin-top: 1%;
                    margin-bottom: 1%;
                }
                
                #show_story {
                    max-width: 1000px;
                    height: 100%;
                    position: relative;
                    overflow: hidden;
                }
                
                #story {
                    display: flex;
                    position: absolute;
                    top: 0px;
                    left: 0px;
                }
                
                .story_photo_con {
                    width: 1000px;
                    height: 800px;
                }
                
                .photo {
                    width: 1000px;
                    height: 700px;
                }
                
                .story_id {
                    height: 32px;
                    width: 100%;
                    line-height: 32px;
                    font-size: 14px;
                }
                
                #send_big_con {
                    width: 100%;
                    display: flex;
                    justify-content: center;
                    z-index: 4;
                    height: 64px;
                }
                
                #send_con {
                    background-color: white;
                    display: flex;
                    justify-content: center;
                    width: 100%;
                }
                
                .message {
                    height: 44px;
                    margin-top: 10px;
                    width: 80%;
                    outline: none;
                    box-sizing: border-box;
                }
                
                .send {
                    height: 44px;
                    margin-top: 10px;
                    outline: none;
                    box-sizing: border-box;
                }
            </style>
        </head>

        <body>
            <jsp:include page="../header.jsp"></jsp:include>
            <div id="story_con">
                <button type="button" class="slide_btn_prev" class="buttons">Prev</button>
                <div id="story_big_con">
                    <div id="show_story">
                        <div id="story">
                            <c:if test="${not empty eachstory}">
                                <c:forEach var="vo" items="${eachstory}" varStatus="s">
                                    <div class="story_photo_con">
                                        <div class="photo" style="background-image: url('${pageContext.request.contextPath}/resources/uploadFiles/${vo.s_img}'); background-repeat: no-repeat; background-position: center;">
                                        </div>
                                        <div id="send_big_con">
                                            <div id="send_con">
                                                <input type="text" id="message${vo.s_img}" class="message${vo.s_img} message" name="messagea" placeholder="${vo.m_id}님에게 메세지 보내기 ...">
                                                <input type="button" onclick="sendMessage('${vo.m_id}','${myProfile.m_id }','${vo.s_img}');" value="보내기" class="send">
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>
                <button type="button" class="slide_btn_next" class="buttons">Next</button>
            </div>

        </body>
        <script>
            $(function() {
                // 게시물 슬라이드
                var slideWrapper = document.querySelector('#show_story');
                var slides = document.querySelectorAll('.story_photo_con');
                var totalSlides = slides.length;
                var sliderWidth = slideWrapper.clientWidth;
                var slideIndex = 0;
                var slider = document.querySelector('#story');
                console.log("slideWrapper:" + slideWrapper);
                console.log("slides:" + slides);
                console.log("totalSlides:" + totalSlides);
                console.log("sliderWidth:" + sliderWidth);
                console.log("slideIndex:" + slideIndex);
                console.log("slider:" + slider);
                slider.style.width = sliderWidth * totalSlides + 'px';

                function showSlides(n) {
                    slideIndex = n;
                    if (slideIndex == -1) {
                        slideIndex = totalSlides - 1;
                    } else if (slideIndex === totalSlides) {
                        slideIndex = 0;
                    }
                    slider.style.left = -(sliderWidth * slideIndex) + 'px';
                }

                function plusSlides(n) {
                    showSlides(slideIndex += n);
                }

                function currentSlide(n) {
                    showSlides(slideIndex = n);
                }
                var nextBtn = document.querySelector('.slide_btn_next');
                var prevBtn = document.querySelector('.slide_btn_prev');
                nextBtn.addEventListener('click', function() {
                    plusSlides(1);
                });
                prevBtn.addEventListener('click', function() {
                    plusSlides(-1);
                });
            });

            $(document).ready(function() {
                connectWS();
                var s_id = $("#s_id").val();
                var s_img = $("#s_img").val();
                var my_id = $("#my_id").val();
            });

            function sendMessage(id, my_id, s_img) {
                //var message = $("#message" + s_img).val();
                //var message = $(".message").val();
                var message = document.getElementById("message" + s_img).value;
                console.log(id + ',' + my_id + ',' + s_img + ',' + message);
                console.log(message);
                $(".message").val('');

                if (socket) {
                    // websocket에 보내기!! (reply,댓글작성자,게시글작성자,글번호)
                    let socketMsg = message + "," + my_id + "," + id + "," + s_img;
                    console.debug("sssssssmsg>>", socketMsg)
                    socket.send(socketMsg);
                }
                /* var chat = document.getElementById("message" + s_img).value;
                sendMsg(); */

            }

            var socket = null;
            var ws;
            /* var userid = "${param.id}" */

            function connectWS() {
                console.log("tttttttttttttt")
                var ws = new WebSocket("ws://localhost:8090/tain/replyEcho");
                socket = ws;

                ws.onopen = function() {
                    console.log('Info: connection opened.');
                    /* register(); */
                };

                ws.onmessage = function(event) {
                    var data = event.data
                    console.log("ReceiveMessage:", data + '\n');
                    /* let $socketAlert = $('div#socketAlert');
                        $socketAlert.html(event.data);
                        $socketAlert.css('display', 'block');
                        
                        setTimeout( function() {
                            $socketAlert.css('display', 'none');
                        }, 3000); */
                    /* addMsg(data); */
                };

                ws.onclose = function(event) {
                    console.log('Info: connection closed.');
                    //setTimeout( function(){ connect(); }, 1000); // retry connection!!
                };
                ws.onerror = function(err) {
                    console.log('Error:', err);
                };

                /* function addMsg(msg){
                	var chat = ${"#message"}.val();
                	chat = chat +"\n상대방 : " + msg;
                	${"#message"}.val(chat);
                } */

                /* function register(){
                	var msg = {
                			type : "register",
                			userid: "${param.id}"
                	};
                	ws.send(JSON.stringify(msg));
                }
                
                function sendMsg(){
                	var msg = {
                			typd:"chat",
                			target: $("#s_id").val(),
                			message : ${"#message"}.val()
                			
                	};
                	ws.send(JSON.stringify(msg));
                } */

            }

        </script>

        </html>