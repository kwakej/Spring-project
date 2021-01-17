<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>TA_IN 타임라인</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <link href="${pageContext.request.contextPath}/resources/css/timeLine.css" rel="stylesheet" type="text/css">
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>
            <style>
                .like_icon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/002-heart.svg');
                    background-size: 24px;
                }
                
                .like_icon:hover {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
                    background-size: 24px;
                }
                
                .unlike_icon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
                    background-size: 24px;
                    display: none;
                }
                
                .share_icon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-share-1.svg');
                    background-size: 24px;
                }
                
                .share_icon:hover {
                    background-image: url('${pageContext.request.contextPath}/resources/images/002-share.svg');
                    background-size: 24px;
                }
                
                .write_icon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/002-speech-bubble-1.svg');
                    background-size: 24px;
                }
                
                .write_icon:hover {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-speech-bubble.svg');
                    background-size: 24px;
                }
                
                .save_icon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-tag.svg');
                    background-size: 24px;
                }
                
                .save_icon:hover {
                    background-image: url('${pageContext.request.contextPath}/resources/images/006-price-tag.svg');
                    background-size: 24px;
                }
                
                .comment_lcon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/002-heart.svg');
                    background-size: 12px;
                }
                
                .comment_lcon:hover {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
                }
                
                .comment_unlcon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
                    background-size: 12px;
                    display: none;
                }
                
                .timeline_photo {
                    width: 660px;
                    height: 660px;
                    position: relative;
                    overflow: hidden;
                    z-index: -1;
                }
                
                .timephoto {
                    display: flex;
                    position: absolute;
                    top: 0px;
                    left: 0px;
                }
                
                .show_t_img {
                    width: 660px;
                    height: 660px;
                }
                
                #right_small_con {
                    width: 320px;
                    float: right;
                    margin-left: 20px;
                    position: fixed;
                }
                
                #report_back {
                    position: fixed;
                    width: 100%;
                    height: 100%;
                    background-color: black;
                    opacity: 0.5;
                    display: none;
                    z-index: 5;
                }
                
                #report_modal {
                    position: fixed;
                    width: 100%;
                    height: 100%;
                    display: none;
                    z-index: 6;
                }
                
                #report_choose,
                #report_write,
                #report_result,
                #report_already,
                #pre_report_choose,
                #unfollowchk,
                #askunfollow,
                #cantunfollow,
                #share_con,
                #share_con_result {
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    width: 400px;
                    background: #fff;
                    z-index: 7;
                    border-radius: 20px;
                    text-align: center;
                    font-size: 14px;
                }
                
                .modal_in {
                    width: 100%;
                    height: 48px;
                    line-height: 48px;
                    cursor: pointer;
                    border-bottom: 1px solid #8E8E8E;
                    color: #262626;
                }
                
                .cancel {
                    border: none;
                }
                
                #etc_write_con {
                    height: 192px;
                }
                
                #etx_write_space {
                    margin-top: 5px;
                    margin-left: 16px;
                    width: 364px;
                    height: 182px;
                    padding: 0px;
                    border: none;
                    outline: none;
                }
                
                .modal_title {
                    height: 42px;
                }
                
                #report {
                    color: #ED4956;
                }
                
                .modal_nocursor {
                    cursor: default;
                }
                
                .modal_result {
                    height: 96px;
                }
                
                .fa-bars_title {
                    display: block;
                    margin-right: 16px;
                    float: right;
                    line-height: 60px;
                }
            </style>
        </head>

        <body>
            <div id="report_back"></div>
            <div id="report_modal">
                <div id="report_choose" style="display: none;">
                    <div id="report" class="modal_in modal_title modal_nocursor">신고하기</div>
                    <div id="fword" class="modal_in send_report">욕설</div><input type="hidden" value="욕설">
                    <div id="pornography" class="modal_in send_report">음란물</div><input type="hidden" value="음란물">
                    <div id="falsecon" class="modal_in send_report">허위내용</div><input type="hidden" value="허위내용">
                    <div id="embezzlement" class="modal_in send_report">도용된 자료 포함</div><input type="hidden" value="도용된 자료 포함">
                    <div id="etc" class="modal_in">기타</div>
                    <div id="cancel" class="modal_in cancel">취소</div>
                </div>
                <div id="report_write" style="display: none;">
                    <div id="etc_con" class="modal_in modal_title modal_nocursor">이 게시물을 신고한는 이유</div>
                    <div id="etc_write_con" class="modal_in">
                        <textarea id="etx_write_space"></textarea>
                    </div>
                    <div id="send_r" class="modal_in send_report_text">신고하기</div>
                    <div id="cancel_2" class="modal_in cancel">취소</div>
                </div>
                <div id="report_result" style="display: none;">
                    <div class="modal_in  modal_title modal_nocursor">신고 완료</div>
                    <div class="modal_in modal_nocursor modal_result">${my_name }님의 신고가 정상적으로 접수되었습니다.<br> 빠른 시일 내 검토 후 조치하겠습니다.</div>
                    <div id="cancel_3" class="modal_in cancel">화면으로 돌아가기</div>
                </div>
                <div id="report_already" style="display: none;">
                    <div class="modal_in modal_nocursor modal_result">이미 신고하셨습니다.<br> 빠른 시일 내 검토 후 조치하겠습니다.</div>
                    <div id="cancel_4" class="modal_in cancel">화면으로 돌아가기</div>
                </div>
                <div id="askunfollow" style="display: none;">
                    <div class="modal_in modal_nocursor">팔로우를 취소하시겠습니까?</div>
                    <div id="yes_unfollow" class="modal_in">팔로우 취소하기</div>
                    <div id="cancel_7" class="modal_in cancel">화면으로 돌아가기</div>
                </div>
                <div id="unfollowchk" style="display: none;">
                    <div class="modal_in modal_nocursor">팔로우가 취소되었습니다.</div>
                    <div id="cancel_6" class="modal_in cancel" onclick="location.href='timeLineList.do'">화면으로 돌아가기</div>
                </div>
                <div id="cantunfollow" style="display: none;">
                    <div class="modal_in modal_nocursor">나 자신은 팔로우 취소할 수 없어요!</div>
                    <div id="cancel_8" class="modal_in cancel" onclick="location.href='timeLineList.do'">화면으로 돌아가기</div>
                </div>
                <div id="pre_report_choose" style="display: none;">
                    <div id="pre_report_re" class="modal_in toreport" onclick="report('b_id', 'id', 'type');">게시물 신고하기
                    </div>
                    <div id="pre_unfollow" class="modal_in">팔로우 취소</div>
                    <div id="pre_go" class="modal_in">게시물로 이동하기</div>
                    <div id="cancel_5" class="modal_in cancel">취소</div>
                </div>
                <div id="share_con" style="display: none;">
                    <div class="modal_in modal_title modal_nocursor">게시물 공유하기</div>
                    <div id="url_con" class="modal_in">
                        <textarea id="url" readonly></textarea>
                    </div>
                    <div id="share_chk" class="modal_in">복사하기</div>
                    <div id="cancel_9" class="modal_in cancel">취소</div>
                </div>
                <div id="share_con_result" style="display: none;">
                    <div class="modal_in modal_title modal_nocursor">게시물의 주소가 복사됐습니다.</div>
                    <div id="cancel_10" class="modal_in cancel">화면으로 돌아가기</div>
                </div>
            </div>
            <jsp:include page="../header.jsp"></jsp:include>
            <div id="content_con">
                <div id="timeline_big_con">
                    <div id="timeline_left">
                        <div id="story_con">
                            <div id="blank_for_story"></div>
                            <div id="story_inner_con">
                                <div class="story_small_con my_story_add">
                                    <div class="story_profile"></div>
                                    <div class="story_id">내 스토리</div>
                                </div>
                                <div class="story_small_con show_all_story">
                                    <div class="story_profile"></div>
                                    <div class="story_id">스토리 전체 보기</div>
                                </div>
                                <c:if test="${not empty storyList }">
                                    <c:forEach var="vo" items="${storyList }" varStatus="s">
                                        <div class="story_small_con eachstory" onclick="eachstory('${vo.m_id }');">
                                            <div class="story_profile">${vo.m_img }</div>
                                            <div class="story_id">${vo.m_id }</div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                        <div id="timeline_blank"></div>
                        <c:if test="${not empty timeLineList }">
                            <c:forEach var="vo" items="${timeLineList }" varStatus="s">
                                <div class="timeline_contents">
                                    <div class="timeline_profile">
                                        <div class="t_prof_photo" onclick="goboard('${vo.m_id }');" style="cursor:pointer;">${vo.m_img }</div>
                                        <div class="t_prof_id" onclick="goboard('${vo.m_id }');" style="cursor:pointer;">${vo.m_id }
                                        </div>
                                        <i class="fas fa-bars fa-bars_title" onclick="pre_report('${vo.t_id}','${vo.m_id }','${vo.t_type}');"></i>
                                    </div>
                                    <div class="timeline_photo timeline_photo${vo.t_id }">
                                        <ul class="photo${vo.t_id } timephoto">
                                        </ul>
                                        <input type="hidden" class="hidden_showphoto" onclick="showphoto('${vo.t_id }','${vo.t_img }');">
                                    </div>
                                    <button type="button" class="slidebtn slidebtn${vo.t_id } slide_btn_prev slide_btn_prev${vo.t_id }" style="display:none;">Prev</button>
                                    <button type="button" class="slidebtn slidebtn${vo.t_id } slide_btn_next slide_btn_next${vo.t_id }" style="display:none;">Next</button>
                                    <div class="timeline_comment_con">
                                        <div class="inner_comment_con">
                                            <div class="timeline_icon_con">
                                                <div class="icon like_icon likechk${vo.t_id }" onclick="pressLike('${vo.t_id}');"></div>
                                                <div class="icon unlike_icon unlikechk${vo.t_id }" onclick="pressUnlike('${vo.t_id}');"></div>
                                                <div class="icon write_icon"></div>
                                                <div class="icon share_icon" onclick="shareurl('${vo.t_id}')"></div>
                                                <div class="icon save_icon"></div>
                                            </div>
                                            <div class="timeline_likes_con">좋아요 <input type="text" class="lCount${vo.t_id} showlCount" value="" readonly>개</div>
                                            <div class="comment_con">
                                                <div class="com_detail post_title">
                                                    <div class="post_id" onclick="goboard('${vo.m_id }');" style="cursor:pointer;">${vo.m_id }</div>
                                                    <div class="post_content">${vo.t_content }</div>
                                                </div>
                                                <ul class="hashtag${vo.t_id }">
                                                </ul>
                                                <input type="hidden" class="hidden_showhashtag" onclick="showhashtag('${vo.t_id }');">
                                                <div class="com_detail comment_more" onclick="showAllCo('${vo.t_id }');">댓글 전체 보기</div>
                                                <div class="com_detail cm1 cm1${vo.t_id }">
                                                    <div class="commentRId post_id commentRIdf"></div>
                                                    <div class="commentResult post_content commentResultf">
                                                    </div>
                                                    <!-- <a class="commentViewAll"></a> -->
                                                </div>
                                                <ul class="cm2${vo.t_id }">
                                                </ul>
                                                <ul class="cm3${vo.t_id }">
                                                </ul>
                                                <input type="hidden" class="hidden_likechk" onclick="likechk('${vo.t_id }');"> <input type="hidden" class="hidden_commentchk" onclick="showAllCoHidden('${vo.t_id }');">
                                                <input type="hidden" name="t_type" class="t_type${vo.t_id }" value="${vo.t_type }">

                                                <!-- ---------------------------------게시물 좋아요 수 카운트 trigger---------------------------------- -->
                                                <input type="hidden" value="${vo.t_id}" class="countLike_trigger" onclick="countLike('${vo.t_id}');">
                                                <!-- -------------------------------------------------------------------------------------------- -->
                                            </div>
                                            <div class="timeline_time">${vo.t_time }</div>
                                        </div>
                                    </div>
                                    <div class="upload_comment">
                                        <div class="inner_comment_con inner_upload">
                                            <input type="text" class="write_space" placeholder="댓글 달기..." name="t_comment">
                                            <button class="comment_upload">게시</button>
                                            <input type="hidden" name="t_id" value="${vo.t_id }"> <input type="hidden" name="t_type" value="${vo.t_type }" class="t_type${vo.t_id }">
                                        </div>
                                    </div>

                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                    <div id="timeline_right">
                        <div id="right_small_con">
                            <div id="my_profile_con">
                                <div id="my_profile_photo" onclick="goboard('${my_name }');" style="cursor:pointer;">${myProfile.m_img }</div>
                                <div id="my_id" onclick="goboard('${my_name }');" style="cursor:pointer;">${my_name }</div>
                                <input type="hidden" name="m_id" class="m_id" value="${my_name }">
                            </div>
                            <div id="follow_recom_title">회원님을 위한 추천</div>
                            <div id="follow_recom_con">
                                <c:if test="${not empty recomFollow }">
                                    <c:forEach var="vo" items="${recomFollow }" varStatus="s">
                                        <div class="follow_recom_id">
                                            <div class="recom_profile" onclick="goboard('${vo.r_mid }');" style="cursor:pointer;">${vo.m_img }</div>
                                            <div class="recom_middle">
                                                <div class="recom_id" onclick="goboard('${vo.r_mid }');" style="cursor:pointer;">${vo.r_mid }</div>
                                                <div class="recom_info">${vo.count }명이 팔로우합니다</div>
                                            </div>
                                            <button class="recom_follow followBtn" style="cursor:pointer;">팔로우</button>
                                            <input type="hidden" value="${vo.r_mid }">
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                            <div id="footer_info"></div>
                            <div id="footer_infoc">© 2020 TA_IN</div>
                        </div>
                    </div>
                </div>


            </div>

        </body>
        <script type="text/javascript">
            var memId = $(".m_id").val();
            $(function() {

                // 페이지 로딩 시 처음 두개 댓글 나타내기 trigger 호출
                $(".hidden_commentchk").trigger('click');

                // 게시물 좋아요 체크 trigger 호출
                $(".hidden_likechk").trigger('click');

                // 게시물 좋아요 수 카운트 trigger 호출
                $(".countLike_trigger").trigger('click');

                // 게시물 이미지 보기 trigger 호출
                $(".hidden_showphoto").trigger('click');

                // 해쉬태그 보기 trigger 호출
                $(".hidden_showhashtag").trigger('click');
                //회원 추천 팔로우
                $(".followBtn").on('click', function() {
                    var r_mid = $(this).next().val();
                    console.log(memId);
                    console.log(r_mid);
                    $(this).next().parent().remove();
                    $.ajax({
                        url: "${pageContext.request.contextPath}/insertFollow.do",
                        method: "POST",
                        data: {
                            m_id: memId,
                            r_mid: r_mid
                        },
                        success: function(data) {
                            console.log("memId : " +
                                memId +
                                " r_mid : " +
                                r_mid);
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
                });

            });

            // 스토리 업로드 페이지로 이동
            $(".my_story_add").on('click', function() {
                var url = "${pageContext.request.contextPath}/writeStory";
                $(location).attr('href', url);
            });
            // 스토리 전체보기 페이지로 이동
            $(".show_all_story").on('click', function() {
                var url = "${pageContext.request.contextPath}/stories";
                $(location).attr('href', url);
            });
            // 스토리 각 페이지로 이동
            function eachstory(id) {
                var url = "${pageContext.request.contextPath}/eachstory?id=" + id;
                $(location).attr('href', url);
            }

            // 계정 상세페이지 이동          타입 추가 필요
            function goboard(id) {
                var url = "${pageContext.request.contextPath}/gnMain?m_id=" + id;
                $(location).attr('href', url);
            }

            // 게시물 이미지 보기 trigger
            function showphoto(t_id, t_img) {
                t_img = t_img.split("|");
                for (i = 0; i < t_img.length; i++) {
                    if (t_img[i] != "" && t_img[i] != " ") {
                        $(".photo" + t_id).append('<li class="show_t_img show_t_img' + t_id + '" >' + t_img[i] + '</li>');
                    }
                }

                var photocount = $(".show_t_img" + t_id).length;
                if (photocount > 1) {
                    $(".slidebtn" + t_id).css("display", "block");
                }

                // 게시물 슬라이드
                var slideWrapper = document.querySelector('.timeline_photo' + t_id);
                var slides = document.querySelectorAll('.show_t_img' + t_id);
                var totalSlides = slides.length;
                var sliderWidth = slideWrapper.clientWidth;
                var slideIndex = 0;
                var slider = document.querySelector('.photo' + t_id);
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
                var nextBtn = document.querySelector('.slide_btn_next' + t_id);
                var prevBtn = document.querySelector('.slide_btn_prev' + t_id);
                nextBtn.addEventListener('click', function() {
                    plusSlides(1);
                });
                prevBtn.addEventListener('click', function() {
                    plusSlides(-1);
                });
            }

            // 해쉬태그 보기 trigger
            function showhashtag(t_id) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/showHashTag.do",
                    type: "post",
                    dataType: "json",
                    data: {
                        t_id: t_id
                    },
                    success: function(hashtag) {
                        var count = hashtag;
                        if (count.hashtag == undefined) {} else {
                            for (var i = 0; i < count.hashtag.length; i++) {
                                var hashtag1 = count.hashtag[i].h_tag;

                                // 해쉬태그 append - hashtag
                                $(".hashtag" + t_id).append('<a href="${pageContext.request.contextPath}/explore?hashtag=' + hashtag1 + '">#' + hashtag1 + '</a>');
                            }
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
            }

            // 댓글 등록 (일반 & 비즈니스 게시판 분리)
            // 처음 등록된 댓글에는 좋아요 & 변환 불가
            $(".comment_upload").on('click', function() {
                var postid = $(this).next().val();
                var comment = $(this).prev().val();
                var type = $(this).next().next().val();
                console.log(postid);
                console.log(comment);
                console.log(memId);
                console.log(type);
                if (comment == "" || comment == null) {
                    console.log("comment won't be uploaded");
                    return false;
                } else {

                    // 댓글 append - cm1
                    $(this).parent().parent().prev().find(".comment_more").css("display", "block");
                    $(this).parent().parent().prev().find(".cm1").css("display", "block");
                    $(this).parent().parent().prev().find(".commentRIdf").text(memId);
                    $(this).parent().parent().prev().find(".commentResultf").text(comment);

                    // 댓글 등록 - 일반 게시판
                    if (type == "G") {
                        console.log("board comment upload!");
                        $.ajax({
                            url: "${pageContext.request.contextPath}/coInsert.do",
                            method: "POST",
                            data: {
                                m_id: memId,
                                t_comment: comment,
                                t_id: postid
                            },
                            success: function(data) {
                                console.log("memId : " +
                                    memId +
                                    " comment : " +
                                    comment +
                                    " postid : " +
                                    postid);
                                $(".write_space").val('');
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

                        // 댓글 등록 - 비즈니스 게시판
                    } else if (type == "B") {
                        console.log("businessboard comment upload!");
                        $.ajax({
                            url: "${pageContext.request.contextPath}/coInsertB.do",
                            method: "POST",
                            data: {
                                m_id: memId,
                                t_comment: comment,
                                t_id: postid
                            },
                            success: function(data) {
                                console.log("memId : " +
                                    memId +
                                    " comment : " +
                                    comment +
                                    " postid : " +
                                    postid);
                                $(".write_space").val('');
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
                }
            });


            // 게시글 좋아요 카운트 trigger - countLike_trigger
            function countLike(b_id) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/countLike.do",
                    method: "POST",
                    data: {
                        t_id: b_id
                    },
                    success: function(data) {
                        var result = data;
                        $(".lCount" + b_id).val(data);
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

            // 게시물 좋아요 체크 trigger - .hidden_likechk
            function likechk(t_id) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/hiddenShowLike.do",
                    method: "POST",
                    data: {
                        b_id: t_id,
                        m_id: memId
                    },
                    dataType: "json",
                    success: function(hLike) {
                        if (hLike >= 1) {
                            $(".likechk" + t_id).css("display", "none");
                            $(".unlikechk" + t_id).css("display", "block");
                        }
                    },
                    error: function(request,
                        status, error) {
                        console.log("code:" +
                            request.status +
                            "\n" +
                            "message:" +
                            request.responseText +
                            "\n" + "error:" +
                            error);
                    }
                });
            }

            // 게시물 좋아요 (일반 & 비즈니스 게시판 분리)
            function pressLike(t_id) {
                var type = $(".t_type" + t_id).val();
                var lcount = $(".lCount" + t_id).val();
                console.log(t_id);
                console.log(lcount);
                lcount++;
                console.log(lcount);

                // 게시물 좋아요 - 일반 게시판
                if (type == "G") {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/pressLike.do",
                        method: "POST",
                        data: {
                            m_id: memId,
                            t_id: t_id
                        },
                        success: function(data) {
                            console.log("memId : " +
                                memId +
                                " t_id : " +
                                t_id);
                            $(".likechk" + t_id).css("display", "none");
                            $(".unlikechk" + t_id).css("display", "block");
                            //$(".lCount" + t_id).val(lcount);

                            // 게시물 좋아요 수 카운트 trigger 호출
                            $(".countLike_trigger").trigger('click');
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

                    // 게시물 좋아요 - 비즈니스 게시판
                } else if (type = "B") {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/pressLikeB.do",
                        method: "POST",
                        data: {
                            m_id: memId,
                            t_id: t_id
                        },
                        success: function(data) {
                            console.log("memId : " +
                                memId +
                                " t_id : " +
                                t_id);
                            $(".likechk" + t_id).css("display", "none");
                            $(".unlikechk" + t_id).css("display", "block");
                            //$(".lCount" + t_id).val(lcount);

                            // 게시물 좋아요 수 카운트 trigger 호출
                            $(".countLike_trigger").trigger('click');
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
            }

            // 게시물 좋아요 취소 (일반 & 비즈니스 게시판 분리)
            function pressUnlike(t_id) {
                var type = $(".t_type" + t_id).val();
                var lcount = $(".lCount" + t_id).val();
                lcount--;

                // 게시물 좋아요 취소 - 일반 게시판
                if (type == "G") {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/pressUnLike.do",
                        method: "POST",
                        data: {
                            m_id: memId,
                            t_id: t_id
                        },
                        success: function(data) {
                            console.log("memId : " +
                                memId +
                                " t_id : " +
                                t_id);
                            $(".likechk" + t_id).css("display", "block");
                            $(".unlikechk" + t_id).css("display", "none");
                            $(".lCount" + t_id).val(lcount);
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

                    // 게시물 좋아요 취소 - 비즈니스 게시판
                } else if (type = "B") {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/pressUnLikeB.do",
                        method: "POST",
                        data: {
                            m_id: memId,
                            t_id: t_id
                        },
                        success: function(data) {
                            console.log("memId : " +
                                memId +
                                " t_id : " +
                                t_id);
                            $(".likechk" + t_id).css("display", "block");
                            $(".unlikechk" + t_id).css("display", "none");
                            $(".lCount" + t_id).val(lcount);
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
            }

            function shareurl(b_id) {
                $("#report_modal").css("display", "block");
                $("#report_back").css("display", "block");
                $("#pre_report_choose").css("display", "none");
                $("#share_con").css("display", "block");
                $("#url").val(b_id);
                $("#share_chk").on('click', function() {
                    var curl = document.getElementById("url");
                    curl.select();
                    document.execCommand('copy');
                    curl.setSelectionRange(0, 0);
                    $("#share_con").css("display", "none");
                    $("#share_con_result").css("display", "block");
                });
            }

            function copyToClipboard() {

            }

            function pre_report(b_id, id, type) {
                $("#report_modal").css("display", "block");
                $("#report_back").css("display", "block");
                $("#pre_report_choose").css("display", "block");
                $(".toreport").on('click', function() {
                    $("#pre_report_choose").css("display", "none");
                    report(b_id, id, type);
                });
                $("#pre_unfollow").on('click', function() {
                    $("#pre_report_choose").css("display", "none");
                    if (memId == id) {
                        $("#cantunfollow").css("display", "block");
                        $("#askunfollow").css("display", "none");
                    } else {
                        $("#askunfollow").css("display", "block");
                        $("#yes_unfollow").on('click', function() {
                            $.ajax({
                                url: "${pageContext.request.contextPath}/unfollow.do",
                                method: "POST",
                                data: {
                                    m_id: memId,
                                    id: id
                                },
                                success: function(data) {
                                    console.log("언팔 완료");
                                    $("#askunfollow").css("display", "none");
                                    $("#unfollowchk").css("display", "block");
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
                        });
                    }
                });
            }

            // 댓글 신고 (일반 & 비즈니스 게시판 분리)
            function report(b_id, id, type) {
                console.log(b_id);
                console.log(id);
                console.log(memId);
                console.log(type);
                $.ajax({
                    url: "${pageContext.request.contextPath}/reportchk.do",
                    method: "POST",
                    data: {
                        b_id: b_id,
                        m_id: memId
                    },
                    dataType: "json",
                    success: function(hLike) {
                        if (hLike == 0) {
                            $("#report_modal").css("display", "block");
                            $("#report_back").css("display", "block");
                            $("#report_choose").css("display", "block");
                            $("#report_result").css("display", "none");
                            $("#report_already").css("display", "none");

                            if (type == "G") {
                                $(".send_report").on('click', function() {
                                    var report_reason = $(this).next().val();
                                    console.log(report_reason);
                                    console.log(b_id);
                                    console.log(id);
                                    console.log(memId);

                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/insertReport.do",
                                        method: "POST",
                                        data: {
                                            b_id: b_id,
                                            m_id: memId,
                                            r_reason: report_reason
                                        },
                                        success: function(data) {
                                            console.log("신고 완료");
                                            $("#report_choose").css("display", "none");
                                            $("#report_write").css("display", "none");
                                            $("#pre_report_choose").css("display", "none");
                                            $("#report_result").css("display", "block");
                                            $(".send_report").off('click');
                                            $(".toreport").off('click');

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
                                });
                                $(".send_report_text").on('click', function() {
                                    var report_reason = $("#etx_write_space").val();
                                    console.log(report_reason);
                                    console.log(b_id);
                                    console.log(id);
                                    console.log(memId);

                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/insertReport.do",
                                        method: "POST",
                                        data: {
                                            b_id: b_id,
                                            m_id: memId,
                                            r_reason: report_reason
                                        },
                                        success: function(data) {
                                            console.log("신고 완료");
                                            $("#report_choose").css("display", "none");
                                            $("#report_write").css("display", "none");
                                            $("#report_result").css("display", "block");
                                            $("#pre_report_choose").css("display", "none");
                                            $("#etx_write_space").val('');
                                            $(".send_report_text").off('click');
                                            $(".toreport").off('click');
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
                                });
                            } else if (type == "B") {
                                $(".send_report").on('click', function() {
                                    var report_reason = $(this).next().val();
                                    console.log(report_reason);
                                    console.log(b_id);
                                    console.log(id);
                                    console.log(memId);

                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/insertReportB.do",
                                        method: "POST",
                                        data: {
                                            b_id: b_id,
                                            m_id: memId,
                                            r_reason: report_reason
                                        },
                                        success: function(data) {
                                            console.log("신고 완료");
                                            $("#report_choose").css("display", "none");
                                            $("#report_write").css("display", "none");
                                            $("#pre_report_choose").css("display", "none");
                                            $("#report_result").css("display", "block");
                                            $(".send_report").off('click');
                                            $(".toreport").off('click');
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
                                });
                                $(".send_report_text").on('click', function() {
                                    var report_reason = $("#etx_write_space").val();
                                    console.log(report_reason);
                                    console.log(b_id);
                                    console.log(id);
                                    console.log(memId);

                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/insertReportB.do",
                                        method: "POST",
                                        data: {
                                            b_id: b_id,
                                            m_id: memId,
                                            r_reason: report_reason
                                        },
                                        success: function(data) {
                                            console.log("신고 완료");
                                            $("#report_choose").css("display", "none");
                                            $("#report_write").css("display", "none");
                                            $("#pre_report_choose").css("display", "none");
                                            $("#report_result").css("display", "block");
                                            $("#etx_write_space").val('');
                                            $(".send_report_text").off('click');
                                            $(".toreport").off('click');
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
                                });
                            }
                        } else if (hLike >= 1) {
                            $("#report_modal").css("display", "block");
                            $("#report_back").css("display", "block");
                            $("#report_already").css("display", "block");
                            $("#report_choose").css("display", "none");
                            $("#pre_report_choose").css("display", "none");


                        }
                    },
                    error: function(request,
                        status, error) {
                        console.log("code:" +
                            request.status +
                            "\n" +
                            "message:" +
                            request.responseText +
                            "\n" + "error:" +
                            error);
                    }
                });

            }

            $(".cancel").on('click', function() {
                $("#report_modal").css("display", "none");
                $("#report_back").css("display", "none");
                $("#report_write").css("display", "none");
                $("#report_result").css("display", "none");
                $("#report_choose").css("display", "none");
                $("#report_already").css("display", "none");
                $("#pre_report_choose").css("display", "none");
                $("#unfollowchk").css("display", "none");
                $("#askunfollow").css("display", "none");
                $("#cantunfollow").css("display", "none");
                $("#share_con").css("display", "none");
                $("#share_con_result").css("display", "none");
            });

            $("#etc").on('click', function() {
                $("#report_choose").css("display", "none");
                $("#report_write").css("display", "block");
            });




            // 전체 댓글보기 눌렀을 때 (일반 & 비즈니스 게시판 분리)
            function showAllCo(t_id) {
                var type = $(".t_type" + t_id).val();
                var mem_id = $(".m_id").val();

                // 전체 댓글보기 - 일반 게시판
                if (type == "G") {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/hiddenShowAllCo.do",
                        method: "POST",
                        data: {
                            t_id: t_id
                        },
                        dataType: "json",
                        success: function(hComment) {
                            var count = hComment;

                            for (var i = 0; i < count.hComment.length; i++) {
                                var id = count.hComment[i].m_id;
                                var b_content = count.hComment[i].b_content;
                                var b_id = count.hComment[i].b_id;
                                var b_type = count.hComment[i].b_type;
                                var countr = count.hComment[i].count;
                                var b_date = count.hComment[i].b_date;

                                // 댓글 중복 나타냄 방지 remove - cm1, cm2
                                $(".cm1" + t_id).remove();
                                $(".cm2" + t_id).remove();

                                // 전체 댓글 append - cm3  // 댓글 좋아요 체크 trigger 사용
                                $(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" onclick="goboard(\'' + id + '\');" style="cursor:pointer;">' +
                                    id + '</div><div class="commentResult post_content">' +
                                    b_content + '</div><a class="commentViewAll"></a><i class="fas fa-bars" onclick="report(\'' + b_id + '\',\'' + id + '\',\'' + type + '\');"></i><div class="comment_lcon clcon likechk' + b_id + ' lbtn"></div>' +
                                    '<div class="comment_unlcon clcon unlikechk' + b_id + ' unlbtn"></div>' +
                                    '<input type="hidden" value="' + b_id + '"></div></div>');
                                $(".cm3" + t_id).append("<input type='hidden' class='" + b_id + "lBtn hidden_likechk' onclick='likechk(\"" + b_id + "\");' value='" + b_id + "'>" +
                                    "<input type='hidden' class='" + b_id + "forRbtn' value='" + b_type + "'>");

                                // 답글 유무 분리 - 답글 유
                                if (countr != 0) {

                                    // 댓글 변환 권한 - 권한 있음
                                    if (id == mem_id) {
                                        $(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                            '<div class="moreCo">좋아요 <input type="text" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                            '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                            '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>' +
                                            '<div class="moreCo' + b_id + ' moreCo moreCo_see">답글 보기(' + countr + ')개</div>' +
                                            '<div class="moreCoMo' + b_id + ' moreCo moreCoMo">댓글 수정</div>' +
                                            '<div class="moreCoDe' + b_id + ' moreCo moreCoDe">댓글 삭제</div>' +
                                            '<input type="hidden" value="' + b_id + '">' +
                                            '<input type="hidden" value="' + id + '">' +
                                            '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                            '<div class="com_detail replyCo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>' +
                                            '<div class="com_detail replyMo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoMo write_space" value="' + b_content + '"><button class="rep_comment_modify">수정</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>' +
                                            '<ul class="cm4' + b_id + '"></ul>'
                                        );

                                        // 댓글 변환 권한 - 권한 없음
                                    } else {
                                        $(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                            '<div class="moreCo">좋아요 <input type="text" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                            '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                            '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>' +
                                            '<div class="moreCo' + b_id + ' moreCo moreCo_see">답글 보기(' + countr + ')개</div>' +
                                            '<div class="moreCoMo' + b_id + ' moreCo moreCoMo" style="display:none;">댓글 수정</div>' +
                                            '<div class="moreCoDe' + b_id + ' moreCo moreCoDe" style="display:none;">댓글 삭제</div>' +
                                            '<input type="hidden" value="' + b_id + '">' +
                                            '<input type="hidden" value="' + id + '">' +
                                            '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                            '<div class="com_detail replyCo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>' +
                                            '<ul class="cm4' + b_id + '"></ul>'
                                        );
                                    }

                                    // 답글 유무 분리 - 답글 무
                                } else {

                                    // 댓글 변환 권한 - 권한 있음
                                    if (id == mem_id) {
                                        $(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                            '<div class="moreCo">좋아요 <input type="text" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                            '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                            '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>' +
                                            '<div class="moreCoMo' + b_id + ' moreCo moreCoMo">댓글 수정</div>' +
                                            '<div class="moreCoDe' + b_id + ' moreCo moreCoDe">댓글 삭제</div>' +
                                            '<input type="hidden" value="' + b_id + '">' +
                                            '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                            '<div class="com_detail replyCo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>' +
                                            '<div class="com_detail replyMo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoMo write_space" value="' + b_content + '"><button class="rep_comment_modify">수정</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>');

                                        // 댓글 변환 권한 - 권한 없음
                                    } else {
                                        $(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                            '<div class="moreCo">좋아요 <input type="text" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                            '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                            '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div><div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                            '<div class="com_detail replyCo"  style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>'
                                        );
                                    }

                                }
                            }

                            // 댓글 좋아요 체크 trigger 호출
                            $(".hidden_likechk").trigger('click');

                            // 댓글 좋아요 수 카운트 trigger 호출
                            $(".countLike_trigger").trigger('click');

                            // 댓글 삭제 - 일반 게시판
                            $(".moreCoDe").on('click', function() {
                                var b_id = $(this).next().val();
                                console.log(memId);
                                console.log(b_id);
                                $(this).parent().next().next("ul").remove();
                                $(this).parent().prev().remove();
                                $(this).parent().prev().remove();
                                $(this).parent().prev().remove();
                                $(this).parent().remove();
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/deleteComment.do",
                                    method: "POST",
                                    data: {
                                        b_id: b_id
                                    },
                                    async: false,
                                    success: function(data) {
                                        console.log("memId : " +
                                            memId +
                                            " b_id : " +
                                            b_id);
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
                            });

                            // 댓글 수정 - 일반 게시판
                            $(".moreCoMo").on('click', function() {
                                $(this).parent().next().next().css("display", "block");
                                $(".rep_comment_modify").on('click', function() {
                                    var comment = $(this).prev().val();
                                    var b_id = $(this).next().val();
                                    console.log(comment);
                                    console.log(b_id);
                                    $(this).parent().prev().prev().prev().prev().prev().find('.commentResult').text(comment);
                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/updateComment.do",
                                        method: "POST",
                                        data: {
                                            t_comment: comment,
                                            t_id: b_id
                                        },
                                        success: function(data) {
                                            console.log(" comment : " +
                                                comment +
                                                " b_id : " +
                                                b_id);
                                            $(".replyMo").css("display", "none");
                                            $('.rep_comment_modify').off('click');

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

                                });
                            });

                            // 답글 달기 - 일반 게시판
                            $(".moreCoW").on('click', function() {
                                $(this).parent().next().css("display", "block");
                                $(".rep_comment_upload").on('click', function() {
                                    var b_id = $(this).next().val();
                                    var r_comment = $(this).prev().val();
                                    var r_type = $(this).next().next().val();
                                    console.log(memId);
                                    console.log(b_id);
                                    console.log(r_comment);
                                    console.log(r_type);
                                    if (r_comment == "" || r_comment == null) {
                                        console.log("reply comment won't be uploaded");
                                        $(".replyCo").css("display", "none");
                                        $('.rep_comment_upload').off('click');
                                    } else {
                                        $.ajax({
                                            url: "${pageContext.request.contextPath}/insertReplyComment.do",
                                            method: "POST",
                                            data: {
                                                m_id: memId,
                                                t_comment: r_comment,
                                                t_id: b_id
                                            },
                                            success: function(data) {
                                                console.log("memId : " +
                                                    memId +
                                                    " comment : " +
                                                    r_comment +
                                                    " postid : " +
                                                    b_id);
                                                $(".write_space").val('');
                                                $(".replyCo").css("display", "none");
                                                $('.rep_comment_upload').off('click');
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
                            });

                            // 답글 보기 - 일반 게시판
                            $(".moreCo_see").on('click', function() {
                                var t_id = $(this).next().next().next().val();
                                var mother_id = $(this).next().next().next().next().val();
                                var b_type = $(this).parent().prev().val();
                                console.log(t_id);
                                console.log(mother_id);
                                console.log(b_type);
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/hiddenShowAllCo.do",
                                    method: "POST",
                                    data: {
                                        t_id: t_id
                                    },
                                    dataType: "json",
                                    success: function(hComment) {
                                        var count = hComment;

                                        for (var i = 0; i < count.hComment.length; i++) {
                                            var id = count.hComment[i].m_id;
                                            var b_content = count.hComment[i].b_content;
                                            var b_id = count.hComment[i].b_id;
                                            var countr = count.hComment[i].count;
                                            var b_date = count.hComment[i].b_date;

                                            $(".cm4" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                                mother_id + '</div><div class="commentRId post_id" style="margin-left:5px;" onclick="goboard(\'' + id + '\');" style="cursor:pointer;">' +
                                                id + '</div><div class="commentResult post_content reply_commentResult">' +
                                                b_content + '</div><a class="commentViewAll"></a><i class="fas fa-bars" onclick="report(\'' + b_id + '\',\'' + id + '\',\'' + type + '\');"></i><div class="comment_lcon clcon likechk' + b_id + '"></div>' +
                                                '<div class="comment_unlcon clcon unlikechk' + b_id + '"></div>' +
                                                '<input type="hidden" value="' + b_id + '"></div></div>');
                                            $(".cm4" + t_id).append("<input type='hidden' class='" + b_id + "lBtn hidden_likechk' onclick='likechk(\"" + b_id + "\");' value='" + b_id + "'>" +
                                                "<input type='hidden' class='" + b_id + "forRbtn' value='" + b_type + "'>");

                                            // 답글 변환 권한 - 권한 있음
                                            if (id == mem_id) {
                                                $(".cm4" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                                    mother_id + '</div><div class="commentRId post_id" style="color:transparent;">' +
                                                    id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                                    '<div class="moreCo">좋아요 <input type="text" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                                    '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                                    '<div class="moreCoMo' + b_id + ' moreCo moreCoMo" style="margin-left:10px;">댓글 수정</div>' +
                                                    '<div class="moreCoDe' + b_id + ' moreCo moreCoDe">댓글 삭제</div>' +
                                                    '<input type="hidden" value="' + b_id + '">' +
                                                    '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                                    '<div class="com_detail replyMo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                                    mother_id + '</div><div class="commentRId post_id" style="color:transparent;">' +
                                                    id + '</div><input type="text" class="replyCoMo write_space" value="' + b_content + '" style="margin-left:10px;"><button class="rep_comment_modify">수정</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>'
                                                );

                                                // 답글 변환 권한 - 권한 없음
                                            } else {
                                                $(".cm4" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                                    mother_id + '</div><div class="commentRId post_id" style="color:transparent;">' +
                                                    id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                                    '<div class="moreCo">좋아요 <input type="text" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                                    '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                                    '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>'
                                                );
                                            }
                                        }

                                        // 답글 좋아요 체크 trigger 호출
                                        $(".hidden_likechk").trigger('click');

                                        // 댓글 좋아요 수 카운트 trigger 호출
                                        $(".countLike_trigger").trigger('click');

                                        // 답글 좋아요 - 일반 게시판
                                        $(".comment_lcon").on('click', function() {
                                            var b_id = $(this).next().next().val();
                                            console.log(memId);
                                            console.log(b_id);
                                            $.ajax({
                                                url: "${pageContext.request.contextPath}/pressLike.do",
                                                method: "POST",
                                                data: {
                                                    m_id: memId,
                                                    t_id: b_id
                                                },
                                                async: false,
                                                success: function(data) {
                                                    console.log("memId : " +
                                                        memId +
                                                        " b_id : " +
                                                        b_id);
                                                    $(".likechk" + b_id).css("display", "none");
                                                    $(".unlikechk" + b_id).css("display", "block");

                                                    // 게시물 좋아요 수 카운트 trigger 호출
                                                    $(".countLike_trigger").trigger('click');
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
                                        });

                                        // 답글 좋아요 취소 - 일반 게시판
                                        $(".comment_unlcon").on('click', function() {
                                            var b_id = $(this).next().val();
                                            console.log(memId);
                                            console.log(b_id);
                                            $.ajax({
                                                url: "${pageContext.request.contextPath}/pressUnLike.do",
                                                method: "POST",
                                                data: {
                                                    m_id: memId,
                                                    t_id: b_id
                                                },
                                                success: function(data) {
                                                    console.log("memId : " +
                                                        memId +
                                                        " b_id : " +
                                                        b_id);
                                                    $(".likechk" + b_id).css("display", "block");
                                                    $(".unlikechk" + b_id).css("display", "none");

                                                    // 게시물 좋아요 수 카운트 trigger 호출
                                                    $(".countLike_trigger").trigger('click');
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

                                        });

                                        // 답글 삭제 - 일반 게시판
                                        $(".moreCoDe").on('click', function() {
                                            var b_id = $(this).next().val();
                                            console.log(memId);
                                            console.log(b_id);
                                            $(this).parent().prev().remove();
                                            $(this).parent().prev().remove();
                                            $(this).parent().prev().remove();
                                            $(this).parent().remove();
                                            $.ajax({
                                                url: "${pageContext.request.contextPath}/deleteComment.do",
                                                method: "POST",
                                                data: {
                                                    b_id: b_id
                                                },
                                                async: false,
                                                success: function(data) {
                                                    console.log("memId : " +
                                                        memId +
                                                        " b_id : " +
                                                        b_id);
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
                                        });

                                        // 답글 수정 - 일반 게시판
                                        $(".moreCoMo").on('click', function() {
                                            $(this).parent().next().css("display", "block");
                                            $(".rep_comment_modify").on('click', function() {
                                                var comment = $(this).prev().val();
                                                var b_id = $(this).next().val();
                                                console.log(comment);
                                                console.log(b_id);
                                                $(this).parent().prev().prev().prev().prev().find('.commentResult').text(comment);
                                                $.ajax({
                                                    url: "${pageContext.request.contextPath}/updateComment.do",
                                                    method: "POST",
                                                    data: {
                                                        t_comment: comment,
                                                        t_id: b_id
                                                    },
                                                    success: function(data) {
                                                        console.log(" comment : " +
                                                            comment +
                                                            " b_id : " +
                                                            b_id);
                                                        $(".replyMo").css("display", "none");
                                                        $('.rep_comment_modify').off('click');
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
                                            });
                                        });
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

                            });

                            // 댓글 좋아요 - 일반 게시판
                            $(".comment_lcon").on('click', function() {
                                var b_id = $(this).next().next().val();
                                console.log(memId);
                                console.log(b_id);
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/pressLike.do",
                                    method: "POST",
                                    data: {
                                        m_id: memId,
                                        t_id: b_id
                                    },
                                    async: false,
                                    success: function(data) {
                                        console.log("memId : " +
                                            memId +
                                            " b_id : " +
                                            b_id);
                                        $(".likechk" + b_id).css("display", "none");
                                        $(".unlikechk" + b_id).css("display", "block");

                                        // 게시물 좋아요 수 카운트 trigger 호출
                                        $(".countLike_trigger").trigger('click');
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
                            });

                            // 댓글 좋아요 취소 - 일반 게시판
                            $(".comment_unlcon").on('click', function() {
                                var b_id = $(this).next().val();
                                console.log(memId);
                                console.log(b_id);
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/pressUnLike.do",
                                    method: "POST",
                                    data: {
                                        m_id: memId,
                                        t_id: b_id
                                    },
                                    success: function(data) {
                                        console.log("memId : " +
                                            memId +
                                            " b_id : " +
                                            b_id);
                                        $(".likechk" + b_id).css("display", "block");
                                        $(".unlikechk" + b_id).css("display", "none");

                                        // 게시물 좋아요 수 카운트 trigger 호출
                                        $(".countLike_trigger").trigger('click');
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

                            });
                        }
                    });

                    // 전체 댓글보기 - 비즈니스 게시판
                } else if (type = "B") {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/hiddenShowAllCo.do",
                        method: "POST",
                        data: {
                            t_id: t_id
                        },
                        dataType: "json",
                        success: function(hComment) {
                            var count = hComment;
                            for (var i = 0; i < count.hComment.length; i++) {
                                var id = count.hComment[i].m_id;
                                var b_content = count.hComment[i].b_content;
                                var b_id = count.hComment[i].b_id;
                                var b_type = count.hComment[i].b_type;
                                var countr = count.hComment[i].count;
                                var b_date = count.hComment[i].b_date;

                                // 댓글 중복 나타냄 방지 remove - cm1, cm2
                                $(".cm1" + t_id).remove();
                                $(".cm2" + t_id).remove();

                                // 전체 댓글 append - cm3  // 댓글 좋아요 체크 trigger 사용
                                $(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" onclick="goboard(\'' + id + '\');" style="cursor:pointer;">' +
                                    id + '</div><div class="commentResult post_content">' +
                                    b_content + '</div><a class="commentViewAll"></a><i class="fas fa-bars" onclick="report(\'' + b_id + '\',\'' + id + '\',\'' + type + '\');"></i><div class="comment_lcon clcon likechk' + b_id + '"></div>' +
                                    '<div class="comment_unlcon clcon unlikechk' + b_id + '"></div>' +
                                    '<input type="hidden" value="' + b_id + '"></div></div>');
                                $(".cm3" + t_id).append("<input type='hidden' class='" + b_id + "lBtn hidden_likechk' onclick='likechk(\"" + b_id + "\");' value='" + b_id + "'>" +
                                    "<input type='hidden' class='" + b_id + "forRbtn' value='" + b_type + "'>");

                                // 답글 유무 분리 - 답글 유
                                if (countr != 0) {

                                    // 댓글 변환 권한 - 권한 있음
                                    if (id == mem_id) {
                                        $(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                            '<div class="moreCo">좋아요 <input type="text" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                            '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                            '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>' +
                                            '<div class="moreCo' + b_id + ' moreCo moreCo_see">답글 보기(' + countr + ')개</div>' +
                                            '<div class="moreCoMo' + b_id + ' moreCo moreCoMo">댓글 수정</div>' +
                                            '<div class="moreCoDe' + b_id + ' moreCo moreCoDe">댓글 삭제</div>' +
                                            '<input type="hidden" value="' + b_id + '">' +
                                            '<input type="hidden" value="' + id + '">' +
                                            '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                            '<div class="com_detail replyCo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>' +
                                            '<div class="com_detail replyMo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoMo write_space" value="' + b_content + '"><button class="rep_comment_modify">수정</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>' +
                                            '<ul class="cm4' + b_id + '"></ul>'
                                        );

                                        // 댓글 변환 권한 - 권한 없음
                                    } else {
                                        $(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                            '<div class="moreCo">좋아요 <input type="text" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                            '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                            '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>' +
                                            '<div class="moreCo' + b_id + ' moreCo moreCo_see">답글 보기(' + countr + ')개</div>' +
                                            '<div class="moreCoMo' + b_id + ' moreCo moreCoMo" style="display:none;">댓글 수정</div>' +
                                            '<div class="moreCoDe' + b_id + ' moreCo moreCoDe" style="display:none;">댓글 삭제</div>' +
                                            '<input type="hidden" value="' + b_id + '">' +
                                            '<input type="hidden" value="' + id + '">' +
                                            '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                            '<div class="com_detail replyCo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>' +
                                            '<ul class="cm4' + b_id + '"></ul>'
                                        );
                                    }

                                    // 답글 유무 분리 - 답글 무
                                } else {

                                    // 댓글 변환 권한 - 권한 있음
                                    if (id == mem_id) {
                                        $(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                            '<div class="moreCo">좋아요 <input type="text" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                            '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                            '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div>' +
                                            '<div class="moreCoMo' + b_id + ' moreCo moreCoMo">댓글 수정</div>' +
                                            '<div class="moreCoDe' + b_id + ' moreCo moreCoDe">댓글 삭제</div>' +
                                            '<input type="hidden" value="' + b_id + '">' +
                                            '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                            '<div class="com_detail replyCo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>' +
                                            '<div class="com_detail replyMo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoMo write_space" value="' + b_content + '"><button class="rep_comment_modify">수정</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>');

                                        // 댓글 변환 권한 - 권한 없음
                                    } else {
                                        $(".cm3" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                            '<div class="moreCo">좋아요 <input type="text" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                            '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                            '<div class="moreCoW' + b_id + ' moreCoW">답글 달기</div><div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                            '<div class="com_detail replyCo"  style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                            id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>'
                                        );
                                    }

                                }
                            }

                            // 댓글 좋아요 체크 trigger 호출
                            $(".hidden_likechk").trigger('click');

                            // 댓글 좋아요 수 카운트 trigger 호출
                            $(".countLike_trigger").trigger('click');

                            // 댓글 삭제 - 비즈니스 게시판
                            $(".moreCoDe").on('click', function() {
                                var b_id = $(this).next().val();
                                console.log(memId);
                                console.log(b_id);
                                $(this).parent().next().next("ul").remove();
                                $(this).parent().prev().remove();
                                $(this).parent().prev().remove();
                                $(this).parent().prev().remove();
                                $(this).parent().remove();
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/deleteCommentB.do",
                                    method: "POST",
                                    data: {
                                        b_id: b_id
                                    },
                                    async: false,
                                    success: function(data) {
                                        console.log("memId : " +
                                            memId +
                                            " b_id : " +
                                            b_id);
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
                            });

                            // 댓글 수정 - 비즈니스 게시판
                            $(".moreCoMo").on('click', function() {
                                $(this).parent().next().next().css("display", "block");
                                $(".rep_comment_modify").on('click', function() {
                                    var comment = $(this).prev().val();
                                    var b_id = $(this).next().val();
                                    console.log(comment);
                                    console.log(b_id);
                                    $(this).parent().prev().prev().prev().prev().prev().find('.commentResult').text(comment);
                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/updateCommentB.do",
                                        method: "POST",
                                        data: {
                                            t_comment: comment,
                                            t_id: b_id
                                        },
                                        success: function(data) {
                                            console.log(" comment : " +
                                                comment +
                                                " b_id : " +
                                                b_id);
                                            $(".replyMo").css("display", "none");
                                            $('.rep_comment_modify').off('click');

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

                                });
                            });

                            // 답글 달기 - 비즈니스 게시판
                            $(".moreCoW").on('click', function() {
                                $(this).parent().next().css("display", "block");
                                $(".rep_comment_upload").on('click', function() {
                                    var b_id = $(this).next().val();
                                    var r_comment = $(this).prev().val();
                                    var r_type = $(this).next().next().val();
                                    console.log(memId);
                                    console.log(b_id);
                                    console.log(r_comment);
                                    console.log(r_type);
                                    if (r_comment == "" || r_comment == null) {
                                        console.log("reply comment won't be uploaded");
                                        $(".replyCo").css("display", "none");
                                        $('.rep_comment_upload').off('click');
                                    } else {
                                        $.ajax({
                                            url: "${pageContext.request.contextPath}/insertReplyCommentB.do",
                                            method: "POST",
                                            data: {
                                                m_id: memId,
                                                t_comment: r_comment,
                                                t_id: b_id
                                            },
                                            success: function(data) {
                                                console.log("memId : " +
                                                    memId +
                                                    " comment : " +
                                                    r_comment +
                                                    " postid : " +
                                                    b_id);
                                                $(".write_space").val('');
                                                $(".replyCo").css("display", "none");
                                                $('.rep_comment_upload').off('click');
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
                            });

                            // 답글 보기 - 비즈니스 게시판
                            $(".moreCo_see").on('click', function() {
                                var t_id = $(this).next().next().next().val();
                                var mother_id = $(this).next().next().next().next().val();
                                var b_type = $(this).parent().prev().val();
                                console.log(t_id);
                                console.log(mother_id);
                                console.log(b_type);
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/hiddenShowAllCo.do",
                                    method: "POST",
                                    data: {
                                        t_id: t_id
                                    },
                                    dataType: "json",
                                    success: function(hComment) {
                                        var count = hComment;

                                        for (var i = 0; i < count.hComment.length; i++) {
                                            var id = count.hComment[i].m_id;
                                            var b_content = count.hComment[i].b_content;
                                            var b_id = count.hComment[i].b_id;
                                            var countr = count.hComment[i].count;
                                            var b_date = count.hComment[i].b_date;

                                            $(".cm4" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                                mother_id + '</div><div class="commentRId post_id" style="margin-left:5px;" onclick="goboard(\'' + id + '\');" style="cursor:pointer;">' +
                                                id + '</div><div class="commentResult post_content reply_commentResult">' +
                                                b_content + '</div><a class="commentViewAll"></a><i class="fas fa-bars" onclick="report(\'' + b_id + '\',\'' + id + '\',\'' + type + '\');"></i><div class="comment_lcon clcon likechk' + b_id + '"></div>' +
                                                '<div class="comment_unlcon clcon unlikechk' + b_id + '"></div>' +
                                                '<input type="hidden" value="' + b_id + '"></div></div>');
                                            $(".cm4" + t_id).append("<input type='hidden' class='" + b_id + "lBtn hidden_likechk' onclick='likechk(\"" + b_id + "\");' value='" + b_id + "'>" +
                                                "<input type='hidden' class='" + b_id + "forRbtn' value='" + b_type + "'>");

                                            // 답글 변환 권한 - 권한 있음
                                            if (id == mem_id) {
                                                $(".cm4" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                                    mother_id + '</div><div class="commentRId post_id" style="color:transparent;">' +
                                                    id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                                    '<div class="moreCo">좋아요 <input type="text" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                                    '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                                    '<div class="moreCoMo' + b_id + ' moreCo moreCoMo" style="margin-left:10px;">댓글 수정</div>' +
                                                    '<div class="moreCoDe' + b_id + ' moreCo moreCoDe">댓글 삭제</div>' +
                                                    '<input type="hidden" value="' + b_id + '">' +
                                                    '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>' +
                                                    '<div class="com_detail replyMo" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                                    mother_id + '</div><div class="commentRId post_id" style="color:transparent;">' +
                                                    id + '</div><input type="text" class="replyCoMo write_space" value="' + b_content + '" style="margin-left:10px;"><button class="rep_comment_modify">수정</button><input type="hidden" value="' + b_id + '"><input type="hidden" class="' + b_id + 'forRbtn" value="' + b_type + '"></div>'
                                                );

                                                // 답글 변환 권한 - 권한 없음
                                            } else {
                                                $(".cm4" + t_id).append('<div class="com_detail"><div class="commentRId post_id" style="color:transparent;">' +
                                                    mother_id + '</div><div class="commentRId post_id" style="color:transparent;">' +
                                                    id + '</div><input type="button" value="${vo.t_id}" class="countLike_trigger"onclick="countLike(\'' + b_id + '\');">' +
                                                    '<div class="moreCo">좋아요 <input type="text" class="lCount' + b_id + ' showlCount" value="" readonly>개</div>' +
                                                    '<input type="hidden" class="t_type' + b_id + '" value="' + b_type + '">' +
                                                    '<div class="moreCoD' + b_id + ' moreCoD">' + b_date + '</div></div>'
                                                );
                                            }
                                        }

                                        // 답글 좋아요 체크 trigger 호출
                                        $(".hidden_likechk").trigger('click');

                                        // 댓글 좋아요 수 카운트 trigger 호출
                                        $(".countLike_trigger").trigger('click');

                                        // 답글 좋아요 - 비즈니스 게시판
                                        $(".comment_lcon").on('click', function() {
                                            var b_id = $(this).next().next().val();
                                            console.log(memId);
                                            console.log(b_id);
                                            $.ajax({
                                                url: "${pageContext.request.contextPath}/pressLikeB.do",
                                                method: "POST",
                                                data: {
                                                    m_id: memId,
                                                    t_id: b_id
                                                },
                                                async: false,
                                                success: function(data) {
                                                    console.log("memId : " +
                                                        memId +
                                                        " b_id : " +
                                                        b_id);
                                                    $(".likechk" + b_id).css("display", "none");
                                                    $(".unlikechk" + b_id).css("display", "block");

                                                    // 게시물 좋아요 수 카운트 trigger 호출
                                                    $(".countLike_trigger").trigger('click');
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
                                        });

                                        // 답글 좋아요 취소 - 비즈니스 게시판
                                        $(".comment_unlcon").on('click', function() {
                                            var b_id = $(this).next().val();
                                            console.log(memId);
                                            console.log(b_id);
                                            $.ajax({
                                                url: "${pageContext.request.contextPath}/pressUnLikeB.do",
                                                method: "POST",
                                                data: {
                                                    m_id: memId,
                                                    t_id: b_id
                                                },
                                                success: function(data) {
                                                    console.log("memId : " +
                                                        memId +
                                                        " b_id : " +
                                                        b_id);
                                                    $(".likechk" + b_id).css("display", "block");
                                                    $(".unlikechk" + b_id).css("display", "none");

                                                    // 게시물 좋아요 수 카운트 trigger 호출
                                                    $(".countLike_trigger").trigger('click');
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

                                        });

                                        // 답글 삭제 - 비즈니스 게시판
                                        $(".moreCoDe").on('click', function() {
                                            var b_id = $(this).next().val();
                                            console.log(memId);
                                            console.log(b_id);
                                            $(this).parent().prev().remove();
                                            $(this).parent().prev().remove();
                                            $(this).parent().prev().remove();
                                            $(this).parent().remove();
                                            $.ajax({
                                                url: "${pageContext.request.contextPath}/deleteCommentB.do",
                                                method: "POST",
                                                data: {
                                                    b_id: b_id
                                                },
                                                async: false,
                                                success: function(data) {
                                                    console.log("memId : " +
                                                        memId +
                                                        " b_id : " +
                                                        b_id);
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
                                        });

                                        // 답글 수정 - 비즈니스 게시판
                                        $(".moreCoMo").on('click', function() {
                                            $(this).parent().next().css("display", "block");
                                            $(".rep_comment_modify").on('click', function() {
                                                var comment = $(this).prev().val();
                                                var b_id = $(this).next().val();
                                                console.log(comment);
                                                console.log(b_id);
                                                $(this).parent().prev().prev().prev().prev().find('.commentResult').text(comment);
                                                $.ajax({
                                                    url: "${pageContext.request.contextPath}/updateCommentB.do",
                                                    method: "POST",
                                                    data: {
                                                        t_comment: comment,
                                                        t_id: b_id
                                                    },
                                                    success: function(data) {
                                                        console.log(" comment : " +
                                                            comment +
                                                            " b_id : " +
                                                            b_id);
                                                        $(".replyMo").css("display", "none");
                                                        $('.rep_comment_modify').off('click');
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
                                            });
                                        });
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

                            });

                            // 댓글 좋아요 - 비즈니스 게시판
                            $(".comment_lcon").on('click', function() {
                                var b_id = $(this).next().next().val();
                                console.log(memId);
                                console.log(b_id);
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/pressLikeB.do",
                                    method: "POST",
                                    data: {
                                        m_id: memId,
                                        t_id: b_id
                                    },
                                    async: false,
                                    success: function(data) {
                                        console.log("memId : " +
                                            memId +
                                            " t_id : " +
                                            t_id);
                                        $(".likechk" + b_id).css("display", "none");
                                        $(".unlikechk" + b_id).css("display", "block");

                                        // 게시물 좋아요 수 카운트 trigger 호출
                                        $(".countLike_trigger").trigger('click');
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
                            });

                            // 댓글 좋아요 취소 - 비즈니스 게시판
                            $(".comment_unlcon").on('click', function() {
                                var b_id = $(this).next().val();
                                console.log(memId);
                                console.log(b_id);
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/pressUnLikeB.do",
                                    method: "POST",
                                    data: {
                                        m_id: memId,
                                        t_id: b_id
                                    },
                                    success: function(data) {
                                        console.log("memId : " +
                                            memId +
                                            " b_id : " +
                                            b_id);
                                        $(".likechk" + b_id).css("display", "block");
                                        $(".unlikechk" + b_id).css("display", "none");

                                        // 게시물 좋아요 수 카운트 trigger 호출
                                        $(".countLike_trigger").trigger('click');
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
                            });

                        }
                    });

                }

            }

            // 페이지 로딩 시 처음 두개 댓글 나타내기 trigger - .hidden_commentchk
            // 댓글 좋아요 표시 외 수정 불가
            function showAllCoHidden(t_id) {
                var type = $(".t_type" + t_id).val();

                // 두개 댓글 나타내기
                $.ajax({
                    url: "${pageContext.request.contextPath}/hiddenShowAllCo.do",
                    method: "POST",
                    data: {
                        t_id: t_id
                    },
                    dataType: "json",
                    success: function(hComment) {
                        var count = hComment;
                        for (var i = 0; i < 2; i++) {
                            var id = count.hComment[i].m_id;
                            var b_content = count.hComment[i].b_content;
                            var b_id = count.hComment[i].b_id;
                            var b_type = count.hComment[i].b_type;
                            var countr = count.hComment[i].count;
                            var b_date = count.hComment[i].b_date;

                            // 댓글 append - cm2 // 댓글 좋아요 체크 trigger 사용
                            $(".cm2" + t_id).append('<div class="com_detail"><div class="commentRId post_id" onclick="goboard(\'' + id + '\');" style="cursor:pointer;">' +
                                id + '</div><div class="commentResult post_content">' +
                                b_content + '</div><a class="commentViewAll"></a><div class="comment_lcon clcon likechk' + b_id + '"></div>' +
                                '<div class="comment_unlcon clcon unlikechk' + b_id + '"></div>' +
                                '<input type="hidden" value="' + b_id + '"></div></div>');
                            $(".cm2" + t_id).append("<input type='hidden' class='" + b_id + "lBtn hidden_likechk' onclick='likechk(\"" + b_id + "\");' value='" + b_id + "'>" +
                                "<input type='hidden' class='" + b_id + "forRbtn' value='" + b_type + "'>");
                        }

                        // 댓글 좋아요 체크 trigger 호출
                        $(".hidden_likechk").trigger('click');
                    }
                });

                // (일반 & 비즈니스 게시판 분리)
                if (type == "G") {
                    // 댓글 좋아요 - 일반 게시판
                    $(".comment_lcon").on('click', function() {
                        var b_id = $(this).next().next().val();
                        console.log(memId);
                        console.log(b_id);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/pressLike.do",
                            method: "POST",
                            data: {
                                m_id: memId,
                                t_id: b_id
                            },
                            success: function(data) {
                                console.log("memId : " +
                                    memId +
                                    " b_id : " +
                                    b_id);
                                $(".likechk" + b_id).css("display", "none");
                                $(".unlikechk" + b_id).css("display", "block");
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
                    });

                    // 댓글 좋아요 취소 - 일반 게시판
                    $(".comment_unlcon").on('click', function() {
                        var b_id = $(this).next().val();
                        console.log(memId);
                        console.log(b_id);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/pressUnLike.do",
                            method: "POST",
                            data: {
                                m_id: memId,
                                t_id: b_id
                            },
                            success: function(data) {
                                console.log("memId : " +
                                    memId +
                                    " b_id : " +
                                    b_id);
                                $(".likechk" + b_id).css("display", "block");
                                $(".unlikechk" + b_id).css("display", "none");
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

                    });

                    // 두개 댓글 나타내기 - 비즈니스 게시판
                } else if (type = "B") {

                    // 댓글 좋아요 - 비즈니스 게시판
                    $(".comment_lcon").on('click', function() {
                        var b_id = $(this).next().next().val();
                        console.log(memId);
                        console.log(b_id);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/pressLikeB.do",
                            method: "POST",
                            data: {
                                m_id: memId,
                                t_id: b_id
                            },
                            success: function(data) {
                                console.log("memId : " +
                                    memId +
                                    " b_id : " +
                                    b_id);
                                $(".likechk" + b_id).css("display", "none");
                                $(".unlikechk" + b_id).css("display", "block");
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
                    });

                    // 댓글 좋아요 취소 - 비즈니스 게시판
                    $(".comment_unlcon").on('click', function() {
                        var b_id = $(this).next().val();
                        console.log(memId);
                        console.log(b_id);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/pressUnLikeB.do",
                            method: "POST",
                            data: {
                                m_id: memId,
                                t_id: b_id
                            },
                            success: function(data) {
                                console.log("memId : " +
                                    memId +
                                    " b_id : " +
                                    b_id);
                                $(".likechk" + b_id).css("display", "block");
                                $(".unlikechk" + b_id).css("display", "none");
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
                    });
                }
            }
        </script>

        </html>