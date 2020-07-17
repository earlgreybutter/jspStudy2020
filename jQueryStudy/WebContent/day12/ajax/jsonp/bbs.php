<?
	header("Content-Type: application/javascript; charset=UTF-8");
	$callback_name = $_GET['callback'];
	$callback_name = trim($callback_name);
	
	if (!$callback_name) {
		$callback_name = "callback";
	}
?>
<?=$callback_name?>({
	"title": "Javascript + jQuery + Ajax 완벽가이드",
	"description": "그린IT학원에서 진행중인 Javascript 강의 학생용 자료 입니다. 각 게시판의 다운로드 권한은 매 강의 개강시마다 부여됩니다.",
	"total": 4,
	... 생략 ...
});