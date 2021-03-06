package _02_controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import _01_member.model.MemberBean;
import _02_model.Bean.ActivityBean;
import _02_model.Bean.ActivityDetailBean;
import _02_model.service.ActivityDetailService;
import _02_model.service.ActivityService;
import _02_spring.SqlDateEditor;

@Controller
@SessionAttributes(names = { "soloDetail"})
public class Activity_Controller {
	@Autowired
	private ActivityService activityService;
	@Autowired
	private ActivityDetailService activityDetailService;

	@InitBinder
	public void init(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(Integer.class, new CustomNumberEditor(Integer.class, true));
		// SqlDateEditor為自己改寫CustomDateEditor可以把字串轉sql.Date格式
		webDataBinder.registerCustomEditor(java.util.Date.class,
				new SqlDateEditor(new SimpleDateFormat("yyyy-MM-dd"), false));
	}

	@RequestMapping(path = { "/_02_activity/ActivityController.do" }, method = { RequestMethod.POST,
			RequestMethod.GET })
	public String xxx(@SessionAttribute(name = "member") MemberBean member, ActivityBean bean,
			ActivityDetailBean detailBean, BindingResult bindingResult, Model model, String doWhat,
			HttpServletRequest request,HttpServletResponse response,String longitude_temp,String latitude_temp,String actDetail_up,
			String new_times,String new_kinds,String new_note,String new_budget,String new_dates,String new_longitude_temp,String new_latitude_temp) throws IllegalStateException, IOException {
		
		
		// 代表是從schedule.jsp進來
		if ("schedule".equals(doWhat)) {
			if(bean.getActTitle().isEmpty()||bean.getActTitle().trim().length()==0) {
				System.out.println("標題沒輸入");
			}else {
				System.out.println("有輸入標題"+bean.getActTitle());
			}
			
			
			// 目前行程總覽部分不檢查 把剛輸入的參數存起來(還沒存進資料庫 要等全部都正確 一次一起insert進去) 直接導向細節頁面
			model.addAttribute("activityBean", bean);
			
			System.out.println("現在在schedule");
			CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
					request.getSession().getServletContext());
			if(multipartResolver.isMultipart(request)) {
				MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;	
				
				MultipartFile file=multiRequest.getFile("file");
				if(file.isEmpty()) {
					System.out.println("檔案是空的");
				}else {
					System.out.println("有傳檔案");
					ServletContext context=request.getServletContext();
					String filename=file.getOriginalFilename();
					//要存到資料庫的路徑
					String showPic="/uploadFile/"+filename;
					Cookie picPath=new Cookie("picPath",showPic);
					bean.setPhotoPath(showPic);
					picPath.setMaxAge(60*60);
					
					response.addCookie(picPath);
					
					String path=context.getRealPath("/uploadFile/"+filename);
					System.out.println("路徑"+path);
					file.transferTo(new File(path));
				}
			}			
			return "actDetail";
		} // 代表從actDetail.jsp進來
		else if ("detail".equals(doWhat)) {
			System.out.println("現在在細節 路徑為:"+bean.getPhotoPath());
			//測試
			System.out.println("觀察進來的latlan");
			System.out.println("lat:"+latitude_temp);
			System.out.println("lan:"+longitude_temp);
			
			CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
					request.getSession().getServletContext());
			if(multipartResolver.isMultipart(request)) {
				MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;	
				
				MultipartFile file=multiRequest.getFile("file");
				if(file.isEmpty()) {
					System.out.println("檔案是空的");
				}else {
					System.out.println("有傳檔案");
					ServletContext context=request.getServletContext();
					String filename=file.getOriginalFilename();
					//要存到資料庫的路徑
					String showPic="/uploadFile/"+filename;
					Cookie picPath=new Cookie("picPath",showPic);
					bean.setPhotoPath(showPic);
					picPath.setMaxAge(60*60);
					
					response.addCookie(picPath);
					
					String path=context.getRealPath("/uploadFile/"+filename);
					System.out.println("路徑"+path);
					file.transferTo(new File(path));
				}
			}		
			
			
			
