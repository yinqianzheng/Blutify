package com.blue.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;


public class Scrobble {
	
	private static final String USER_AGENT = "Mozilla/5.0";
	String url = "https://freemusicarchive.org/api/get/"; //tracks.json?api_key=CFEFES9JPKBN4T7H&track_id=12800";
	String apiKey = "api_key=CFEFES9JPKBN4T7H";
	String charset = "UTF-8";
	String query;
//	String curators = "curators";
//	String artists = "artists";
//	String albums = "albums";
//	String tracks = "tracks";
	
	public Scrobble() {
		// TODO Auto-generated constructor stub
	}
	
	public JSONObject send(String datasets, String param) throws MalformedURLException, IOException {
		this.query = datasets + "?" + this.apiKey + "&" + param;
		HttpURLConnection con = (HttpURLConnection) new URL(url + this.query).openConnection();
		con.setRequestProperty("User-Agent", USER_AGENT);
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		if (responseCode == HttpURLConnection.HTTP_OK) {
			String result = convertStreamToString(con.getInputStream());
			return XML.toJSONObject(result);
		} else {
			return null;
		}
	}
	
	public String convertStreamToString(InputStream is) throws IOException {
		if (is != null) {
            Writer writer = new StringWriter();

            char[] buffer = new char[1024];
            try {
                Reader reader = new BufferedReader(
                        new InputStreamReader(is, "UTF-8"));
                int n;
                while ((n = reader.read(buffer)) != -1) {
                    writer.write(buffer, 0, n);
                }
            } finally {
                is.close();
            }
            return writer.toString();
        }
        return "";       
	}
	
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getApiKey() {
		return apiKey;
	}

	public void setApiKey(String apiKey) {
		this.apiKey = apiKey;
	}

	public String getCharset() {
		return charset;
	}

	public void setCharset(String charset) {
		this.charset = charset;
	}

	public JSONObject findAlbumsByArtistId(int id) throws MalformedURLException, IOException {
		return this.send("albums.xml", "artist_id=" + String.valueOf(id));
	}
	
	public JSONObject findArtist(int id) throws MalformedURLException, IOException {
		return this.send("artists.xml", "artist_id=" + String.valueOf(id));
	}
	
	public String getArtistName(JSONObject dataset) {
		return 	(String) dataset.get("artist_name");
	}
	
	public String getArtistBio(JSONObject dataset) {
		String bio = (String) dataset.get("artist_bio");
		if (bio.length()>=7) {
			bio = bio.substring(3, bio.length()-4);
		}
		return 	bio + "\n\n" + (String) dataset.get("artist_related_projects");
	}
	
	
	public String getArtistImageUrl(JSONObject dataset) {
		return 	(String) dataset.get("artist_image_file");
	}
	
	public int getTotal(JSONObject json) {
		return (int) ((JSONObject)json.get("data")).get("total");
	}
	
	public Object getDataSet(JSONObject json) {
		return ((JSONObject)((JSONObject)json.get("data")).get("dataset")).get("value");
	}

	public JSONObject findTracksByAlbumId(int id) throws MalformedURLException, IOException {
		return this.send("tracks.xml", "album_id=" + String.valueOf(id));
	}

}
