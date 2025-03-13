const myPromise = (seconds) => new Promise((resolve, reject) => {
	setTimeout(() => {
		let a = 2;
		if(a%2 ===0){
			resolve("이 값이 then 메소드의 매개변수로 전달된다.");
		}
		else{
			reject('에러: reject이 실행되면 catch 메소드로 받을 수 있다.');
		}
	}, seconds);
});

// async 함수 내에서만 await를 사용 가능하다.
async function gogo(){
	try{
		const result1 = await myPromise(1000);	// then 메소드 처리를 담당.
		console.log(result1);
		
		const result2 = await myPromise(2000);
		console.log(result2);
		
		const result3 = await myPromise(1000);
		console.log(result3);
	}catch(e){
		console.log(e);
	}finally{
		console.log("good");
	}
}

