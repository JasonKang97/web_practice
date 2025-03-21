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
