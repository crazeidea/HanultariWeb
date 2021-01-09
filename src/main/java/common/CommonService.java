package common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.HtmlEmail;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;



@Service
public class CommonService {
	//
	public String json_list( String list) {
		JSONObject json = new JSONObject(list);
		json = (JSONObject) json.get("response");
		json = (JSONObject) json.get("body");
		int count = json.has("totalCount") ? json.getInt("totalCount") : 0;
		
		if(json.get("items") instanceof JSONObject)
			json = (JSONObject) json.get("items");
		
		json.put("count", count);
		
		return json.toString();
	}
	
	public void htmlSend(String email, String name, HttpSession session) {
		HtmlEmail mail = new HtmlEmail();
		
		mail.setCharset("utf-8");
		mail.setDebug(true);
		
		mail.setHostName("smtp.naver.com");
		mail.setAuthentication("it-study", "It-Study!");
		mail.setSSLOnConnect(true);
		
		try {
			mail.setFrom("it-study@naver.com", "한울관리자");  //보내는이 지정
			mail.addTo(email, name); //메일 받을사람 지정
			mail.setSubject("한울 IoT 과정"); //제목쓰기
			//내용쓰기
			StringBuffer msg = new StringBuffer();
			msg.append("<html>");
			msg.append("<body>");
			msg.append("<a href='https://blog.mybatis.org'><img src='https://3.bp.blogspot.com/-HKtWXLIvvdk/T6VWCexS-qI/AAAAAAAAATo/QmRUDiFjWd0/s1600/mybatis-superbird-small.png' /></a>");
			msg.append("<hr>");
			msg.append("<h3>한울 IoT과정 가입축하 메일</h3>");
			msg.append("<p>축하합니다~</p>");
			msg.append("<p>프로젝트까지 마무리하고 취업에 성공하시길 바랍니다~</p>");
			msg.append("</body>");
			msg.append("</html>");
			mail.setHtmlMsg(msg.toString());
		
			EmailAttachment file = new EmailAttachment();
			file.setPath(session.getServletContext().getRealPath("resources")
							+ "/css/common.css"); //첨부파일 선택하기
			mail.attach(file); //파일첨부하기버튼 클릭
			
			mail.send(); //메일보내기버튼 클릭
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	//파일다운로드
	public File download(String filename, String filepath, HttpSession session, HttpServletResponse response) {
		
		File file = new File(session.getServletContext().getRealPath("resources") + "/" + filepath);
		String mime = session.getServletContext().getMimeType(filename);
		response.setContentType(mime);
		
		try {
			filename = URLEncoder.encode(filename, "utf-8").replaceAll("\\+", "%20");
			response.setHeader("content-disposition", "attachment; filename=" + filename);
			ServletOutputStream out = response.getOutputStream();
			FileCopyUtils.copy(new FileInputStream(file), out);
			out.flush();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return file;
	}
	
	//파일업로드
	public String upload(String category, MultipartFile file, HttpSession session) {
		String resources = session.getServletContext().getRealPath("resources");
		String upload = resources + "/upload";
		
		String folder = upload + "/" + category + "/" + new SimpleDateFormat("yyyy/MM/dd").format(new Date());
		File dir = new File(folder);
		if(!dir.exists()) dir.mkdirs();
		
		String uuid = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		try {
			file.transferTo(new File(folder, uuid));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return folder.substring(resources.length()+1) + "/" + uuid;
	}
	
	//requestAPI2
	public String requestAPI(StringBuffer url, String property) {
		String result = "";
		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(url.toString()).openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			conn.setRequestProperty("Authorization", property);
			
			BufferedReader reader;
			if (conn.getResponseCode()>=200 && conn.getResponseCode()<=300) {
				reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			} else {
				reader = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"));
			}
			
			url = new StringBuffer();
			while((result = reader.readLine()) != null) {
				url.append(result);
			}
			reader.close();
			conn.disconnect();
			result = url.toString();
			System.out.println(result);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	//requestAPI1
	public String requestAPI(StringBuffer url) {
		String result = "";
		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(url.toString()).openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			
			BufferedReader reader;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <=300) {
				reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			}else {
				reader = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"));
			}
			
			url = new StringBuffer();
			while ((result = reader.readLine()) != null) {
				url.append(result);
			}
			reader.close();
			conn.disconnect();
			result = url.toString();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

}
