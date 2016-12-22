package com.member.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.member.model.*;
import util.SendResponse;
import util.ImageUtil;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)

@SuppressWarnings("serial")
@WebServlet("/MemberServletAndroid_cyhtmp")
public class MemberServletAndroid_cyhtmp extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

//		req.setCharacterEncoding("UTF-8");
//		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
//		BufferedReader br = req.getReader();
//		StringBuffer jsonIn = new StringBuffer();
//		String line = null;
//		while((line = br.readLine()) != null){
//			jsonIn.append(line);
//		}
//		JsonObject jsonObject = gson.fromJson(jsonIn.toString(), JsonObject.class);
//		MemberService memberSvc = new MemberService();
//		String action = jsonObject.get("action").getAsString();
//		System.out.println("action:" +action);
//		System.out.println("jsonIn.toString():" +jsonIn.toString());
		req.setCharacterEncoding("UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		MemberService memberSvc = new MemberService();
		BufferedReader br = req.getReader();
		StringBuffer jsonIn = new StringBuffer();
		String line = null;
		while ((line = br.readLine()) != null) {
			jsonIn.append(line);
		}
		if (gson.fromJson(jsonIn.toString(), JsonObject.class) == null) {
			return;
		}

		JsonObject jsonObject = gson.fromJson(jsonIn.toString(), JsonObject.class);

		String action = jsonObject.get("action").getAsString();
		System.out.println("action = " + action);
		StringBuffer outStr = new StringBuffer();		
		if ("getAll".equals(action)) {
			List<MemberVO> memberlist = memberSvc.getAll();
			SendResponse.writeText(res, gson.toJson(memberlist));
			return;
//			List<MemberVO> memberlist = memberSvc.getAll();
//			outStr.append(gson.toJson(memberlist));
//			SendResponse.writeText(res, outStr.toString());
//			return;
		}

		
		if ("getOne_For_Display".equals(action)) {
			
//			String memnoJson = jsonObject.get("memno").getAsString();
//			JsonReader reader = new JsonReader(new StringReader(memnoJson));
//			reader.setLenient(true);
//			String memno = gson.fromJson(reader, String.class);
//			MemberVO memberVO = memberSvc.getOneMemberTextOnly(memno);
//			
//			outStr.append(gson.toJson(memberVO));
//			SendResponse.writeText(res, outStr.toString());
			
			MemberVO member = gson.fromJson(jsonObject.get("memberVO").getAsString(), MemberVO.class);
			memberSvc.deleteMember(member.getMem_no());
			SendResponse.writeText(res, String.valueOf(member));
		}
		
		if ("getOne_For_Update".equals(action)) { 
		}
		
		if ("update".equals(action)) { 
		}
		
		if ("insert".equals(action)) {   
		}
			
		if ("delete".equals(action)) { 
		}
		if ("getImage".equals(action)) {
			OutputStream os = res.getOutputStream();
			String mem_no = jsonObject.get("mem_no").getAsString();
			int imageSize = jsonObject.get("imageSize").getAsInt();
			byte[] mem_image = memberSvc.getImage(mem_no);
			System.out.println("mem_no " + mem_no + " mem_image " + mem_image+ " imageSize " + imageSize);

			if (mem_image != null) {

				mem_image = ImageUtil.shrink(mem_image, imageSize);
				res.setContentType("image/jpeg");
				res.setContentLength(mem_image.length);
			} else {
				InputStream in = getServletContext().getResourceAsStream("/NoData/nopic.jpg");
				mem_image = new byte[in.available()];
				in.read(mem_image);
				in.close();
			}
			os.write(mem_image);
			return;
		}
		
	}

}
