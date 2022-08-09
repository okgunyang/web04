package com.okhospital.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;
//서버에 저장할 유틸리티 클래스 생성 - 이미지 파일을 걸러주는 유틸리티 파일
public class MediaUtils {
	private static Map<String, MediaType> mediaMap;
	static {
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}

	public static MediaType getMediaType(String type) {
		return mediaMap.get(type.toUpperCase());
	}
}
