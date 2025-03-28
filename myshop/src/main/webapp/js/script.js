function zipCheck(){
	const url = "zipcheck.jsp?check=y";
	window.open(url,"post", "toolbar=no,width=600,height=400,top=200,left=100,status=yes,scrollbars=yes,menubar=no")
}

function idCheck(){
	if(regForm.id.value === ""){
		alert("ID를 입력하세요");
		regForm.id.focus();
	}else{
		const url = "idcheck.jsp?id=" + regForm.id.value;
		window.open(url,"id", "toolbar=no,width=300,height=150,top=200,left=100");
	}
}

function inputCheck(){
	// 입력 자료 검사 후 서버로 전송
	if(regForm.id.value===""){
		alert("ID를 입력하세요");
		regForm.id.focus();
		return;
	}
	// 이하 생략
	
	regForm.submit();
}

// 회원 로그인 관련
function funcLogin(){
	if(loginForm.id.value===""){
		alert("아이디를 입력해주세요");
		loginForm.id.focus();
	}else if(loginForm.passwd.value===""){
		alert("비밀번호를 입력해주세요");
		loginForm.passwd.focus();
	}else{
	loginForm.action = "loginproc.jsp";
	loginForm.method = "post";
	loginForm.submit();
	}
}

function funcNewMember(){
	location.href = "register.jsp";
}

// 쇼핑몰 고객이 로그인 후 자신의 정보 수정
function memberUpdate(){
	document.updateForm.submit();
}

function memberUpdateCancle(){
	location.href="../guest/guest_index.jsp";
}

function memberDelete(){
	alert("생략");
}

// 관리자 관련 
function funcAdminLogin(){
	if(adminLoginForm.admin_id.value===""){
		alert("관리자 아이디를 입력하세요.");
		adminLoginForm.admin_id.focus();
		return;
	}
	else if(adminLoginForm.admin_passwd.value===""){
		alert("관리자 비밀번호를 입력하세요.");
		adminLoginForm.admin_passwd.focus();
		return;
	}
	adminLoginForm.submit();
}

function funcHome(){
	location.href="../guest/guest_index.jsp";
}

function memberUpdate(id){	// 관리자: 전체 회원 수정용
	document.updateFrm.id.value = id;
	document.updateFrm.submit();
}
	
function memberUpdateAdmin(){
	document.updateFormAdmin.submit();
}

function memberUpdateCancleAdmin(){
	location.href="membermanager.jsp";
}

function productDetail(no){	// 관리자: 상품 처리
	document.detailFrm.no.value=no;
	document.detailFrm.submit();
}

function productUpdate(no){
	document.updateFrm.no.value = no;
	document.updateFrm.submit();
}

function productDelete(no){
	if(confirm("정말 삭제하시겠습니까?")){
	document.deleteFrm.no.value = no;
	document.deleteFrm.submit();
	}	
}

// 고객: 상품
function productDetailGuest(no){
	document.detailFrm.no.value=no;
	document.detailFrm.submit();
}

// 관리자가 주문 처리
function orderDetail(no){
	document.detailFrm.no.value=no;
	document.detailFrm.submit();
}

function orderUpdate(form){
	document.detailFrm.flag.value = "update";
	form.submit();
}

function orderDelete(form){
	document.detailFrm.flag.value = "delete";
	form.submit();
}
