package _01_member.model;

import java.sql.Blob;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@Entity
@Table(name="members")
public class MemberBean {
	
	@ManyToMany
	@JoinTable(
			name="LIKETYPES",
			joinColumns= {@JoinColumn(name="MEMBEREMAIL")},
			inverseJoinColumns= {@JoinColumn(name="TYPE")})
	private Set<EventsBean> events;
	public Set<EventsBean> getEvents() {
		return events;
	}
	public void setEvents(Set<EventsBean> events) {
		this.events = events;
	}
	
	@ManyToMany
	@JoinTable(
			name="LIKEREGIONS",
			joinColumns= {@JoinColumn(name="MEMBEREMAIL")},
			inverseJoinColumns= {@JoinColumn(name="region")})
	private Set<RegionsBean> regions;
	public Set<RegionsBean> getRegions() {
		return regions;
	}
	public void setRegions(Set<RegionsBean> regions) {
		this.regions = regions;
	}

	//	@GeneratedValue(strategy=GenerationType.IDENTITY)
//	private int memberid;
	@Id
	private String memberemail;
	private String memberpassword;
	private String membernickname;
	private String membergender;
	private java.util.Date memberbdate;
	private Blob memberphoto;
	private String memberepaper;
	private String membertype;
	private String memberrole;

@Override
	public String toString() {
		return "MemberBean [memberemail=" + memberemail + ", memberpassword=" + memberpassword + ", membernickname="
				+ membernickname + ", membergender=" + membergender + ", memberbdate=" + memberbdate + ", memberphoto="
				+ memberphoto + ", memberepaper=" + memberepaper + ", membertype=" + membertype + ", memberrole="
				+ memberrole + "]";
	}
	//	public int getMemberid() {
//		return memberid;
//	}
//	public void setMemberid(int memberid) {
//		this.memberid = memberid;
//	}
	public String getMemberemail() {
		return memberemail;
	}
	public void setMemberemail(String memberemail) {
		this.memberemail = memberemail;
	}
	public String getMemberpassword() {
		return memberpassword;
	}
	public void setMemberpassword(String memberpassword) {
		this.memberpassword = memberpassword;
	}
	public String getMembernickname() {
		return membernickname;
	}
	public void setMembernickname(String membernickname) {
		this.membernickname = membernickname;
	}
	public String getMembergender() {
		return membergender;
	}
	public void setMembergender(String membergender) {
		this.membergender = membergender;
	}
	public java.util.Date getMemberbdate() {
		return memberbdate;
	}
	public void setMemberbdate(java.util.Date memberbdate) {
		this.memberbdate = memberbdate;
	}
	public Blob getMemberphoto() {
		return memberphoto;
	}
	public void setMemberphoto(Blob memberphoto) {
		this.memberphoto = memberphoto;
	}
	public String getMemberepaper() {
		return memberepaper;
	}
	public void setMemberepaper(String memberepaper) {
		this.memberepaper = memberepaper;
	}
	public String getMembertype() {
		return membertype;
	}
	public void setMembertype(String membertype) {
		this.membertype = membertype;
	}
	public String getMemberrole() {
		return memberrole;
	}
	public void setMemberrole(String memberrole) {
		this.memberrole = memberrole;
	}
	
	public static void main(String[] args) {

		ApplicationContext context= new ClassPathXmlApplicationContext("beans.config.xml");
		SessionFactory sessionfactory = (SessionFactory) context.getBean("sessionFactory");
		
		Session session=sessionfactory.getCurrentSession();
		session.beginTransaction();
		
		MemberBean bean=session.get(MemberBean.class, "aaa@gmail.com");
		System.out.println(bean);
		
		Set<EventsBean> events=bean.getEvents();
		for(EventsBean u: events) {
			u.getMembers().remove(bean);
		}
//		System.out.println(events);
//		
//		Set<RegionsBean> regions=bean.getRegions();
//		System.out.println(regions);
		
		
		session.getTransaction().commit();
		((ConfigurableApplicationContext)context).close();
		
	}
	
}