<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="twitter4j.Twitter" %>
<%@ page import="twitter4j.TwitterFactory" %>
<%@ page import="twitter4j.auth.RequestToken" %>
<%@ page import="twitter4j.auth.AccessToken" %>
<%@ page import="twitter4j.conf.ConfigurationBuilder" %>
<%@ page import="twitter4j.conf.Configuration" %>
<html>
    <head>
    <meta charset="utf-8">
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge, chrome=1">
    <meta name="title" content="">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico">
    <link rel="stylesheet" href="/css/jquery-ui.css" media="all">
    <link rel="stylesheet" href="/css/wCommon.css" media="all">
    <link href="http://bluemembers.hyundai.com/oc/hindex.jsp" rel="canonical" />
	<link href="http://bluemembers.hyundai.com/oc/hindex.jsp" rel="alternate" hreflang="ko" />
	<link rel="stylesheet" type="text/css" href="http://bluemembers.hyundai.com/oc/hmcss/style.css" />
	<link rel="stylesheet" type="text/css" href="http://bluemembers.hyundai.com/oc/hmcss/calendar.css"/>
	<link rel="shortcut icon" type="image/x-icon" href="http://bluemembers.hyundai.com/oc/hmimages/BLUEmembers.ico"/>
	<link rel="apple-touch-icon" href="http://bluemembers.hyundai.com/oc/hmimages/hdr/h1_bluememebers.gif"/>
	<script type="text/javascript" src="http://bluemembers.hyundai.com/oc/hmjs/jquery.js"></script>
	<script type="text/javascript" src="http://bluemembers.hyundai.com/oc/hmjs/jquery.alphanumeric.js"></script>
	<script type="text/javascript" src="http://bluemembers.hyundai.com/oc/hmjs/common/common.js"></script>

	<link rel="stylesheet" type="text/css" href="http://bluemembers.hyundai.com/oc/hmcss/main.css" />
	
    
    <script type="text/javascript" src="/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript" src="/js/common.ui.js"></script>
    </head>
    <script type="text/javascript">
    $(document).ready(function(){
        
    });

    </script>
    <%
String consumerKey = "UMLP4vSyIYVbEQmAoijIp1fsb";
String consumerSecret = "tZIWJFubl1Pgw4YjMgSkd2RjkJfCa0NrO2pfeJWY4thKFbdTzq";
//Twitter twitter = new TwitterFactory().getInstance();
/*twitter로 접근한다.*/
//twitter.setOAuthConsumer(consumerKey, consumerSecret); 
/*ConfigurationBuilder builder = new ConfigurationBuilder();
builder.setDebugEnabled(true).setOAuthConsumerKey(consumerKey)
.setOAuthConsumerSecret(consumerSecret).setOAuthAccessToken(null)
.setOAuthAccessTokenSecret(null)
.setOAuthRequestTokenURL("https://api.twitter.com/oauth/request_token")
.setOAuthAuthorizationURL("https://api.twitter.com/oauth/authorize")
.setOAuthAccessTokenURL("https://api.twitter.com/oauth/access_token");
Configuration configuration = builder.build();
TwitterFactory factory = new TwitterFactory(configuration);
Twitter twitter = factory.getInstance();

AccessToken accessToken = null;		
System.out.println("123");  
String oauth_verifier = request.getParameter("oauth_verifier");
//트위터 로그인 연동시 담은 requestToken 의 세션값을 가져온다.
RequestToken requestToken = (RequestToken)request.getSession().getAttribute("requestToken");
//String requestToken = request.getParameter("oauth_token");
System.out.println(requestToken); 
System.out.println(oauth_verifier);    //트위터의 사용자 아이디

accessToken = twitter.getOAuthAccessToken(requestToken, oauth_verifier);	
System.out.println(accessToken); 
twitter.setOAuthAccessToken(accessToken);

//해당 트위터 사용자의 이름과 아이디를 가져온다.
System.out.println(accessToken.getUserId());    //트위터의 사용자 아이디
System.out.println(accessToken.getScreenName()); //트워터에 표시되는 사용자명 		*/	
%>
    <body style="background-color:#e1e1e1;">
    <div class="mp-wrap">
    <div class="mp-header">
        <div class="mp-gnb">
            <input type="image" src='/img/header.png' style='width:100%;height:35px;'>
        </div><!-- //mp-gnb -->
    </div><!-- //mp-header -->
    <div class="mp-contents-wrap"><div class="mp-contents">

        <div class="mp-content-grid grid-type1">
            <div class="mp-control-col col-3">
                <div class="mp-table-type1">
                    <table>
                        <thead>
                        <tr>
                            <a href="/jsp/chatBot/chatBotKor.jsp"><input type="image" src='/img/wva_kor.png' style='width:33%;height:350px;'></a>
                            <a href="/jsp/chatBot/chatBotEng.jsp"><input type="image" src='/img/wva_eng.png' style='width:33%;height:350px;'></a>
                            <a href="/jsp/dashBoard/dashBoard.jsp"><input type="image" src='/img/dashboard.png' style='width:33%;height:350px;'></a>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div><!-- //mp-table-type1 -->
            </div>
            <div class="mp-control-col col-4">
                <div class="mp-table-type1">
                    <table>
                        <tbody>
                        	<tr>
								<td style='padding-top:30px;'><input type="image" src='/img/img_blankimg.png' style='margin-left:23%;height:150px;margin-bottom:20px;'></td>
	                        </tr>
	                        <tr>
	                        	<th id="tid">홍길동님 환영합니다.</th>
	                        </tr>
	                        <tr>
	                        	<td style='padding-left:0px;padding-top:49px;'><input type="image" src='/img/btn_mypage.png' style='width:100%;'></td>
	                        </tr>
                        </tbody>
                    </table>
                </div><!-- //mp-table-type1 -->

            </div>
        </div><!-- //mp-content-grid -->

    </div></div><!-- //mp-contents-wrap -->
