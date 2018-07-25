package cn.theslikeroad.index.servlet;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class IndexCode extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		request.getParameter("code");
		
		BufferedImage biBufferedImage = new BufferedImage(70, 40, BufferedImage.TYPE_INT_RGB);
		Graphics g = biBufferedImage.getGraphics();
		Color c = new Color(240,240,140);
		g.setColor(c);
		
		g.fillRect(0, 0, 70, 40);
		
		char ch[] = "abcdefghijklmn1234567890".toCharArray();
		StringBuffer sb = new StringBuffer();
		Random r = new Random();
		int len = ch.length;
		for (int i = 0; i < 4; i++) {
			int index = r.nextInt(len);
			sb.append(ch[index]);
			
			g.setColor(new Color(r.nextInt(255),r.nextInt(255),r.nextInt(255)));
			g.drawString(ch[index]+"", i*15+10, 20);
		}

		request.getSession().setAttribute("picCode",sb.toString());
		ImageIO.write(biBufferedImage, "JPG", response.getOutputStream());
	}

	
	
}