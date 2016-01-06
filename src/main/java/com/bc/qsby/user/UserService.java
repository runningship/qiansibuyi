package com.bc.qsby.user;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.bc.sdak.CommonDaoService;
import org.bc.sdak.GException;
import org.bc.sdak.TransactionalServiceHelper;
import org.bc.sdak.utils.LogUtil;
import org.bc.web.ModelAndView;
import org.bc.web.Module;
import org.bc.web.PlatformExceptionType;
import org.bc.web.ThreadSession;
import org.bc.web.WebMethod;

import com.bc.qsby.ThreadSessionHelper;
import com.bc.qsby.entity.User;
import com.bc.qsby.util.SecurityHelper;

@Module(name="/admin/user")
public class UserService {
	CommonDaoService dao = TransactionalServiceHelper.getTransactionalService(CommonDaoService.class);
	
	@WebMethod
	public ModelAndView login(User user , String yzm){
		ModelAndView mv = new ModelAndView();
		LogUtil.info("username:"+user.tel+",password="+user.pwd);
		User po = null;
		yzm = yzm.replace(String.valueOf((char)8198), "");
		po = loginAsAdmin(user);
		ThreadSession.getHttpSession().setAttribute("user", po);
		return mv;
	}
	public User loginAsAdmin(User user){
		String pwd = SecurityHelper.Md5(user.pwd);
		User po = dao.getUniqueByParams(User.class, new String[]{"account" , "pwd"}, new Object[]{user.account  , pwd});
		if(po==null){
			throw new GException(PlatformExceptionType.BusinessException,"用户名或密码不正确。");
		}
		return po;
	}
	
	@WebMethod
	public ModelAndView logout(){
		ModelAndView mv = new ModelAndView();
		ThreadSession.getHttpSession().removeAttribute("user");
		mv.redirect="../login.jsp";
		return mv;
	}
	
	@WebMethod
	public ModelAndView modifyPwd(String oldPwd,String newPwd){
		ModelAndView mv = new ModelAndView();
		User me = ThreadSessionHelper.getUser();
		User po = dao.get(User.class, me.id);
		if(!po.pwd.equals(SecurityHelper.Md5(oldPwd))){
			throw new GException(PlatformExceptionType.BusinessException,"原密码不正确。");
		}
		po.pwd = SecurityHelper.Md5(newPwd);
		dao.saveOrUpdate(po);
		return mv;
	}
	
	@WebMethod
	public ModelAndView updateAdmin(User admin){
		ModelAndView mv = new ModelAndView();
		User po = dao.get(User.class, admin.id);
		po.account = admin.account;
		po.role = admin.role;
		po.tel = admin.tel;
		po.email = admin.email;
		dao.saveOrUpdate(po);
		User me = ThreadSessionHelper.getUser();
		if(me.id.equals(po.id)){
			//更新session
			ThreadSession.getHttpSession().setAttribute("user", po);
		}
		return mv;
	}
	
	
	@WebMethod
	public ModelAndView doSave(User user){
		ModelAndView mv = new ModelAndView();
		user.pwd = SecurityHelper.Md5(user.pwd);
		if(StringUtils.isEmpty(user.tel)){
			throw new GException(PlatformExceptionType.BusinessException,"电话号码不能为空");
		}
		//经纪人
		user.addtime = new Date();
		dao.saveOrUpdate(user);
		return mv;
	}
	
	
	@WebMethod
	public ModelAndView delete(Integer id){
		ModelAndView mv = new ModelAndView();
		User po = dao.get(User.class, id);
		if(po!=null){
			dao.delete(po);
		}
		return mv;
	}
	
	@WebMethod
	public ModelAndView toggleShenHe(Integer id){
		ModelAndView mv = new ModelAndView();
		User po = dao.get(User.class, id);
		if(po.valid==1){
			po.valid = 0 ;
		}else{
			po.valid =1;
		}
		dao.saveOrUpdate(po);
		return mv;
	}
}
