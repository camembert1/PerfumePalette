<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆 - 𝑴𝑩𝑻𝑰</title>

        <link rel="stylesheet" href="../../../resources/commonCss/mbti.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <!-- favicon : 탭에 보이는 아이콘 -->
        <link rel="icon" href="../../../resources/img/common/favicon.png" />
        <link rel="apple-touch-icon" href="../../../resources/img/common/favicon.png" />

    </head>

    <body>
        <jsp:include page="../common/header.jsp" />
        <main>

            <!-- 헤더 부분 피하기 위한 div -->
            <div id="forHeader"></div>

            <!-- 본문 내용 가운데 정렬 위한 div -->
            <div id="forCenter">
                <!-- 여기부터 내용 입력하시면 됩니다! -->

                <div id="subject">Perfume Palette MBTI Test</div>
                <div style="width: 900px; height: 1px; border-bottom: 1px dashed #222; margin-top: 10px; margin-bottom: 10px;"></div>
                <div id="back-btn-area">
                    <div id="back-btn" onclick="showBeforeQuestion()">이전 질문</div>
                </div>


                <form id="mbtiTest">
                    <div class="question">
                        <p><span>1. </span>내 마음에 쏙 든 향수를 발견했다! 계산하려는데 직원이 바쁜것 같다면?</p>
                        <div>
                            <label>
                                <img src="../../../resources/bFileUploads/1-E.jpg" alt="">
                                <div>저기요! 계산 먼저해주세요!</div>
                                <input type="radio" name="q1" value="E">
                            </label>
                            <label>
                                <img src="../../../resources/bFileUploads/1-I.jpg" alt="">
                                <div>직원이 카운터로 올때까지<br>딴청피우며 눈치본다.</div>
                                <input type="radio" name="q1" value="I">
                            </label>
                        </div>
                    </div>

                    <div class="question">
                        <p><span>2. </span>가게 직원이 따라다니면서 이것저것 추천해준다면?</p>
                        <div>
                            <label>
                                <img src="../../../resources/bFileUploads/2-E.jpg" alt="">
                                <div>이건 기회야!<br>궁금했던 향수정보를 물어본다.</div>
                                <input type="radio" name="q2" value="E">
                            </label>
                            <label>
                                <img src="../../../resources/bFileUploads/2-I.jpg" alt="">
                                <div>(제발 말걸지 말아주세요..)<br>아..감사합니다..</div>
                                <input type="radio" name="q2" value="I">
                            </label>
                        </div>
                    </div>

                    <div class="question">
                        <p><span>3. </span>이제 향수가게를 나와 밥을 먹으려한다. 어디로 갈까?</p>
                        <div>
                            <label>
                                <img src="../../../resources/bFileUploads/3-E.jpg" alt="">
                                <div>평소 가고 싶었던<br>요즘 유행하는 핫플!</div>
                                <input type="radio" name="q3" value="E">
                            </label>
                            <label>
                                <img src="../../../resources/bFileUploads/3-I.jpg" alt="">
                                <div>사람이 별로 없는<br>여유롭고 조용한 식사.</div>
                                <input type="radio" name="q3" value="I">
                            </label>
                        </div>
                    </div>

                    <div class="question">
                        <p><span>4. </span>식당에 들어온 순간 가장 먼저 보이는 것은?</p>
                        <div>
                            <label>
                                <img src="../../../resources/bFileUploads/4-S.jpg" alt="">
                                <div>맛있는 음식들.</div>
                                <input type="radio" name="q4" value="S">
                            </label>
                            <label>
                                <img src="../../../resources/bFileUploads/4-N.jpg" alt="">
                                <div>아기자기 예쁘게 꾸며둔 인테리어.</div>
                                <input type="radio" name="q4" value="N">
                            </label>
                        </div>
                    </div>

                    <div class="question">
                        <p><span>5. </span>딱 하나의 향수면 시향 할 수 있다면?</p>
                        <div>
                            <label>
                                <img src="../../../resources/bFileUploads/5-S.jpg" alt="">
                                <div>평소 좋아하던 향기.</div>
                                <input type="radio" name="q5" value="S">
                            </label>
                            <label>
                                <img src="../../../resources/bFileUploads/5-N.jpg" alt="">
                                <div>한번도 시도 안 해본 향기.</div>
                                <input type="radio" name="q5" value="N">
                            </label>
                        </div>
                    </div>

                    <div class="question">
                        <p><span>6. </span>집에 도착해 향수를 뜯어보았는데 패키지가 너무 예쁘다..어쩌지?</p>
                        <div>
                            <label>
                                <img src="../../../resources/bFileUploads/6-S.jpg" alt="">
                                <div>어차피 쓰레긴데 그냥 버린다.</div>
                                <input type="radio" name="q6" value="S">
                            </label>
                            <label>
                                <img src="../../../resources/bFileUploads/6-N.jpg" alt="">
                                <div>향수병 옆에 두면 너무 예쁘겠다!</div>
                                <input type="radio" name="q6" value="N">
                            </label>
                        </div>
                    </div>

                    <div class="question">
                        <p><span>7. </span>직원의 추천을 받은 향수! 냄새가 정말 너무 별로라면?</p>
                        <div>
                            <label>
                                <img src="../../../resources/bFileUploads/7-T.jpg" alt="">
                                <div>감사한데..<br>제 취향은 아닌 것 같아요..</div>
                                <input type="radio" name="q7" value="T">
                            </label>
                            <label>
                                <img src="../../../resources/bFileUploads/7-F.jpg" alt="">
                                <div>와.. 좋은 것 같아요!<br>혹시 다른 향도 추천해주시겠어요?</div>
                                <input type="radio" name="q7" value="F">
                            </label>
                        </div>
                    </div>

                    <div class="question">
                        <p><span>8. </span>직원이 실수로 진열장의 향수병을 전부 깨버렸다! 당신의 속마음은?</p>
                        <div>
                            <label>
                                <img src="../../../resources/bFileUploads/8-T.jpg" alt="">
                                <div>'와 저게 다 얼마야..'</div>
                                <input type="radio" name="q8" value="T">
                            </label>
                            <label>
                                <img src="../../../resources/bFileUploads/8-F.jpg" alt="">
                                <div>'헉..어떻게..안다치셨나?..속상하시겠다..'</div>
                                <input type="radio" name="q8" value="F">
                            </label>
                        </div>
                    </div>

                    <div class="question">
                        <p><span>9. </span>친구의 생일에 카톡으로 선물을 보냈는데 답이 없다면?</p>
                        <div>
                            <label>
                                <img src="../../../resources/bFileUploads/9-F.jpg" alt="">
                                <div>혹시 잘못보냈나? 생일이 아닌가?</div>
                                <input type="radio" name="q9" value="F">
                            </label>
                            <label>
                                <img src="../../../resources/bFileUploads/9-T.jpg" alt="">
                                <div>바쁜가보네</div>
                                <input type="radio" name="q9" value="T">
                            </label>
                        </div>
                    </div>

                    <div class="question">
                        <p><span>10. </span>내일은 향수를 사러가는 날! 설레는 마음으로 침대에 누웠을때 드는 생각은?</p>
                        <div>
                            <label>
                                <img src="../../../resources/bFileUploads/10-P.jpg" alt="">
                                <div>어떤 향수가 있을까?<br>혹시 다 마음에 들면 어쩌지..</div>
                                <input type="radio" name="q10" value="P">
                            </label>
                            <label>
                                <img src="../../../resources/bFileUploads/10-J.jpg" alt="">
                                <div>오픈시간, 교통편 모두 확인했고.. <br>가기전에 한 번 더 확인해야겠다</div>
                                <input type="radio" name="q10" value="J">
                            </label>
                        </div>
                    </div>

                    <div class="question">
                        <p><span>11. </span>다음날 아침, 향수가게에 도착한 당신! 근데 문이 닫혀있다.</p>
                        <div>
                            <label>
                                <img src="../../../resources/bFileUploads/11-P.jpg" alt="">
                                <div>다른곳 구경하고 오면 열려있겠지~</div>
                                <input type="radio" name="q11" value="P">
                            </label>
                            <label>
                                <img src="../../../resources/bFileUploads/11-J.jpg" alt="">
                                <div>이럴리가 없는데..<br>가게 오픈시간을 확인해본다.</div>
                                <input type="radio" name="q11" value="J">
                            </label>
                        </div>
                    </div>

                    <div class="question">
                        <p><span>12. </span>이 향수 너무 맘에 든다! 곧 친구 생일인데.. 선물로 줘야겠다 언제사지?</p>
                        <div>
                            <label>
                                <img src="../../../resources/bFileUploads/12-P.jpg" alt="">
                                <div>당일에 사면 되겠지?<br>무슨 향을 좋아하려나?</div>
                                <input type="radio" name="q12" value="P">
                            </label>
                            <label>
                                <img src="../../../resources/bFileUploads/12-J.jpg" alt="">
                                <div>일주일전에 미리 미리 준비해준다.</div>
                                <input type="radio" name="q12" value="J">
                            </label>
                        </div>
                    </div>
                    <button type="button" id="next-btn" onclick="showNextQuestion()">다음질문</button>
                    
                </form>
            </div>
        </main>
        <jsp:include page="../common/footer.jsp" />

        



        <script>
            let currentQuestion = 0;
            const questions = $(".question");

            // 페이지 로딩 후 첫 번째 질문을 표시 및 이전 질문 버튼 숨김
            document.addEventListener("DOMContentLoaded", function () {
                questions[currentQuestion].classList.add("current");
                $("#back-btn").css("display", "none");
            });

            // 이미지 선택 시 다음질문 버튼 자동으로 클릭하기
            const nextBtn = $("#next-btn");
            const radios = $("input[type='radio']");
            Array.from(radios).forEach(radio => {
                radio.addEventListener('click', () => {
                    nextBtn.click();
                });
            });

            // 다음질문 버튼 클릭 시 작동되는 함수
            function showNextQuestion() {
                //  0번부터 11번까지 12개 질문 중에 현재 질문이 11번 미만이라면 = 마지막 질문이 아니라면
                if (currentQuestion < questions.length - 1) {
                    questions[currentQuestion].classList.remove("current");
                    currentQuestion++;
                    questions[currentQuestion].classList.add("current");
                    // 이전 질문 버튼을 노출시킴!
                    $("#back-btn").css("display", "flex");
                } else {
                    // 마지막질문이라면 submit
                    submitTest();
                }
            }

            // 이전질문 버튼 클릭 시 작동되는 함수
            function showBeforeQuestion() {
                // 이전질문 버튼 선택 시 이전 질문으로 돌아가기
                if (currentQuestion != 0) {
                    questions[currentQuestion].classList.remove("current");
                    currentQuestion--;
                    questions[currentQuestion].classList.add("current");

                    if (currentQuestion == 0) {
                        // 첫번째 질문이라면 버튼을 숨김
                        $("#back-btn").css("display", "none")
                    }
                }
            }

            // 마지막 질문에서 다음질문으로 넘어갈 경우 작동되는 submit함수
            function submitTest() {

                // 인풋태그들을 찾아 배열로 저장
                const form = $("#mbtiTest");
                const inputs = form.find("input");

                let result = {
                    E: 0,
                    I: 0,
                    N: 0,
                    S: 0,
                    T: 0,
                    F: 0,
                    P: 0,
                    J: 0
                };

                // 인풋태그 배열 for문 돌리면서 체크가 됐따면 해당 인풋태그의 value 즉 i냐 e냐를 결과 배열에 ++함
                for (let i = 0; i < inputs.length; i++) {
                    if (inputs[i].checked) {
                        result[inputs[i].value]++;
                    }
                }

                // 결과 mbti String 생성
                let mbtiResult = "";
                mbtiResult += result.E > result.I ? "E" : "I";
                mbtiResult += result.N > result.S ? "N" : "S";
                mbtiResult += result.T > result.F ? "T" : "F";
                mbtiResult += result.P > result.J ? "P" : "J";


                // 결과를 세션에 저장하는 작업 수행 후 성공 시 결과 페이지로 이동
                function mbtiResultView(mbtiResult) {
                    $.ajax({
                        url: "/mbti/mbtiResult",
                        data: {
                            "mbtiResult": mbtiResult
                        },
                        type: "POST",
                        success: function () {
                            location.href = "/mbti/mbtiResult"
                        },
                        error: function () {
                            alert("실패")
                        }
                    });
                }
                mbtiResultView(mbtiResult);

            }



        </script>
    </body>

</html>