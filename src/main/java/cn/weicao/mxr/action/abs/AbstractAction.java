package cn.weicao.mxr.action.abs;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.context.MessageSource;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

public class AbstractAction {
	@Resource
	protected MessageSource messageSource ;
	/**
	 * 当前登录人
	 * @return 当前登录人编号
 	 */
	public String loginMid() {
		return (String)SecurityUtils.getSubject().getPrincipal() ;
	}
	/**
	 * 拆分后转为Set集合
	 * @param str
	 * @return
	 */
	public Set<Long> stringToLong(String str) {
		String num [] = str.split(",") ;
		return this.stringToLong(num) ; 
	}
	/**
	 * 设置提示信息
	 * @param mav
	 * @param urlKey
	 * @param msgKey
	 * @param msgs
	 */
	public void setMsgAndUrl(ModelAndView mav,String urlKey,String msgKey,String ... msgs) {
		mav.addObject("url", this.getPage(urlKey)) ;
		mav.addObject("msg",this.getMessage(msgKey,msgs)) ;
	} 
	/**
	 * 负责创建上传文件的名称
	 * @param file
	 * @return
	 */
	public String getNewFileName(MultipartFile file) {
		String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		String fileName = UUID.randomUUID() + fileExt;
		return fileName ;
	}
	/**
	 * 可以将数组变为Set集合
	 * @param num
	 * @return
	 */
	public Set<Long> longToSet(long num[]) {
		Set<Long> all = new HashSet<Long>() ;
		for (int x = 0 ; x < num.length ; x ++) {
			all.add(num[x]) ;
		}
		return all ;
	}
	public Set<Long> stringToLong(String num[]) {
		Set<Long> all = new HashSet<Long>() ;
		for (int x = 0 ; x < num.length ; x ++) {
			try {
				all.add(Long.parseLong(num[x])) ;
			} catch (Exception e) {}
		}
		return all ;
	}
	/**
	 * 该方法的主要功能是根据指定的key获得资源文件中对应的内容
	 * @param key 要执行的跳转路径key
	 * @return 返回路径
	 */
	public String getPage(String key) {
		try {
			return this.messageSource.getMessage(key, null, null) ;
		} catch (Exception e) {
			this.getRequest().setAttribute("errors", "NoPath"); 
			return this.messageSource.getMessage("error.page", null,null) ;
		}
	}
	/**
	 * 获得提示文字信息
	 * @param key 要执行的跳转路径key
	 * @return 返回路径
	 */
	public String getMessage(String key,String ... args) {
		try {
			return this.messageSource.getMessage(key, args, null) ;
		} catch (Exception e) {
			return null ;
		}
	}
	/**
	 * 取得HttpServletRequest对象
	 * @return HttpServletRequest对象
	 */
	public HttpServletRequest getRequest() {
		return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest() ;
 	}
	/**
	 * 取得HttpServletResponse对象
	 * @return HttpServletResponse对象
	 */
	public HttpServletResponse getResponse() {
		return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getResponse() ;
 	}
	/**
	 * 实现信息输出
	 * @param obj 要输出的信息内容
	 */
	public void print(Object obj) {
		try {
			this.getResponse().setCharacterEncoding("UTF-8");
			this.getResponse().getWriter().print(obj);
		} catch (IOException e) {}
	}
}
