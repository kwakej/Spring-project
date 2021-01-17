<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css">
            <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>
            <style>
                #header {
                    width: 100%;
                    display: flex;
                    justify-content: center;
                    position: fixed;
                    z-index: 4;
                    border-bottom: 0.5px solid black;
                }
                
                #big_con {
                    width: 1000px;
                }
                
                #header_con {
                    height: 54px;
                    background-color: white;
                }
                
                #alert_con {
                    width: 100%;
                    justify-content: center;
                    position: fixed;
                    top: 54px;
                    z-index: 4;
                    display: none;
                }
                
                #alert_con>div {
                    width: 1000px;
                }
                
                #chk_my_follower {
                    float: right;
                    width: 500px;
                    height: 65px;
                    background-color: crimson;
                    overflow: auto;
                }
                
                .fo_con {
                    float: left;
                    margin-left: 16px;
                    margin-top: 11px;
                }
                
                .fo_photo {
                    width: 44px;
                    height: 44px;
                    border-radius: 50%;
                    background-color: black;
                }
            </style>
        </head>

        <body>
            <header id="header">
                <div id="big_con">
                    <div id="header_con">
                        <div id="header_left">
                            <div id="fix_logo"></div>
                            <input type="hidden" name="m_id" class="m_id" value="${my_name }">
                        </div>
                        <input type="text" id="search" placeholder="검색" style="text-align: center;">
                        <div id="header_right">
                            <div id="header_icon_con">
                                <div id="fix_home" class="fix_icon"><i class="fas fa-home"></i></div>
                                <div id="fix_write" class="fix_icon"><i class="fas fa-arrow-circle-up"></i></div>
                                <div id="fix_message" class="fix_icon"><i class="fas fa-comment-dots"></i></div>
                                <div id="fix_alert" class="fix_icon"><label for="alert" style="cursor:pointer;"><i
                                            class="fas fa-bell"></i></label></div>
                                <input type="checkbox" id="alert" style="display:none;">
                                <div id="fix_bag" class="fix_icon"><i class="fas fa-shopping-bag"></i></div>
                                <div id="fix_profile" class="fix_icon"><i class="fas fa-user-circle"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <div id="alert_con">
                <div>
                    <div id="chk_my_follower">
                        <c:if test="${not empty chkfollow }">
                            <c:forEach var="vo" items="${chkfollow }" varStatus="s">
                                <div class="fo_con">
                                    <div class="fo_photo fo_photo${vo.id }">${vo.m_img }</div>
                                    <%-- <div class="fo_id">${vo.id }
                                </div> --%>
                                        <input type="hidden" class="fo_act fo_act${vo.id }" onclick="showfollowchk('${vo.id }', '${vo.m_activity }');" value="${vo.m_activity }">
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                    <!-- 아래에 실시간 알림 -->
                </div>
            </div>
            <div id="forheader"></div>
        </body>
        <script type="text/javascript">
            var memId = $(".m_id").val();
            $(function() {
                $("#search").autocomplete({
                    source: function(request, response) {
                        var request = $("#search").val();
                        console.log(request);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/autocomplete.do",
                            type: "post",
                            dataType: "json",
                            data: {
                                word: request
                            },
                            success: function(data) {
                                console.log(data);
                                console.log(data[0].word);
                                value1 = data[0].word;
                                console.log(value);
                                var value = new Array();
                                for (var i = 0; i < data.length; i++) {
                                    value.push(data[i].word)
                                }
                                response(
                                    $.map(value, function(item) {
                                        return {
                                            //label: item+"label",    
                                            value: item,
                                            test: item + "test"
                                        }
                                    })
                                )
                            },
                            error: function(request, status, error) {
                                alert("code:" +
                                    request.status +
                                    "\n" +
                                    "message:" +
                                    request.responseText +
                                    "\n" + "error:" +
                                    error);
                            }
                        });
                    }
                });

                $("#alert").change(function() {
                    if ($("#alert").is(":checked")) {
                        $("#alert_con").css("display", "flex");
                    } else {
                        $("#alert_con").css("display", "none");
                    }
                });

                $(".fo_act").trigger('click');

            });
            $("#fix_logo").on('click', function() {
                var memId = $(".m_id").val();
                var url = "${pageContext.request.contextPath}/timeLine";
                $(location).attr('href', url);
            });
            $("#fix_home").on('click', function() {
                var memId = $(".m_id").val();
                var url = "${pageContext.request.contextPath}/timeLine";
                $(location).attr('href', url);
            });
            $("#fix_write").on('click', function() {
                var memId = $(".m_id").val();
                var url = "${pageContext.request.contextPath}/gnWrite";
                $(location).attr('href', url);
            });
            $("#fix_profile").on('click', function() {
                var memId = $(".m_id").val();
                var url = "${pageContext.request.contextPath}/gnMain?m_id=" + memId;
                $(location).attr('href', url);
            });

            $("#search").on("keypress", function(event) {
                if (window.event.keyCode == 13) {
                    var at = "@";
                    var hashtag = $("#search").val();
                    if (hashtag.startsWith(at)) {
                        hashtag = hashtag.replace(/[@]/g, '');

                        $.ajax({
                            url: "${pageContext.request.contextPath}/showMemberType.do",
                            type: "post",
                            data: {
                                m_id: hashtag
                            },
                            success: function(data) {
                                console.log(data);
                                if (data == 'G') {
                                    var url = "${pageContext.request.contextPath}/gnMain?m_id=" + hashtag;
                                    $(location).attr('href', url);
                                } else if (data == 'B'){
                                	
                                }
                            },
                            error: function(request, status, error) {
                                alert("code:" +
                                    request.status +
                                    "\n" +
                                    "message:" +
                                    request.responseText +
                                    "\n" + "error:" +
                                    error);
                            }
                        });
                    } else {
                        hashtag = hashtag.replace(/[#]/g, '');
                        var url = "${pageContext.request.contextPath}/explore?hashtag=" + hashtag;
                        $(location).attr('href', url);

                    }
                }
            });

            function showfollowchk(id, m_activity) {
                if (m_activity == 1) {
                    $(".fo_photo" + id).css("background-color", "blue");
                }
            }
        </script>

        </html>