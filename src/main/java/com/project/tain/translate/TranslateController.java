package com.project.tain.translate;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class TranslateController {
	
	
	// 언어감지
	@ResponseBody
	@RequestMapping(value="/translate", method = RequestMethod.POST)
	public String detectLangs(@RequestParam(name="source") String source) {
		ApiExamDetectLangs dao = new ApiExamDetectLangs();
		JSONObject obj = new JSONObject();
		System.out.println(source);
		try {
			String json = dao.translate(source);
			System.out.println("json a: " + json);
			JsonParser parser = new JsonParser();
			JsonObject root = parser.parse(json).getAsJsonObject();
			System.out.println("json a: " + root);
			System.out.println("json message: " + root.get("langCode"));
			String result = root.get("langCode").getAsString();
			obj.put("result", result);
			
		} catch(Exception e) {
			obj.put("ack", -1);
		} finally {
		}
		return obj.toJSONString();
	}
	
	// 한국어 -> 영어
	@ResponseBody
	@RequestMapping(value="/TranslateProcKo", method = RequestMethod.POST)
	public String translateKo(@RequestParam(name="source") String source) {
		ApiExamTranslateNmtKo dao = new ApiExamTranslateNmtKo();
		JSONObject obj = new JSONObject();
		System.out.println(source);
		try {
			String json = dao.translateKo(source);
			System.out.println("json a: " + json);
			JsonParser parser = new JsonParser();
			JsonObject root = parser.parse(json).getAsJsonObject();
			System.out.println("json a: " + root);
			System.out.println("json getAsString: " + root.getAsJsonObject("message").getAsJsonObject("result").get("translatedText").getAsString());
			String result = root.getAsJsonObject("message").getAsJsonObject("result").get("translatedText").getAsString();
			obj.put("result", result);
			
		} catch(Exception e) {
			obj.put("ack", -1);
		} finally {
		}
		return obj.toJSONString();
	}
	
	// 영어 -> 한국어
	@ResponseBody
	@RequestMapping(value="/TranslateProcEn", method = RequestMethod.POST)
	public String translateEn(@RequestParam(name="source") String source) {
		ApiExamTranslateNmtEn dao = new ApiExamTranslateNmtEn();
		JSONObject obj = new JSONObject();
		System.out.println(source);
		try {
			String json = dao.translateEn(source);
			System.out.println("json a: " + json);
			JsonParser parser = new JsonParser();
			JsonObject root = parser.parse(json).getAsJsonObject();
			System.out.println("json a: " + root);
			System.out.println("json getAsString: " + root.getAsJsonObject("message").getAsJsonObject("result").get("translatedText").getAsString());
			String result = root.getAsJsonObject("message").getAsJsonObject("result").get("translatedText").getAsString();
			obj.put("result", result);
			
		} catch(Exception e) {
			obj.put("ack", -1);
		} finally {
		}
		return obj.toJSONString();
	}
}
