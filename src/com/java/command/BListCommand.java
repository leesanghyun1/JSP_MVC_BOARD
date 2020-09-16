package com.java.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.dao.BDao;
import com.java.dto.BDto;

public class BListCommand implements BCommand {
    
   @Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	   BDao dao = new BDao(); //바로 생성자 실행 되면서 DB연결
		ArrayList<BDto> dtos = dao.list();
		request.setAttribute("list", dtos);
	}
   

}
