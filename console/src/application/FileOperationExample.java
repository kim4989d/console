package application;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;
import java.util.Scanner;

public class FileOperationExample {

	private static void processFile(String filePath) {
		// 파일 존재 여부 확인

		// 여러 파일을 입력받기
		System.out.println("여러 파일을 입력하세요 (파일1.txt 파일2.txt ...): ");
		String[] fileNames = scanner.nextLine().split(" ");

		// 각 파일에 대한 처리
		for (String fileName : fileNames) {  
			String sourcePath = "원본 경로/" + fileName;
			String destinationPath = "목적지 경로/" + fileName;

			try {
				// 파일 읽기
				List<String> lines = Files.readAllLines(Paths.get(sourcePath));

				// 읽은 내용을 다른 파일에 쓰기
				Files.write(Paths.get(destinationPath), lines, StandardOpenOption.CREATE);

				System.out.println(fileName + "을 읽어와서 " + destinationPath + "에 저장했습니다.");
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("파일 처리 중 오류가 발생했습니다.");
			}
		}
	}

	// 키보드 입력을 받기 위한 Scanner 객체 생성
	static Scanner scanner = new Scanner(System.in);

	public static void main(String[] args) {

		// 파일 경로를 입력받기
		System.out.println("파일 경로를 입력하세요: ");
		String filePath = scanner.nextLine();

		// 파일 존재 여부 확인 및 처리
		processFile(filePath);

		// Scanner 사용이 끝났으면 닫기
		scanner.close();

	}
}