			// 呼叫自己寫的方法 把多的細節拆開
			List<ActivityDetailBean> list = Activity_Controller.Detail_split(detailBean);
			//接著處理經緯度
			String[] lan=longitude_temp.split(",");
			String[] lat=latitude_temp.split(",");
			for(int i=0;i<list.size();i++) {
				//設定緯度 把字串轉換成浮點數
				list.get(i).setLatitude(Double.valueOf(lat[i]));
				//設定經度 把字串轉換成浮點數
				list.get(i).setLongitude((Double.valueOf(lan[i])));
			}
			
			//test
			System.out.println("觀察是否放進bean中");
			for(ActivityDetailBean i:list)
			System.out.println(i);
			
			
			Cookie[] cookies=request.getCookies();
			for(Cookie i:cookies) {
				if("picPath".equals(i.getName())) {
					String path=i.getValue();
					bean.setPhotoPath(path);
					break;
				}		
			}
			//
			// //判斷各項資料有無問題 如果有問題不能進入model部分
			// //(尚未填寫)
			//
			//
			// 資料都沒問題一次全部存進資料庫
			bean.setEmail(member.getMemberemail());
			System.out.println("準備新增行程總覽" + bean);
			Integer pk = activityService.Create_Schedule(bean);
			// 新增完行程總覽後 得到的主key 塞入細節中
			for (int k = 0; k < list.size(); k++) {
				list.get(k).setActivityID(pk);
			}
			activityDetailService.insert(list);
			// 新增成功後要回會員頁面 要呈現會員已建立的所有行程
			List<ActivityBean> Member_activity = activityService.Schedule(member.getMemberemail());

