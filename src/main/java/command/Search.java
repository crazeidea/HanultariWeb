package command;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class Search {
	public static String search(String query) {

        String clientId = "M2YtvrWQFuOcIa8ZXgz_";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "kvHqtbGzZB";//애플리케이션 클라이언트 시크릿값";
        
        
        try {
            String keyword = URLEncoder.encode(query, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/local?display=5&sort=random&query=" + keyword;

            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println("code:"+responseCode + ":" + response.toString());
            return response.toString();
        } catch (Exception e) {
            System.out.println(e);
        }
        return "";
    }
}
