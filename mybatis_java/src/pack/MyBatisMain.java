package pack;

import java.util.List;

public class MyBatisMain {
	public static void main(String[] args) {
		ProcessDao processDao = ProcessDao.getInstance();
		try {
			/*
			System.out.println("자료 추가");
			DataDto dataDto = new DataDto();
			dataDto.setCode("10");
			dataDto.setSang("프라푸치노");
			dataDto.setSu("10");
			dataDto.setDan("7000");
			processDao.insertData(dataDto);
			*/
			
			/*
			System.out.println("자료 수정");
			DataDto dataDto = new DataDto();
			dataDto.setCode("10");
			dataDto.setSang("바나나우유");
			dataDto.setSu("7");
			dataDto.setDan("2000");
			processDao.upData(dataDto);
			*/
			
			/*
			System.out.println("자료 삭제");
			int co = 9;
			boolean b = processDao.delData(co);
			if(b) {
				System.out.println("삭제 완료");
			}else {
				System.out.println("삭제 실패");
			}
			*/
			
			System.out.println("전체 자료 출력");
			List<DataDto> list = processDao.selectDataAll();
			for(DataDto s:list) {
				System.out.println(s.getCode() + " " + s.getSang() + " " + s.getSu() + " " + s.getDan());
			}
			
			System.out.println("부분 자료 출력");
			String code="2";
			DataDto dto = processDao.selectDataPart(code);
			System.out.println(dto.getCode() + " " + dto.getSang() + " " + dto.getSu() + " " + dto.getDan());


		} catch (Exception e) {
			System.out.println("err: " + e);
		}
	}
}
