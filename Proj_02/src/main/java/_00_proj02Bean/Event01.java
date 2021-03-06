package _00_proj02Bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="event01")
public class Event01 {
	
	
	public Event01(Integer eventID, String eventName, String showGroupName, String eventTypeId,
			Date durationStart, Date durationEnd, String isCharge, String fee, String shoppingUrl,
			String contactName, String contactTel, String contactFax, String briefIntroduction,
			String vcontent, String eventUrl, String youTubeUrl, String imageFile,
			String logoimageFile, Date insertTime, Date dtStart, Date dtEnd, Date timeStart, Integer overTime,
			String location, String cityId, String areaId, String address, String longitude,
			String latitude) {
		super();
		this.eventID = eventID;
		this.eventName = eventName;
		this.showGroupName = showGroupName;
		this.eventTypeId = eventTypeId;
		this.durationStart = durationStart;
		this.durationEnd = durationEnd;
		this.isCharge = isCharge;
		this.fee = fee;
		this.shoppingUrl = shoppingUrl;
		this.contactName = contactName;
		this.contactTel = contactTel;
		this.contactFax = contactFax;
		this.briefIntroduction = briefIntroduction;
		this.vcontent = vcontent;
		this.eventUrl = eventUrl;
		this.youTubeUrl = youTubeUrl;
		this.imageFile = imageFile;
		this.logoimageFile = logoimageFile;
		this.insertTime = insertTime;
		this.dtStart = dtStart;
		this.dtEnd = dtEnd;
		this.timeStart = timeStart;
		
		this.location = location;
		this.cityId = cityId;
		this.areaId = areaId;
		this.address = address;
		this.longitude = longitude;
		this.latitude = latitude;
	}
	
	
	
	@Id
	private Integer eventID;
	private String eventName;
	private String showGroupName;
	private String eventTypeId;
	private Date durationStart;
	private Date durationEnd;
	private String isCharge;
	private String fee;
	private String shoppingUrl;
	private String contactName;
	private String contactTel;
	private String contactFax;
	private String briefIntroduction;
	private String vcontent;
	private String eventUrl;
	private String youTubeUrl;
	private String imageFile;
	private String logoimageFile;
	private Date insertTime;
	private Date dtStart;
	private Date dtEnd;
	private Date timeStart;
	private String location;
	private String cityId;
	private String areaId;
	private String address;
	private String longitude;
	private String latitude;
	private Integer collectionCount;
	private Integer shareCount;
	private Integer isBlock;
	
	public String getImageFile() {
		return imageFile;
	}

	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}

	public Integer getCollectionCount() {
		return collectionCount;
	}

	public void setCollectionCount(Integer collectionCount) {
		this.collectionCount = collectionCount;
	}

	public Integer getShareCount() {
		return shareCount;
	}

	public void setShareCount(Integer shareCount) {
		this.shareCount = shareCount;
	}

	public Integer getIsBlock() {
		return isBlock;
	}

	public void setIsBlock(Integer isBlock) {
		this.isBlock = isBlock;
	}

	public Event01() {
		super();
	}

	public Event01(String eventType) {
		super();
	}

	public Integer getEventID() {
		return eventID;
	}

	public void setEventID(Integer eventID) {
		this.eventID = eventID;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getShowGroupName() {
		return showGroupName;
	}

	public void setShowGroupName(String showGroupName) {
		this.showGroupName = showGroupName;
	}

	public String getEventTypeId() {
		return eventTypeId;
	}

	public void setEventTypeId(String eventTypeId) {
		this.eventTypeId = eventTypeId;
	}

	public Date getDurationStart() {
		return durationStart;
	}

	public void setDurationStart(Date durationStart) {
		this.durationStart = durationStart;
	}

	public Date getDurationEnd() {
		return durationEnd;
	}

	public void setDurationEnd(Date durationEnd) {
		this.durationEnd = durationEnd;
	}

	public String getIsCharge() {
		return isCharge;
	}

	public void setIsCharge(String isCharge) {
		this.isCharge = isCharge;
	}

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

	public String getShoppingUrl() {
		return shoppingUrl;
	}

	public void setShoppingUrl(String shoppingUrl) {
		this.shoppingUrl = shoppingUrl;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactTel() {
		return contactTel;
	}

	public void setContactTel(String contactTel) {
		this.contactTel = contactTel;
	}

	public String getContactFax() {
		return contactFax;
	}

	public void setContactFax(String contactFax) {
		this.contactFax = contactFax;
	}

	public String getBriefIntroduction() {
		return briefIntroduction;
	}

	public void setBriefIntroduction(String briefIntroduction) {
		this.briefIntroduction = briefIntroduction;
	}

	public String getVcontent() {
		return vcontent;
	}

	public void setVcontent(String vcontent) {
		this.vcontent = vcontent;
	}

	public String getEventUrl() {
		return eventUrl;
	}

	public void setEventUrl(String eventUrl) {
		this.eventUrl = eventUrl;
	}

	public String getYouTubeUrl() {
		return youTubeUrl;
	}

	public void setYouTubeUrl(String youTubeUrl) {
		this.youTubeUrl = youTubeUrl;
	}

	public String getLogoimageFile() {
		return logoimageFile;
	}

	public void setLogoimageFile(String logoimageFile) {
		this.logoimageFile = logoimageFile;
	}

	public Date getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}

	public Date getDtStart() {
		return dtStart;
	}

	public void setDtStart(Date dtStart) {
		this.dtStart = dtStart;
	}

	public Date getDtEnd() {
		return dtEnd;
	}

	public void setDtEnd(Date dtEnd) {
		this.dtEnd = dtEnd;
	}

	public Date getTimeStart() {
		return timeStart;
	}

	public void setTimeStart(Date timeStart) {
		this.timeStart = timeStart;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	@Override
	public String toString() {
		return "Event01 [eventID=" + eventID + ", eventName=" + eventName + ", showGroupName=" + showGroupName
				+ ", eventTypeId=" + eventTypeId + ", durationStart=" + durationStart + ", durationEnd=" + durationEnd
				+ ", isCharge=" + isCharge + ", fee=" + fee + ", shoppingUrl=" + shoppingUrl + ", contactName="
				+ contactName + ", contactTel=" + contactTel + ", contactFax=" + contactFax + ", briefIntroduction="
				+ briefIntroduction + ", vcontent=" + vcontent + ", eventUrl=" + eventUrl + ", youTubeUrl=" + youTubeUrl
				+ ", imageFile=" + imageFile + ", logoimageFile=" + logoimageFile + ", insertTime="
				+ insertTime + ", dtStart=" + dtStart + ", dtEnd=" + dtEnd + ", timeStart=" + timeStart + ", overTime="
				+ ", location=" + location + ", cityId=" + cityId + ", areaId=" + areaId + ", address="
				+ address + ", longitude=" + longitude + ", latitude=" + latitude + "]";
	}
}
