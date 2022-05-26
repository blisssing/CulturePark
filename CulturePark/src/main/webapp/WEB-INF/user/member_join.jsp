<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%-- css 불러오기 --%>
    <style><%@include file="/resources/common/css/reset.css" %></style>
    <style><%@include file="/resources/common/css/common.css" %></style>
    <style><%@include file="/resources/user/css/member_join.css" %></style>

    <title> join </title>
</head>

<body>

<%-- Main --%>
<div class="mainContainer">
    <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>

    <div class="centerContainer">
        <%-- 절대 건드리지말기.  div 따로 만들어주고 건드리기 --%>


                <div class="back_section">
                    <div class="arrow_section">
                        <i class="fa-solid fa-arrow-left"></i>
                        <div class="back">뒤로가기</div>
                    </div>
                </div>

            <%-- -------------- 회원정보입력 영역 --------------- --%>
            <div class="join_section">

                <div class="join_label_section">
                    <div class="join_label">회원 가입</div>
                </div>

                <p class="sectionLine_thin"></p>

                <div class="id_section">
                    <div class="id_label">아이디</div>
                    <input class="id_value_1 id_value_1_p" type="textFiled" name="id_value_1" value="이메일">


                    <%-- 아이디 중복확인 버튼 --%>
                    <input class="id_confirm_btn id_confirm_btn_p" type="button" name="id_confirm_btn" value="중복확인">
                </div>

                <div class="pw_section">
                    <div class="pw_label">비밀번호</div>
                    <input class="pw_value pw_value_p" type="password" name="pw_value">
                </div>

                <div class="rePw_section">
                    <div class="rePw_label">비밀번호 확인</div>
                    <input class="rePw_value rePw_value_p" type="password" name="rePw_value">
                    <%-- 비밀번호확인 체크 메세지--%>
                    <div class="pw_check" type="textFiled" name="pw_check" value="비밀번호체크">test::비밀번호체크메세지</div>
                </div>

                <div class="nick_section">
                    <div class="nick_label">닉네임</div>
                    <input class="nick_value nick_value_p" type="textFiled" name="nick_value">
                   <%--닉네임 중복확인 버튼--%>
                    <input class="nick_confirm_btn nick_confirm_btn_p" type="button" name="nick_confirm_btn" value="중복확인">
                </div>
                <%-- 닉네임 중복확인 메세지 --%>
                <div class="nick_confirm_msg_section">
                    <span class="nick_confirm_msg nick_confirm_msg_p">test::닉네임중복확인메세지</span>
                </div>

                <div class="name_section">
                    <div class="name_label">이름</div>
                    <input class="name_value name_value_p" type="textFiled" name="name_value">
                </div>

                <div class="jumin_section">
                    <div class="jumin_label">주민번호</div>
                    <input class="jumin_value1 jumin_value1_p" type="number" name="jumin_value1" value="주민번호값1" > -
                    <input class="jumin_value2 jumin_value2_p" type="number" name="jumin_value2" value="주민번호값2" > ******
                </div>

                <div class="tel_section">
                    <div class="tel_label">전화번호</div>
                    <select id="tel_1" name="tel_1" >
                        <option value="">선택</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="019">019</option>
                    </select> -
                    <input class="tel_2 tel_2_p" type="text" name="tel_2"> -
                    <input class="tel_3 tel_3_p" type="text" name="tel_3">

                    <%-- 인증번호받기 버튼--%>
                    <input class="tel_authentication_btn tel_authentication_btn_p" type="button" name="tel_authentication_btn" value="인증번호">
                </div>

                <%-- 인증번호받기 버튼 클릭시 나타남 --%>
                <div class="authentication_code_section">
                    <div class="authentication_code_label">인증번호</div>

                    <input class="authentication_code authentication_code_p" type="text" name="authentication_code">

                    <div class="code_reSend_btn_section">
                        <input class="code_reSend_btn" type="button" name="code_reSend_btn" value="재발송">
                        <input class="code_ok_btn" type="button" name="code_ok_btn" value="확인">
                    </div>
                </div>
                <%-- 인증 유효시간 --%>
                <div class="certifyTime">
                    <span class="time">test::00:00</span>
                </div>

            </div>


            <%-- ---------------- 약관동의 영역 ------------------ --%>
            <div class="agree_condition_section">
                <div class="agree_condition_label_section">
                    <div class="agree_condition_label">약관동의</div>
                </div>

                <div class="agree_condition_all_section">
                    <div class="agree_condition_all">
                        <input type="checkbox" class="checkbox_all">
                        <span class="checkbox_all_label">전체동의</span>
                    </div>
                </div>

                <%-- 이용약관 1 --%>
                <div class="agree_1">
                    <div class="agree_1_label">Culture Park 이용약관</div>

                    <div class="agree_condition_content" type="textArea">
                        <ul>
                            <li>
                                <h3>제1조 (목적)</h3>
                                <ul>
                                    <li>
                                        이 약관은 ㈜컬쳐파크(이하 "회사"라고 합니다)가 운영하는 인터넷사이트 및 오프라인 영업장을 통하여 제공하는
                                        전자상거래 관련 서비스(이하 "서비스"라고 합니다)를 이용함에 있어 회사와 이용자의 권리,
                                        의무 및 책임사항을 정하는 것을 목적으로 합니다.
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <h3>제2조 (정의) </h3>
                                <ul>
                                    <li>① "컬쳐파크"라 함은 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한
                                        가상의 영업장(www.culturepark.com 또는 www.culturepark.co.kr)을 말하며, 아울러 사이버 몰을 운영하는 사업자의 의미로도 사용합니다.
                                        단, 아이포인트몰, 투어, 도서, 공연/영화 및 쇼핑에 한하며 다른 탭의 영업장 및 www.playdb.co.kr은 제외합니다.</li>
                                    <li>② "이용자"라 함은 회사에 접속하여 이 약관에 따라 회사가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</li>
                                    <li>③ "회원"이라 함은 회사에 개인정보를 제공하여 회원등록을 한 자로서, 회사의 정보를 지속적으로 제공받으며, 회사가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.</li>
                                    <li>④ "비회원"이라 함은 회원에 가입하지 않고 회사가 제공하는 서비스를 이용하는 자를 말합니다.</li>
                                    <li>⑤ "Toping회원"이라 함은 회사의 티켓예매/ENT서비스에 개인정보를 제공하고, 회원등록을 한 자로서 회비를 납부한 후 Toping회원 기간 내 회사의 정보를 지속적으로 제공받으며,
                                        회사가 제공하는 유료회원 서비스를 이용할 수 있는 회원으로 티켓부문에 한합니다.</li>
                                    <li>⑥ "어린이 회원"이라 함은 회사에 보호자의 동의를 얻어 개인정보를 제공하고 회원으로 등록한 만14세 미만의 자로서, 회사의 정보를 제공받고,
                                        회사가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 의미합니다.</li>
                                    <li>⑦ "오픈마켓"이라 함은 회사를 통하여 판매자와 구매자간에 물품 매매 거래가 이루어질 수 있는 사이버 거래장소를 온라인으로 제공하는 서비스 및 관련 부가 서비스 일체를 말합니다.</li>
                                    <li>⑧ "판매자"라 함은 본 약관 및 오픈마켓 판매자약관을 승인하고, 회사와 서비스 이용계약을 체결한 자를 말하며,
                                        물품을 판매할 의사로 해당 물품을 회사가 온라인으로 제공하는 양식에 맞추어 등록한 자의 의미로도 사용합니다.</li>
                                    <li>⑨ "구매자"라 함은 재화 또는 용역을 구입할 의사를 회사가 온라인으로 제공하는 양식에 맞추어 밝힌 이용자를 말하며,
                                        회원 및 비회원 구매자 모두를 의미합니다.</li>
                                    <li>⑩ "I-Point"라 함은 이용자가 인터파크 및 가맹사이트(인터파크투어 등)에서 재화를 구입하거나 용역을 이용하고
                                        그 대가를 지급하는데 사용하기 위하여 ㈜컬쳐파크가 발행, 관리하는 마일리지 형태의 선불식 전자지급수단을 말합니다.</li>
                                    <li>⑪ "디지털 상품"이라 함은 동영상, eBook, 음원과 같이 VOD, 스트리밍, 다운로드 등의 형태로 제공되는 무배송 상품을 말합니다.</li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                    <div class="checkbox_section">
                        <input type="checkbox" class="checkbox_one">
                        <span class="checkbox_one_label">네,동의하였습니다.</span>
                    </div>
                </div>

                <%-- 이용약관 2 --%>
                <div class="agree_2">
                    <div class="agree_2_label">전자금융거래 이용약관</div>

                    <div class="agree_condition_content" type="textArea">

                        <ul>
                            <li>
                                <h3>제1조 (목적)</h3>
                                <ul>
                                    <li>
                                    본 약관은 주식회사 컬쳐파크 (이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스, 결제대금예치서비스 또는
                                    선불식전자지급수단의 발행 및 관리 서비스(이하 통칭하여 '전자금융거래서비스'라 합니다)를 ‘이용자’가 이용함에 있어,
                                    ‘회사’와 ‘이용자’ 간 권리, 의무 및 ‘이용자’의 서비스 이용절차 등에 관한 사항을 정함에 그 목적이 있습니다.
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <h3>제2조(정의</h3>
                                <ul>
                                    <li>
                                        본 약관에서 정하는 용어의 정의는 다음과 같으며, 본 조에서 정한 것을 제외하고는 전자금융거래법 등 관련법령이 정한 바에 의합니다.
                                        <ul>
                                            <li>1. '전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자금융업무를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.
                                            </li>
                                            <li>2. '전자지급거래'라 함은 자금을 주는 자(이하 '지급인'이라 합니다)가 회사로 하여금 전자지급수단을 이용하여 자금을 받는 자(이하 '수취인'이라 합니다)에게 자금을 이동하게 하는 전자금융거래를 말합니다.
                                            </li>
                                            <li><3. '전자적 장치'라 함은 전자금융거래정보를 전자적 방법으로 전송하거나 처리하는데 이용되는 장치로서 현금자동지급기, 자동입출금기, 지급용단말기, 컴퓨터, 전화기 그 밖에 전자적 방법으로 정보를 전송하거나 처리하는 장치를 말합니다.
                                            </li>
                                            <li>4. '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법' 상의 인증서, 금융기관 또는 전자금융업자에 등록된 아이디, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호, 기타 ‘회사’가 지정한 수단을 말합니다.
                                            </li>
                                            <li>5. '아이디'란 이용자의 동일성 식별과 서비스 이용을 위하여 이용자가 설정하고 회사가 승인한 숫자와 문자의 조합을 말합니다.
                                            </li>
                                            <li>6. '비밀번호'란 이용자의 동일성 식별과 회원정보의 보호를 위하여 이용자가 설정하고 회사가 승인한 숫자와 문자의 조합을 말합니다.
                                            </li>
                                            <li>7. '거래지시'라 함은 이용자가 전자금융거래계약에 따라 금융기관 또는 전자금융업자에게 전자금융거래의 처리를 지시하는 것을 말합니다.
                                            </li>
                                            <li>8. '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>

                    </div>

                    <div class="checkbox_section">
                        <input type="checkbox" class="checkbox_one">
                        <span class="checkbox_one_label">네,동의하였습니다.</span>
                    </div>
                </div>

                <%-- 이용약관 3 --%>
                <div class="agree_3">
                    <div class="agree_3_label">개인정보 수집동의서</div>

                     <div class="agree_condition_content" type="textArea">
                         <ul>
                             <li>
                                 컬쳐파크는 인터파크회원에게 쇼핑, 도서, 티켓 예매, 투어/숙박/항공 예매 서비스와 회원관리서비스,
                                 그리고 보다 다양한 서비스 제공을 위하여 아래와 같이 회원의 개인정보를 수집, 활용합니다.
                                 * 본 수집동의서 상의 용어의 정의는 "컬쳐파크 이용약관 및 개인정보처리방침"에 준용하며
                                 컬쳐파크 서비스 제공을 위해서 필요한 최소한의 개인정보이므로 동의를 해주셔야만 서비스를 이용 하실 수 있습니다.
                             </li>
                         </ul>
                     </div>

                    <div class="checkbox_section">
                        <input type="checkbox" class="checkbox_one">
                        <span class="checkbox_one_label">네,동의하였습니다.</span>
                    </div>
                </div>


            <div class="join_btn_section">
                <input type="button" class="join_btn" name="join_btn" value="회원가입">
            </div>

    </div><%-- /centerContainer --%>
</div><%-- /mainContainer --%>

</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/user/js/member_join.js"></script>

</html>