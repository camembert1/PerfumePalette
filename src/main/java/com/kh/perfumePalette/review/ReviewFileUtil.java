package com.kh.perfumePalette.review;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("rFileUtil")
public class ReviewFileUtil {

	public Map<String, String> saveFile(MultipartFile multipartFile, HttpServletRequest request) throws Exception {
		Map<String, String> result = null;
		String renameFilePath = null;
		String renameFileName = null;

		if (multipartFile != null && !multipartFile.getName().equals("")) {
			result = new HashMap<String, String>();

			// file을 서버에 특정위치에 저장
			// 경로를 가져와서 폴더의 경로 지정
			String originalFilename = multipartFile.getOriginalFilename();
			String wasRoot = request.getSession().getServletContext().getRealPath("resources/img");
			String savePath = wasRoot + "\\" + "reviewFileUploads";

			// 저장할 폴더가 안만들어져 있다면 만들어줘야함
			File folder = new File(savePath);
			if (!folder.exists()) {
				folder.mkdirs();
			}

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
					+ originalFilename.substring(originalFilename.lastIndexOf(".") + 1);

			// a.png
			renameFilePath = savePath + "\\" + renameFileName;

			multipartFile.transferTo(new File(renameFilePath)); // 파일 저장

			result.put("original", originalFilename);
			result.put("rename", renameFileName);
			result.put("renameFilePath", renameFilePath);
		}
		return result;
	}
}
