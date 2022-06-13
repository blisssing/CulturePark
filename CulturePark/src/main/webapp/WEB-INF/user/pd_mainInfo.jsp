<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.IOException" %>
<div class="infoDetail">
    <%-- 이용 정보 페이지 --%>
    <div class="inner_section" id=time_info_section">
        <div class="inner_section_name">공연시간 정보</div>
        <div class="inner_text" id="time_text">
            <%
                BufferedReader reader = null;
                try {
                    String filePath = application.getRealPath("/resources/user/resource/exhibit/timeinfo/test.txt");
                    reader = new BufferedReader(new FileReader(filePath));
                    while (true) {
                        String str = reader.readLine();
                        if (str == null)
                            break;
                        out.println(str + "<br/>");
                    }
                } catch (FileNotFoundException fnfe) {
                    out.println("파일이 존재하지 않습니다");
                } catch (IOException ioe) {
                    out.print("파일을 읽을 수 없습ㄴ디ㅏ");
                } finally {
                    try { reader.close(); } catch (Exception e){}
                }
            %>
        </div>
    </div>

    <div class="inner_section" id="notice_section">
        <div class="inner_section_name">이 용 안 내 </div>
        <div class="inner_text" id="notice_text">
            <%
                BufferedReader reader2 = null;
                try {
                    String filePath = application.getRealPath("/resources/user/resource/exhibit/descript_txt/text.txt");
                    reader2 = new BufferedReader(new FileReader(filePath));
                    while (true) {
                        String str = reader2.readLine();
                        if (str == null)
                            break;
                        out.println(str + "<br/>");
                    }
                } catch (FileNotFoundException fnfe) {
                    out.println("파일이 존재하지 않습니다");
                } catch (IOException ioe) {
                    out.print("파일을 읽을 수 없습ㄴ디ㅏ");
                } finally {
                    try { reader2.close(); } catch (Exception e){}
                }

            %>
        </div>

        <div id="notice_btn" class="shorter_btn"></div>
    </div>

    <div class="inner_section">
        <div class="inner_section_name"></div>
    </div>

    <div  class="inner_section" id="pd_detail_section">
        <div class="inner_section_name">상 세 정 보</div>
        <div class="inner_content">
            <img src="/resources/user/resource/exhibit/descript_img/test.png">
        </div>
    </div>
</div>