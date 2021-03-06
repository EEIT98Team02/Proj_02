package _00_proj02Bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Favorites")
public class FavoritesBean implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer pk;
	private Date targetDate=new Date(0); 
	private String eventName;
	private Date dtStart;
	private Date durationEnd;
    private String email;
	private Integer eventID;
	private Date timeStart;
	public Integer getPk() {
		return pk;
	}
	public void setPk(Integer pk) {
		this.pk = pk;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getEventID() {
		return eventID;
	}
	public void setEventID(Integer eventID) {
		this.eventID = eventID;
	}

	public Date getTimeStart() {
		return timeStart;
	}
	public void setTimeStart(Date timeStart) {
		this.timeStart = timeStart;
	}

	public Date getTargetDate() {
		return targetDate;
	}
	public void setTargetDate(Date targetDate) {
		this.targetDate = targetDate;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public Date getDtStart() {
		return dtStart;
	}
	public void setDtStart(Date dtStart) {
		this.dtStart = dtStart;
	}
	public Date getDurationEnd() {
		return durationEnd;
	}
	public void setDurationEnd(Date durationEnd) {
		this.durationEnd = durationEnd;
	}
	
	@Override
	public String toString() {
		return "FavoritesBean [pk=" + pk + ", targetDate=" + targetDate + ", eventName=" + eventName + ", dtStart="
				+ dtStart + ", durationEnd=" + durationEnd + ", email=" + email + ", eventID=" + eventID
				+ ", timeStart=" + timeStart + "]";
	}
	

	
	

}