			// 放入request中
			model.addAttribute("allSchedule", Member_activity);
			System.out.println("總共有" + Member_activity.size() + "項");
			return "display";
		}
		else if ("single".equals(doWhat)) {
			// 尚未檢查錯誤
			ActivityBean soloBean = activityService.solo_select(bean.getActivityID());
			model.addAttribute("soloBean", soloBean);
			Set<ActivityDetailBean> soloDetail = soloBean.getActivityDetails();
			// 用session儲存 方便之後使用
			model.addAttribute("soloDetail", soloDetail);

			// 進入單獨行程頁面
			return "up_soloPage";
		}else if ("update".equals(doWhat)) {
			//list_up 是原本就有的資料 要做更新
			List<ActivityDetailBean> list_up=Detail_split(detailBean);
			String[] lan=longitude_temp.split(",");
			String[] lat=latitude_temp.split(",");
			String[] detail=actDetail_up.split(",");
			for(int i=0;i<list_up.size();i++) {
				list_up.get(i).setLatitude(Double.valueOf(lat[i]));
				list_up.get(i).setLongitude((Double.valueOf(lan[i])));
				list_up.get(i).setActDetail(Integer.valueOf(detail[i]));
				list_up.get(i).setActivityID(bean.getActivityID());
			}
			
			//這邊要處理新增部分
			System.out.println("觀察 新增的細節");
			System.out.println(new_times+" : "+new_kinds+" : "+new_note+" : "+new_budget+" : "+new_dates+" : "+new_longitude_temp+" : "+new_latitude_temp);
			
			ActivityDetailBean temp=new ActivityDetailBean();
			temp.setTimes(new_times);
			temp.setKinds(new_kinds);
			temp.setNote(new_note);
			temp.setBudget(new_budget);
			temp.setDates(new_dates);
			temp.setLatitude(Double.valueOf(new_latitude_temp));
			temp.setLongitude((Double.valueOf(new_longitude_temp)));
			temp.setActivityID(bean.getActivityID());
			List<ActivityDetailBean> tempList=new ArrayList<ActivityDetailBean>();
			//System.out.println("新的detailBean"+temp);
			
			tempList.add(temp);
			
			
			// 要判斷如果有新增細節還要做 insert
			activityService.Change_Schedule(bean);
			activityDetailService.Allupdate(list_up);
			activityDetailService.insert(tempList);

			return "display";

		}else if("showPage".equals(doWhat)) {
			System.out.println("test");
			System.out.println("號碼為:"+bean.getActivityID());
			model.addAttribute("pk",bean.getActivityID());
			return "sw_soloPage";
			
			
		}

		return "actDetail";
	}
	
	@RequestMapping(path= {"/_02_activity/show.controller"},method= {RequestMethod.GET},produces = { "application/json;charset=UTF-8" })	
	@ResponseBody
	public List<ActivityBean> displayPage(@SessionAttribute(name="member")MemberBean member) {
		
		List<ActivityBean> list=activityService.Schedule(member.getMemberemail());
		 return list;
	
	}
	
	@RequestMapping(path= {"/_02_activity/delete.controller"},method= {RequestMethod.GET},produces = { "application/json;charset=UTF-8" })	
	@ResponseBody
	public String delete(@SessionAttribute(name="member")MemberBean member,String ActivityID) {
		Integer actID=Integer.valueOf(ActivityID);
		return "刪除結果:"+activityService.Delete_Schedule(actID);	
	}
	
	@RequestMapping(path= {"/_02_activity/solopage_show.controller"},method= {RequestMethod.GET},produces = { "application/json;charset=UTF-8" })	
	@ResponseBody
	public Map solopage_show(String activityID) {
		
		//步驟1 先把pk從字串轉乘Integer
		if(activityID.isEmpty()||activityID.trim().length()==0) {
			//代表有錯誤 要跳回原頁面
		}
		Integer pk=Integer.valueOf(activityID);
		ActivityBean test=activityService.solo_select(pk);
		System.out.println("觀察抓到的行程");
		System.out.println(test);
		Set<ActivityDetailBean> detail=test.getActivityDetails();
		Iterator ite=detail.iterator();
		System.out.println("測試抓到的細節部分");
		while(ite.hasNext()) {
			System.out.println(ite.next());
		}
		
		//步驟2 利用這個pk去資料庫撈資料
	
		Map<String,Object> map=new HashMap();
	
		map.put("actBean",test);
		map.put("detailBean",detail);	
		return map;
	}
	
	@RequestMapping(path= {"/_02_activity/update_page.do"},method= {RequestMethod.GET},produces = { "application/json;charset=UTF-8" })	
	@ResponseBody
	public Map<String,Object> update_page(String activityID) {
		Map<String,Object> map=new HashMap<String,Object>();
		ActivityBean actBean=activityService.solo_select(new Integer(activityID));
		map.put("actBean",actBean);
		
		
		List<ActivityDetailBean> detailBean=activityDetailService.showALL(new Integer(activityID));	
		map.put("detailBean",detailBean);
		//第一步驟 先取得最大天數
		Integer maxDay=new Integer(detailBean.get((detailBean.size()-1)).getDates());
		
		//第二步 把相同天數的放一起 分類
		//int count=1;
		List<List<ActivityDetailBean>> superList=new ArrayList<List<ActivityDetailBean>>();
		while(maxDay>=1) {
			List<ActivityDetailBean> templist=new ArrayList<ActivityDetailBean>();
			for(ActivityDetailBean i:detailBean) {
				if(maxDay.equals(new Integer(i.getDates()))) {
					templist.add(i);
				}			
			}
			superList.add(0,templist);;	
			maxDay--;
		}
		map.put("superList",superList);
		//這邊要做兩個部分一個是取出activityBean (easy)
		//另一個是要取出此ID的所有行程細節 並且用date排序
		return map;

	}
	

	public static List<ActivityDetailBean> Detail_split(ActivityDetailBean detailBean) {
		List<ActivityDetailBean> list = new ArrayList<ActivityDetailBean>();
		
		String[] kinds = detailBean.getKinds().split(",");
		String[] note = detailBean.getNote().split(",");
		String[] budgets = detailBean.getBudget().split(",");
		String[] dates = detailBean.getDates().split(",");
		String[] times = detailBean.getTimes().split(",");
		

		for (int i = 0; i < kinds.length; i++) {
			ActivityDetailBean temp = new ActivityDetailBean();
			temp.setTimes(times[i]);
			temp.setKinds(kinds[i]);
			temp.setNote(note[i]);
			temp.setBudget(budgets[i]);
			temp.setDates(dates[i]);
			list.add(temp);
		}
		return list;
	}


}
