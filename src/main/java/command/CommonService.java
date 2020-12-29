package command;

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

import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;



@Service
public class CommonService {
	
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
