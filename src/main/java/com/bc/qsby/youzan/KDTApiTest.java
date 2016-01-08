package com.bc.qsby.youzan;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.http.HttpResponse;

/*
 * 这是个例子
 */
public class KDTApiTest {
	
	public static void main(String[] args){
		get();
		//add();
	}
	
	/*
	 * 测试获取单个商品信息
	 */
	private static void get(){
		String method = "kdt.users.weixin.follower.get";
		//String method = "kdt.users.weixin.followers.pull";
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("weixin_openid", "o0ZgAs7FRIbG_I6JR7c0UNBMAd9E");
		//params.put("page_size", "20");
		
		KdtApiClient kdtApiClient;
		HttpResponse response;
		
		try {
			kdtApiClient = new KdtApiClient(GlobalConfig.APP_ID, GlobalConfig.APP_SECRET);
			response = kdtApiClient.get(method, params);
			System.out.println("Response Code : " + response.getStatusLine().getStatusCode());
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
			StringBuffer result = new StringBuffer();
			String line = "";
			while ((line = bufferedReader.readLine()) != null) {
				result.append(line);
			}

			System.out.println(result.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 测试获取添加商品
	 */
	private static void add() {
		String method = "kdt.item.add";
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("price", "999.01");
		params.put("title", "测试商品，请忽略");
		params.put("desc", "这是一个号商铺");
		params.put("is_virtual", "0");
		params.put("post_fee", "0");
		params.put("tag_ids", "10560440");
		params.put("quantity", "123");
//		params.put("cid", "4000000");
		params.put("sku_properties", "");
		params.put("sku_quantities", "");
		params.put("sku_prices", "");
		params.put("sku_outer_ids", "");
		String fileKey = "images[]";
		List<String> filePaths = new ArrayList<String>();
		
		// 图片路径
		filePaths.add("C:\\Users\\cm\\Desktop\\demo1.png");
		filePaths.add("C:\\Users\\cm\\Desktop\\demo2.png");
		
		KdtApiClient kdtApiClient;
		HttpResponse response;
		
		try {
			kdtApiClient = new KdtApiClient(GlobalConfig.APP_ID, GlobalConfig.APP_SECRET);
			response = kdtApiClient.post(method, params, filePaths, fileKey);
			System.out.println("Response Code : " + response.getStatusLine().getStatusCode());
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
			StringBuffer result = new StringBuffer();
			String line = "";
			while ((line = bufferedReader.readLine()) != null) {
				result.append(line);
			}

			System.out.println(result.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