</div><!-- //mp-contents -->

<div id="loadingBar" style="position:absolute; display:none; z-index:99999"><img src="http://bluemembers.hyundai.com/oc/hmimages/ico/Loading_.gif" alt="로딩중" /></div>

	<div id="footer">

		<div class="footer-wrap">
			<div class="footer-head">
				<div class="footer-customer">
					<div class="footer-customer_listitem">
						<a href="http://pr.hyundai.com/" title="새 창으로 이동합니다." target="_blank" class="footer-customer_listitem_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_customer_company_introduction.png" alt="회사소개" /></a>
					</div>
					<div class="footer-customer_listitem">
						<a href="http://bluemembers.hyundai.com/oc/hftr/sitemap/hftr_sitemap_sitemap.jsp?screenNm=hftr_sitemap_sitemap" class="footer-customer_listitem_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_customer_sitemap.png" alt="사이트맵" /></a>
					</div>
					<div class="footer-customer_listitem">
						<a href="https://bluemembers.hyundai.com/oc/action.do?fw_serviceName=QaFacade.insertQa&fw_appName=OC_HSUP&screenNm=hsup_qna_qna" class="footer-customer_listitem_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_customer_support.png" alt="고객지원" /></a>
					</div>
					<div class="footer-customer_listitem">
						<a href="http://bluemembers.hyundai.com/oc/hdlc/hdlc_download_center.jsp?screenNm=hdlc_download_center" class="footer-customer_listitem_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_download_center.png" alt="다운로드 센터" /></a>
					</div>
					<div class="footer-customer_listitem">
						<a href="http://bluemembers.hyundai.com/oc/hpns/hpns_affiliate_apply.jsp?screenNm=hpns_affiliate_apply" class="footer-customer_listitem_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_alliance_proposal.png" alt="제휴처 제안" /></a>
					</div>
					<div class="footer-customer_listitem">
						<a href="http://bluemembers.hyundai.com/oc/hftr/mbr_trm/hftr_mbr_trm_blu_clause.jsp?screenNm=hftr_mbr_trm_blu_clause" class="footer-customer_listitem_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_user_agreements.png" alt="이용약관" /></a>
					</div>					
					<div class="footer-customer_listitem">
						<a href="http://bluemembers.hyundai.com/oc/hftr/mbr_trm/hftr_mbr_trm_pers_info_process_clause.jsp?screenNm=hftr_mbr_trm_pers_info_process_clause" class="footer-customer_listitem_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_customer_handling_policy.png" alt="개인정보 처리방침" /></a>
					</div>
					<div class="footer-customer_listitem">
						<a href="#" onclick="goHbizMain();return false;" title="새 창으로 팝업이 열립니다." class="footer-customer_listitem_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_customer_corporate_body.png" alt="법인" /></a>
					</div>
					<div class="footer-customer_listitem">
						<a href="http://bluelink.hyundai.com/" title="새 창으로 이동합니다." target="_blank" class="footer-customer_listitem_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_customer_bluelink.png" alt="블루링크" /></a>
					</div>
				</div>
				<div class="footer-sns">
					<a href="http://blog.hyundai.com/" title="새 창으로 이동합니다." target="_blank" class="footer-sns_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_sns_blog.png" alt="Blog" /></a>
					<a href="https://www.facebook.com/AboutHyundai" title="새 창으로 이동합니다." target="_blank" class="footer-sns_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_sns_facebook.png" alt="Facebook" /></a>
					<a href="https://twitter.com/About_Hyundai" title="새 창으로 이동합니다." target="_blank" class="footer-sns_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_sns_twitter.png" alt="Twitter" /></a>
				</div>
				<div class="footer-familysite">
					<button type="button" class="footer-familysite_btn"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_familysite.png" alt="패밀리 사이트" /></button>
					<div class="footer-familysite_list">
						<ul>
							<li class="footer-familysite_listitem"><a href="http://www.hyundai.com/kr/" title="새 창으로 이동합니다." target="_blank" class="footer-familysite_listitem_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_familysite_hyundai.png" alt="현대자동차" /></a></li>
							<li class="footer-familysite_listitem"><a href="http://www.hyundai.co.kr/" title="새 창으로 이동합니다." target="_blank" class="footer-familysite_listitem_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_familysite_hyundai_group.png" alt="현대자동차 그룹" /></a></li>
							<li class="footer-familysite_listitem"><a href="https://www.genesis.com" title="새 창으로 이동합니다." target="_blank" class="footer-familysite_listitem_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_familysite_genesis.png" alt="제네시스" /></a></li>							
							<li class="footer-familysite_listitem"><a href="http://www.mozen.com/" title="새 창으로 이동합니다." target="_blank" class="footer-familysite_listitem_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_familysite_mozen.png" alt="모젠" /></a></li>
							<li class="footer-familysite_listitem"><a href="http://young.hyundai.com/" title="새 창으로 이동합니다." target="_blank" class="footer-familysite_listitem_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_familysite_young_hyundai.png" alt="영현대" /></a></li>
							<li class="footer-familysite_listitem"><a href="http://kids.hyundai.com/" title="새 창으로 이동합니다." target="_blank"  class="footer-familysite_listitem_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_familysite_kids_hyundai.png" alt="키즈현대" /></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="footer-body">
				<div class="footer-mobile_announcement">
					<div class="footer-mobile_announcement_qrcode">
						<img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_mobile_announcement_img.gif" alt="현재자동차 블루멤버스 어플 다운로드 페이지 바로가기 QR코드" class="footer-mobile_guide_qrcode_img" />
					</div>
					<div class="footer-mobile_announcement_group">
						<p class="footer-mobile_announcement_explanation"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_mobile_announcement_explanation.png" alt="스마트폰 사용 고객이라면 모바일에서도 더욱 간편하게 블루멤버십 혜택을 누리세요!" /></p>
						<a href="http://bluemembers.hyundai.com/oc/hmgt/mb_svc/hmgt_mb_svc_tab_app_01.jsp?screenNm=hmgt_mb_svc_tab_app_01" class="footer-mobile_announcement_link"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer-mobile_announcement_btn.png" alt="모바일 안내" /></a>
					</div>
				</div>
				<div class="footer-body_part_group">
					<div class="footer-contact">
						<span class="footer-contact_listitem"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_contact_center.png" alt="고객센터 080 - 600 - 6000" /></span>
						<span class="footer-contact_listitem"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_contact_bluelink.png" alt="블루링크 1899 - 0606" /></span>
						<span class="footer-contact_listitem"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_contact_honors_g.png" alt="HONORS G 080 - 900 - 6000" /></span>
						<span class="footer-contact_listitem"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_contact_genesis.png" alt="GENESIS 080 700 6000" /></span>
					</div>
					<div class="footer-award">
						<div class="footer-award_screen">
							<ul>
								<li class="footer-award_screen_listitem" style="width:238px"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_award1.png" alt="16년 국가고객만족도 조사 전 부문 1위 (소형, 준중형, 중형, 준대형, 대형, RV)" /></li>
								<li class="footer-award_screen_listitem" style="width:168px"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_award2.png" alt="2016년 한국산업의 고객만족도 일반승용차, RV승용차 부문 1위" /></li>
							</ul>
						</div>
						<div class="footer-award_controller">
							<button type="button" class="footer-award_controller_btn type-prev" id="footer-award_controller_btn-prev"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_award_prev.png" alt="이전" /></button>
							<button type="button" class="footer-award_controller_btn type-next" id="footer-award_controller_btn-next"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_award_next.png" alt="다음" /></button>
						</div>
					</div>
				</div>
				<div class="footer-copyright">
					<div class="footer-copyright_logo"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_logo.png" alt="HYUNDAI" /></div>
					<div class="footer-copyright_imgbox"><img src="http://bluemembers.hyundai.com/oc/hmimages/common/footer_copyright.png" alt="COPYRIGHT HYUNDAI MOTOR COMPANY. ALL RIGHTS RESERVED." /></div>
				</div>
			</div>
		</div>
	</div>
    </body>
</html>