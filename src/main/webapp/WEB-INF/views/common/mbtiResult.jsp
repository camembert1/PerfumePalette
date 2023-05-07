<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>𝑷𝒆𝒓𝒇𝒖𝒎𝒆 𝑷𝒂𝒍𝒆𝒕𝒕𝒆 - 𝑴𝑩𝑻𝑰</title>

        <link rel="stylesheet" href="../../../resources/commonCss/mbtiResult.css">
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
                <!-- 로그인상태라면 -->
                <c:if test="${sessionScope.member ne null }">

                    <div>
                        <div>
                            <div id="mbti-result-area">
                                <div><span id="memberNickname">${member.memberNickname }</span> 님의 MBTI는</div>
                                <div><span id="memberMBTI">${mbtiResult }</span></div>
                            </div>
    
                            
                            <div id="perfumeImg-area">
                                <img src="../../../resources/img/perfumeFileUploads/${perfume.pFilerename }" alt="">
                            </div>
                            
                            <div id="perfumeInfo-area">

                                <div>
                                    <div>
                                        <span id="perfumeBrand">${perfume.perfumeBrand }</span>
                                        <span id="perfumeName">${perfume.perfumeName }</span>
                                    </div>
            
                                    <div>
                                        <span>${perfume.perfumeVolume }ml / </span>
                                        <span><fmt:formatNumber value="${perfume.perfumePrice }" pattern="#,##0"/>원</span>
                                    </div>
    
                                    <div style=" width: 100%; height: 1px; border-bottom: 1px dashed white; margin-block: 20px;"></div>
                                    <div id="contents"></div>
                                </div>

                            </div>
                        </div>
    
                        
                        <div id="btn-area">
                            <div onclick="location.href='/perfume/detail/${perfume.perfumeNo }'">사러가기</div>
                            <div onclick="location.href='/mbti/mbti'">다시 검사하기</div>
                        </div>

                    </div>
                </c:if>


                <div id="mbti-contents-area">

                    <div class="mbti" id="ENFP">
                        타고난 친화력과 긍정적인 마인드로 <br>
                        분위기 메이커를 담당하는 ENFP와 어울리는 <br>
                        꿈 많은 달달한 아름다운 소녀의 이미지를 <br>
                        가진 향. 화려한 보틀에서 느껴지는 독보적인 <br>
                        사랑스러움은 물론 메인인 장미향이 은은한 물 <br>
                        향이 가미되어 활짝 폈다가, 꽃봉오리였다가 <br>
                        하는 변덕스러움으로 자꾸만 궁금함을 <br>
                        불러일으키게 되는 향.
                    </div>

                    <div class="mbti" id="INFP">
                        한 걸음 뒤에서 꽃다발을 뒤로 숨기고 있는 <br>
                        소녀처럼 은은하고 조심스럽게 풍기는 <br>
                        미모사의 향으로, 섬세하고 조심스러운 <br>
                        INFP 유형과 꼭 닮은 면모. <br>
                        화려하진 않지만 시원함을 동반한 <br>
                        가볍고 에어리한 보송함으로 <br>
                        살결에 보드랍게 남아 <br>
                        구름같이 포근하지만 덥지 않은 향.
                    </div>

                    <div class="mbti" id="INTP">
                        알고 보면 사려 깊은 반전 매력을 꽁꽁 숨기고, <br>
                        냉정하고 딱딱한 이미지를 내보이는 INTP 유형과 <br>
                        어울리는 톤이 높지도 낮지도 않은 중성적인 <br>
                        느낌이 강한 향. <br>
                        첫 향은 마른 흙이 잔뜩 묻은 건조한 <br>
                        무화과 껍질의 향으로 <br>
                        딱딱하고 건조함이 느껴지는데, 천천히 <br>
                        자연스럽게 편안한 코코넛 향으로 바뀌며 <br>
                        포근함을 느낄 수 있다는 점에서 따뜻한 아이스 <br>
                        아메리카노 같은 INTP과 닮아 있음
                    </div>

                    <div class="mbti" id="ISTJ">
                        맺고 끊음이 확실하고 솔직함이 매력적인 <br>
                        ISTJ 유형은 강렬한 매캐함으로 짜릿한 <br>
                        첫 향이 매력적인 골든가이아와 찰떡. <br>
                        어딘가 맵지만 스웨이드와 우드의 크리미향으로 <br>
                        부드럽지만 뭉근한 무게감을 만들어주어 <br>
                        단정하고 기대고 싶은 안정감을 주는 향.
                    </div>

                    <div class="mbti" id="ISTP">
                        특별한 말을 하지 않아도 독립적 성향으로 <br>
                        우아함을 풍기는 ISTP의 분위기를 <br>
                        고스란히 느낄 수 있는 <br>
                        묵묵히 제자리를 지키며 품격을 <br>
                        드러내는 마이웨이 향. <br>
                        두께감 없이 맑은 우디향에 쌉싸름한 장미의 <br>
                        조화로 흔하지 않고 특별하다는 것을 <br>
                        스스로 잘 알지만 드러내지 않는 <br>
                        절제된 세련미로 기품 있는 쿨함이 느껴짐.
                    </div>

                    <div class="mbti" id="ISFJ">
                        디테일한 섬세함으로 차분하고 편안하게 <br>
                        만들어주어 기대고 싶은 ISFJ 유형과 닮아 있는, <br>
                        비가 그치고 해가 비치는 숲의 향. <br>
                        촉촉하게 젖어 있는 물 향과 짓이겨진 풀과 <br>
                        은은한 꽃 향이 따뜻한 햇살과 함께 살 위에 <br>
                        안착되어 폭닥거리는 편안한 스모키 향이 주는 <br>
                        안정감의 매력.
                    </div>

                    <div class="mbti" id="ISFP">
                        방금 씻고 나온 듯 보드랍고 깨끗한 비누 향으로 <br>
                        뜨겁지도 차갑지도 않은 미온수 같은 나른함이 <br>
                        매력적인 ISFP 유형과 꼭 닮음. <br>
                        꽃 향을 한껏 머금은 오묘한 수증기의 향이 <br>
                        온화한 분위기를 형성해 <br>
                        금방이라도 호텔 침구에 몸을 맡기고 싶은 <br>
                        나른함이 느껴짐.
                    </div>

                    <div class="mbti" id="INFJ">
                        신비롭고 샘솟는 영감과 특유의 사려 깊음으로 <br>
                        많은 사람들에게 영향을 끼치는 INFJ 유형. <br>
                        꽃과 머스크가 품은 밝은 감성을 조합해 <br>
                        따뜻하고 평온한 분위기를 불러일으키는 <br>
                        향과 닮이 있음. 이슬을 머금은 장미의 <br>
                        싱그러움이 배의 달콤함과 머스크의 깨끗한 <br>
                        향으로 마무리되어 잔향으로 갈수록 느껴지는 <br>
                        포근함과 따스함이 매력.
                    </div>

                    <div class="mbti" id="INTJ">
                        특유의 뾰족한 느낌으로 묘하게 사람을 <br>
                        끌리게 하는 INTJ 유형. <br>
                        뿌리자마자 서늘하게 느껴지는 <br>
                        스파이시한 향조와 은근한 메탈릭함이 특유의 <br>
                        뾰족한 매력을 돋보이게 해 줌. <br>
                        잔향으로 갈수록 느껴지는 꽃 향은 다듬어진 <br>
                        예쁜 장미가 아닌 베일 듯 날카로운 <br>
                        장미가 슬그머니 내비치는 느낌으로 어딘가 <br>
                        퇴폐적인 분위기를 이끌어 줌.
                    </div>

                    <div class="mbti" id="ENTP">
                        자유로움 속 본인만의 멋짐을 추구하는 <br>
                        ENTP 유형은 누구에게나 열려있는 듯하지만 <br>
                        다가기가 어려운 신비로운 존재. <br>
                        이 유형은 무화과의 단 향과 블랙티의 <br>
                        쌉쌀함이 조화롭게 펼쳐져 서늘하면서도 <br>
                        포근함이 느껴지는 역설적인 분위기를 <br>
                        내는 향과 어울림. 어딘가에서 맡아 본 것 같지만 <br>
                        한 번도 맡아본 적 없는 유니크함이 느껴지는 <br>
                        알쏭달쏭한 향이 매력적.
                    </div>

                    <div class="mbti" id="ENTJ">
                        대담하면서 지적인 느낌을 물씬 풍기는 <br>
                        ENTJ가 생각나는 시크함과 포근한 분위기를 <br>
                        지닌 향. 타다 만 묵재에서 날 법한 <br>
                        매캐한 향이 지배적이지만 불씨가 남은 <br>
                        나무에서 느껴지는 요란스럽지 않고 차분한 <br>
                        열정이 지적인 면모를 더함.
                    </div>

                    <div class="mbti" id="ENFJ">
                        정 많고 차분하고 다정한 이미지의 <br>
                        ENFJ는 핑크핑크하면서 성숙한 장미 부케가 <br>
                        연상된느 향과 잘 어울릴 듯함. <br>
                        전반적인 플로럴 향헤 페퍼 향이 가미되어 <br>
                        자칫 단순해질 수 있는 시트러스를 <br>
                        유니크하고 풍성하게 만들어 <br>
                        생기와 차분함을 동시에 갖춘 <br>
                        균형감을 느낄 수 있음.
                    </div>

                    <div class="mbti" id="ESTJ">
                        호불호가 확실하고 자신의 매력 포인트를 <br>
                        정확히 알고 있는 ESTJ 유형은 <br>
                        뚜렷한 노트로 자신만의 선이 확고한 <br>
                        향과 잘 어우러지는 느낌. <br>
                        분명 이국적인 향이지만 느끼하거나 <br>
                        탁해지지 않고 건조하고 담백한 달달함으로 <br>
                        세련되게 무게감을 지키는 단호함이 매력적.
                    </div>

                    <div class="mbti" id="ESFJ">
                        인디보다 TOP100의 대중적인 취향이 더 좋은 <br>
                        ESFJ의 무드를 잘 보여 줄 누구나 좋아할 수 <br>
                        밖에 없는 매니악하지 않은 풀꽃 향. <br>
                        쓸데없는 단 향이나 알싸한 스파이시 향 없이 <br>
                        순수한 꽃 그 자체가 잘 표현된 향으로 군더더기 <br>
                        없는 심플 이즈 베스트.
                    </div>

                    <div class="mbti" id="ESTP">
                        도전적이고 진취적인 성향으로 궁금한 건 절대 <br>
                        못 참는 오픈 마인드 정신을 가진 ESTP. <br>
                        익숙함보다는 낯선 향에 본능적으로 끌리는 <br>
                        ESTP와 닮은 흔하지 않은 끈적하고 알싸한 <br>
                        송진 향. 적당한 스모키함에 라임 한 방울로 <br>
                        따듰한 그린색이 떠오르는데 <br>
                        직설적으로 다가오는 우디함으로 세련되고 톡톡 <br>
                        튀는 힙한 무드를 형성해 주는 매력.
                    </div>

                    <div class="mbti" id="ESFP">
                        선천적 인싸 재질로 같이 있으면 지루할 틈이 없는 <br>
                        발랄한 ESFP 유형과 닮아 있는 <br>
                        자유롭고 푸릇한 청량함. <br>
                        여기에, 새콤하지 않고 담백한 베르가못의 <br>
                        향으로 담아 미지근하지 않고 지루할 틈 없이 <br>
                        쏟아내는 독보적 스포티함이 매력적. <br>
                        깨끗한 파도와 맑은 하늘이 안겨주는 <br>
                        지상낙원의 감흥을 온전히 편안한 <br>
                        자유로움으로 만끽할 수 있음.
                    </div>

                </div>
            </div>
        </main>
        <jsp:include page="../common/footer.jsp" />

        

        <script>
            if("${member.memberId }" == "") {
                alert("결과 확인을 위해선 로그인이 필요합니다");
                location.href = "/member/login";
            }


            $('.mbti').each(function(index, element) {
                if('${mbtiResult }' == $(element).attr('id')) {
                    $('#contents').html($(element).html());
                }
            });
        </script>
    </body>
</html>