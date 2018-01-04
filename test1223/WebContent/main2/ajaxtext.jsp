<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	//id�� p+(����*10�ϱ�)
	$("#p" + (${vo.roundrating }*10)).prop("checked", true);
	for(var i=1;i<=50;i++) {
		$("[id=p" + i + "]:not(:checked)").attr('disabled','disabled');
	}
	
	$("#pa" + (${vo1.roundrating }*10)).prop("checked", true);
	for(var i=1;i<=50;i++) {
		$("[id=pa" + i + "]:not(:checked)").attr('disabled','disabled');
	}
	
	$("#pb" + (${vo2.roundrating }*10)).prop("checked", true);
	for(var i=1;i<=50;i++) {
		$("[id=pb" + i + "]:not(:checked)").attr('disabled','disabled');
	}
});
</script>

</head>
<body>
	<div class="main_jumpo">
		<div class="state">
			<p>����</p>
		</div>

		<div class="row"
			style="background-image: url(hot3/cb_img/cb_img_${vo.cb_no}.jpg); background-size: 100% 100%;">
			<div class="black_box"></div>
			<div class="jumpo_name">

				<p>${vo.cb_name }</p>
				<div class="sebu">
					<!-- ����/��/��ȸ�� �����ֱ� -->
					<table class="cb_info_table">
						<tr>
							<td>
								<div class="rating text-center">
									<p>����</p>
										<span class="star-input"> 
											<span class="input"> <c:forEach
												var="i" begin="1" end="50">
												<input type="radio" name="star-input" id="p${i }"
													value="${i/10}">
												<label for="p${i }" style="width: ${i*2}px; z-index:${51-i}">${i/10}</label>
											</c:forEach>
											</span>
										</span>
									<h4>${vo.roundrating }</h4>

								</div>
							</td>
							<td>
								<div class="like text-center">
									<p>��</p>
									<img src="main2/img/like.png">
									<h4>${vo.jjim }</h4>
								</div>
							</td>
							<td>
								<div class="hit text-center">
									<p>��ȸ��</p>
									<img src="main2/img/hit_icon.png">
									<h4>${vo.avghit }</h4>

								</div>
							</td>
						</tr>
					</table>
				</div>

			</div>

		</div>
	</div>
	<div class="main_jumpo">
		<div class="state">
			<p>���¿�</p>
		</div>
		<div class="row"
			style="background-image: url(hot3/cb_img/cb_img_${vo1.cb_no}.jpg); background-size: 100% 100%;">
			<div class="black_box"></div>
			<div class="jumpo_name">
			<p>${vo1.cb_name }</p>
				<div class="sebu">
					<!-- ����/��/��ȸ�� �����ֱ� -->
					<table class="cb_info_table">
						<tr>
							<td>
								<div class="rating text-center">
									<p>����</p>
										<span class="star-input"> 
											<span class="input"> <c:forEach
												var="i" begin="1" end="50">
												<input type="radio" name="star-input2" id="pa${i }"
													value="${i/10}">
												<label for="pa${i }" style="width: ${i*2}px; z-index:${51-i}">${i/10}</label>
											</c:forEach>
											</span>
										</span>
									<h4>${vo1.roundrating }</h4>

								</div>
							</td>
							<td>
								<div class="like text-center">
									<p>��</p>
									<img src="main2/img/like.png">
									<h4>${vo1.jjim }</h4>
								</div>
							</td>
							<td>
								<div class="hit text-center">
									<p>��ȸ��</p>
									<img src="main2/img/hit_icon.png">
									<h4>${vo1.avghit }</h4>

								</div>
							</td>
						</tr>
					</table>
				</div>
		</div>
	</div>
	<div class="main_jumpo">
		<div class="state">
			<p>ȫ��</p>
		</div>
		<div class="row"
			style="background-image: url(hot3/cb_img/cb_img_${vo2.cb_no}.jpg); background-size: 100% 100%;">
			<div class="black_box"></div>
			<div class="jumpo_name">
			<p>${vo2.cb_name }</p>
				<div class="sebu">
					<!-- ����/��/��ȸ�� �����ֱ� -->
					<table class="cb_info_table">
						<tr>
							<td>
								<div class="rating text-center">
									<p>����</p>
										<span class="star-input"> 
											<span class="input"> <c:forEach
												var="i" begin="1" end="50">
												<input type="radio" name="star-input3" id="pb${i }"
													value="${i/10}">
												<label for="pb${i }" style="width: ${i*2}px; z-index:${51-i}">${i/10}</label>
											</c:forEach>
											</span>
										</span>
									<h4>${vo2.roundrating }</h4>

								</div>
							</td>
							<td>
								<div class="like text-center">
									<p>��</p>
									<img src="main2/img/like.png">
									<h4>${vo2.jjim }</h4>
								</div>
							</td>
							<td>
								<div class="hit text-center">
									<p>��ȸ��</p>
									<img src="main2/img/hit_icon.png">
									<h4>${vo2.avghit }</h4>

								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>