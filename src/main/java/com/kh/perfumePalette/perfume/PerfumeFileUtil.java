package com.kh.perfumePalette.perfume;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("pFileUtil")
public class PerfumeFileUtil {

	public Map<String, String> saveFile(MultipartFile multipartFile, HttpServletRequest req) throws Exception {
		Map<String, String> result = null;
		String renameFilePath = null;
		String renameFileName = null;

		if (multipartFile != null && !multipartFile.getName().equals("")) {
			result = new HashMap<String, String>();

			// file을 서버에 특정위치에 저장
			// 경로를 가져와서 폴더의 경로 지정
			String originalFileName = multipartFile.getOriginalFilename();
			String wasRoot = req.getSession().getServletContext().getRealPath("resources/img");
			String savePath = wasRoot + "\\" + "perfumeFileUploads";

			// 저장할 폴더가 안만들어져 있다면 만들어줘야함
			File folder = new File(savePath);
			if (!folder.exists()) {
				folder.mkdirs();
			}

			// 파일명이 겹치면 안되므로 수정
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
					+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);

			renameFilePath = savePath + "\\" + renameFileName;

			multipartFile.transferTo(new File(renameFilePath)); // 파일 저장

			result.put("original", originalFileName);
			result.put("rename", renameFileName);
			result.put("renameFilePath", renameFilePath);

		}
		return result;
	}
}
