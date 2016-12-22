package com.front.login;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.member.model.MemberService;
import com.member.model.MemberVO;

import javax.servlet.annotation.WebServlet;

@WebServlet("/Floginhandler")

public class FLoginHandler extends HttpServlet {
	
	//【檢查使用者輸入的帳號(account) 密碼(password)是否有效】
	//【實際上應至資料庫搜尋比對】
	protected boolean allowUser(String mem_ac, String mem_pw) {
		MemberService memberSvc = new MemberService();
		//搜尋帳號
		MemberVO memberVO = memberSvc.getOneByMem_ac(mem_ac);
		if (memberVO==null){
			return false;
		}
		//有帳號取帳號
		String account = memberVO.getMem_ac();
		
		//取出密碼
		String password = memberVO.getMem_pw();
		
		//比對帳號及密碼
		if(account.equals(mem_ac) && password.equals(mem_pw)){
			return true;
		}
		else{
			return false;
		}
	}
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();

		// 【取得使用者 帳號(account) 密碼(password)】
		String mem_ac = req.getParameter("mem_ac");
		String mem_pw = req.getParameter("mem_pw");

		// 【檢查該帳號 , 密碼是否有效】
		if (!allowUser(mem_ac, mem_pw)) {          //【帳號 , 密碼無效時】
			out.println("<HTML><HEAD><TITLE>Access Denied</TITLE></HEAD>");
			out.println("<BODY>你的帳號 , 密碼無效!<BR>");
			out.println("請按此重新登入 <A HREF="+req.getContextPath()+"/front-end/Flogin.html>重新登入</A>");
			out.println("</BODY></HTML>");
		}
		else {                                       //【帳號 , 密碼有效時, 才做以下工作】
			HttpSession session = req.getSession();
			session.setAttribute("mem_ac", mem_ac);   //*工作1: 才在session內做已經登入過的標識

			try {                                                        
				String location = (String) session.getAttribute("location");
				if (location != null) {
					session.removeAttribute("location");   //*工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
					res.sendRedirect(location);            
					return;
				}
			}catch (Exception ignored) {}

			res.sendRedirect(req.getContextPath()+"/front-end/Flogin_success.jsp");  //*工作3: (-->如無來源網頁:則重導至login_success.jsp)
		}
	}

}
