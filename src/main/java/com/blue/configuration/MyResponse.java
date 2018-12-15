package com.blue.configuration;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.multipart.MultipartFile;

public class MyResponse {
	@Autowired
    Environment environment;
	private String rootPath;

	
	public String getRootPath() {
		return rootPath;
	}


	public void setRootPath(String rootPath) {
		this.rootPath = rootPath;
	}


	public void print(HttpServletResponse response, Object obj) throws IOException {
		PrintWriter out = response.getWriter();
		out.println(obj);
		out.flush();
		out.close();
	}
	
	
	public void uploadImage(MultipartFile[] files, String path) throws IOException {
		BufferedImage bufferedImage = null;
		if(files[0].isEmpty()) {
			File f = new File(this.rootPath
					+"/"
					+ environment.getRequiredProperty("image.default"));
			System.out.println(f.getAbsolutePath());
			bufferedImage = ImageIO.read(f);
			File outputfile = new File(this.rootPath+path);
	    		if(!outputfile.exists()) outputfile.mkdirs();
			ImageIO.write(bufferedImage, "jpeg", outputfile);
			System.out.println(outputfile.getAbsolutePath());
		}else {
			for (MultipartFile file : files) {
				if (!file.getOriginalFilename().isEmpty()) {
					InputStream inputStream = file.getInputStream();
					bufferedImage = ImageIO.read(inputStream);
					File outputfile = new File(this.rootPath+path);
					System.out.println(outputfile.getAbsolutePath());
			    		if(!outputfile.exists()) outputfile.mkdirs();
					ImageIO.write(bufferedImage, "jpeg", outputfile);
				}
			}
		}
	}
}
