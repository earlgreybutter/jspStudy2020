<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	// 페이지 지시자에서 contentType을 "application/json"로 설정한 JSP파일은 출력 결과물이 JSON 파일로 인식된다.
	// 출력 결과물이 텍스트문서라는 점 외에는 JSP가 갖는 웹 프로그래밍적 성격은 그대로 유지된다.

	/** (1) 파라미터를 받는 것이 가능하다. */
	String keyword = request.getParamger("keyword");

	/**
	 *
	 * (2) 이 부분에 Java의 모든 문법적 처리나 DATABASE의 연동 처리가 가능하다.
	 *
	 */

	/** (3) 결과를 출력하기 위해서는 HTML 처리와 같은 형태로 json구조를 출력해 준다. */
%>
{
	"school": {
		"subject": [
<%
	/** JSP의 IF분기 */
	if (keyword.equals("web")) {
%>
			{
				"title": "Javascript+jQuery+Ajax",
				"time": "매주 월/수/금 오후 7시30분~10시20분",
				"teacher": "주영아"
			},
			{
				"title": "HTML5+CSS3 기반의 반응형 웹",
				"time": "매주 화/목 오후 7시30분~10시20분",
				"teacher": "주영아"
			}
<%
	/** JSP의 ELSE IF분기 */
	} else if (keyword.equals("app")) {
%>
			{
				"title": "Java 입문에서 활용까지",
				"time": "매주 화/목 오후 7시30분~10시20분",
				"teacher": "이광호"
			},
			{
				"title": "안드로이드 앱(APP)개발-실전(실무활용)",
				"time": "매주 월/수/금 오후 7시30분~10시20분",
				"teacher": "이광호"
			}
		]
	}
}
<%
	/** JSP의 IF분기 끝 */
	}
%>