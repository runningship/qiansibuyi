package com.bc.qsby.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.bc.sdak.CommonDaoService;
import org.bc.sdak.Page;
import org.bc.sdak.TransactionalServiceHelper;
import org.bc.sdak.utils.JSONHelper;
import org.bc.web.ModelAndView;
import org.bc.web.Module;
import org.bc.web.WebMethod;

import com.bc.qsby.FileUploadServlet;
import com.bc.qsby.ThreadSessionHelper;
import com.bc.qsby.entity.Config;
import com.bc.qsby.entity.HouseImage;
import com.bc.qsby.entity.Product;
import com.bc.qsby.entity.ProductItem;
import com.bc.qsby.util.ConfigHelper;
import com.bc.qsby.util.DataHelper;

@Module(name="/admin/product")
public class ProductService {

	CommonDaoService dao = TransactionalServiceHelper.getTransactionalService(CommonDaoService.class);
	
	@WebMethod
	public ModelAndView edit(Integer id){
		ModelAndView mv = new ModelAndView();
		Product po = dao.get(Product.class, id);
		mv = ConfigHelper.queryItems(mv);
		mv.jspData.put("product", po);
		mv.jspData.put("me", ThreadSessionHelper.getUser());
		return mv;
	}
	
	@WebMethod
	public ModelAndView update(Product product){
		ModelAndView mv = new ModelAndView();
		Product po = dao.get(Product.class, product.id);
		dao.saveOrUpdate(po);
		return mv;
	}
	
	@WebMethod
	public ModelAndView delete(Integer id){
		ModelAndView mv = new ModelAndView();
		Product po = dao.get(Product.class, id);
		if(po!=null){
			dao.delete(po);
		}
		return mv;
	}
	
	@WebMethod
	public ModelAndView deleteItem(Integer id){
		ModelAndView mv = new ModelAndView();
		ProductItem po = dao.get(ProductItem.class, id);
		if(po!=null){
			dao.delete(po);
		}
		return mv;
	}
	
	@WebMethod
	public ModelAndView doSave(Product product){
		ModelAndView mv = new ModelAndView();
		dao.saveOrUpdate(product);
		return mv;
	}
	
	@WebMethod
	public ModelAndView doSaveItem(Integer productId , String color , String size , int count){
		ModelAndView mv = new ModelAndView();
		Product product = dao.get(Product.class, productId);
		for(int i=0;i<count;i++){
			ProductItem item = new ProductItem();
			item.color = color;
			item.size = size;
			item.productId = productId;
			item.productName = product.name;
			dao.saveOrUpdate(item);
		}
		return mv;
	}
	
	@WebMethod
	public ModelAndView listData(Page<Product> page , String name ){
		ModelAndView mv = new ModelAndView();
		StringBuilder hql = new StringBuilder("from Product where 1=1 ");
		List<String> params = new ArrayList<String>();
		if(StringUtils.isNotEmpty(name)){
			hql.append(" and name like ?");
			params.add("%"+name+"%");
		}
		hql.append(" order by id desc");
		page = dao.findPage(page, hql.toString(), params.toArray());
		mv.data.put("page", JSONHelper.toJSON(page , DataHelper.dateSdf.toPattern()));
		return mv;
	}
	
	
	@WebMethod
	public ModelAndView listItemData(Page<ProductItem> page , String name ){
		ModelAndView mv = new ModelAndView();
		StringBuilder hql = new StringBuilder("from ProductItem where 1=1 ");
		List<String> params = new ArrayList<String>();
		if(StringUtils.isNotEmpty(name)){
			hql.append(" and name like ?");
			params.add("%"+name+"%");
		}
		hql.append(" order by id desc");
		page = dao.findPage(page, hql.toString(), params.toArray());
		mv.data.put("page", JSONHelper.toJSON(page , DataHelper.dateSdf.toPattern()));
		return mv;
	}
}
