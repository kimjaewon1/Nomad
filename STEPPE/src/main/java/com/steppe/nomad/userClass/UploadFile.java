package com.steppe.nomad.userClass;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.steppe.nomad.dao.FreelancerDao;
import com.steppe.nomad.service.FreelancerManagement;

public class UploadFile {
	
	FreelancerDao fDao = new FreelancerDao();
	FreelancerManagement pfmm = new FreelancerManagement();
	public UploadFile() {

	}	   
	public List<String> fileUp(MultipartHttpServletRequest multi, MultipartFile[] files){
	      //1.저장경로 찾기
	      String root=multi.getSession().getServletContext().getRealPath("/");//물리적이 주소 찾음/위의 Spring-board까지 찾음
		  String path=root+"/resources/upload/";
	      //2.폴더 생성을 꼭 할것...
	      File dir=new File(path);
	      if(!dir.isDirectory()){  //폴더 없다면
	         dir.mkdir();  //upload폴더 생성
	      } 
	      //List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
	      
	      //Iterator<String> fileList = multi.getFileNames();
	      //System.out.println("Iterator:"+fileList);
	      //Map<String,Object> fMap=new HashMap<String, Object>();
	      MultipartFile mf;
	      //Iterator<String> files1 = multi.getFileNames();
	      //List<MultipartFile> list = multi.getFiles("pf_image[]");
	      List<String> listStr = new ArrayList<String>();
	            //multi.getFiles("pf_image[]");
	      /*while(files1.hasNext()){
	         String fileTagName=files1.next();
	         System.out.println("fileTagName"+fileTagName);
	      }*/
	      for(MultipartFile file : files){
	    	  //System.out.println("파일 몇번돌아??");
	         byte[] bytes;
	         try {
	            bytes = file.getBytes();
	         //String fileTagName = file.getName();
	         String oriFileName=file.getOriginalFilename();
	         System.out.println("filetagname:"+file);
	         mf = multi.getFile(oriFileName);
	         //fMap.put("oriFileName", oriFileName);
	         String sysFileName=System.currentTimeMillis()+"."
	               +oriFileName.substring(oriFileName.lastIndexOf(".")+1);
	         //fMap.put("sysFileName", sysFileName);
	         System.out.println("sysFileName:"+sysFileName+"path:"+path);
	         File serverFile = new File(path+sysFileName);
	            BufferedOutputStream stream = new BufferedOutputStream(
	                     new FileOutputStream(serverFile));
	            stream.write(bytes);
	            stream.close();
	         //mapList.add(fMap);
	         //sendSysFileName(mapList);
	         listStr.add(sysFileName);
	         } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	      }
	      return listStr;
	   }

	//파일 업로드 메소드	
	//String fullPath="C:/Users/pc/Documents/NOMAD/STEPPE/src/main/webapp/resources/upload/";

	public Map<String,Object> fileUp(MultipartHttpServletRequest multi){
		System.out.println("fileUp");
		//1.저장경로 찾기
		String root=multi.getSession().getServletContext().getRealPath("/");
		System.out.println("root="+root);
		String path=root+"resources/upload/";
		//2.폴더 생성을 꼭 할것...
		File dir=new File(path);
		if(!dir.isDirectory()){  //폴더 없다면
			dir.mkdir();  //폴더 생성
		}
		//3.파일을 가져오기-일태그 이름들 반환
		Iterator<String> files=multi.getFileNames();
		Map<String,Object> fMap=new HashMap<String, Object>();
		while(files.hasNext()){
			String fileTagName=files.next();
			//파일 메모리에 저장
			MultipartFile mf=multi.getFile(fileTagName);
			String oriFileName=mf.getOriginalFilename();
			fMap.put("oriFileName", oriFileName);
			System.out.println("oriFileName="+oriFileName);
			//4.시스템파일이름 생성  a.txt  ==>112323242424.txt
			String sysFileName=System.currentTimeMillis()+"."
					+oriFileName.substring(oriFileName.lastIndexOf(".")+1);
			fMap.put("sysFileName", sysFileName);
			//5.메모리->실제 파일 업로드
			try {
				mf.transferTo(new File(path+sysFileName));
			}catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return fMap;
	}
	public Map<String,String> fileUppr(MultipartHttpServletRequest multi){
		System.out.println("fileUp");
		//1.저장경로 찾기
		String root=multi.getSession().getServletContext().getRealPath("/");
		System.out.println("root="+root);
		String path=root+"resources/upload/";
		//2.폴더 생성을 꼭 할것...
		File dir=new File(path);
		if(!dir.isDirectory()){  //폴더 없다면
			dir.mkdir();  //폴더 생성
		}
		//3.파일을 가져오기-일태그 이름들 반환
		Iterator<String> files=multi.getFileNames();
		Map<String,String> fMap=new HashMap<String, String>();
		while(files.hasNext()){
			String fileTagName=files.next();
			//파일 메모리에 저장
			MultipartFile mf=multi.getFile(fileTagName);
			String oriFileName=mf.getOriginalFilename();
			fMap.put("oriFileName", oriFileName);
			System.out.println("oriFileName="+oriFileName);
			//4.시스템파일이름 생성  a.txt  ==>112323242424.txt
			String sysFileName=System.currentTimeMillis()+"."
					+oriFileName.substring(oriFileName.lastIndexOf(".")+1);
			fMap.put("sysFileName", sysFileName);
			//5.메모리->실제 파일 업로드
			try {
				mf.transferTo(new File(path+sysFileName));
			}catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return fMap;
	}
	//파일 다운로드 메소드
	//파일 삭제 메소드
	
	
}

