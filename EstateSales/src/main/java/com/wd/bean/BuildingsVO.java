package com.wd.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;
//楼盘表
public class BuildingsVO implements Serializable{
	private static final long serialVersionUID = 5907622795599083927L;
	private String id;//编号,UUID，主键
	private String name;//楼盘名称
	private String area;//所属区域
	private String address;//地址
	private double floor_area;//占地面积
	private double building_area;//建筑面积
	private String house_type;//房源类型，如商业，住宅
	private String building_type;//建筑类型，如塔楼，板楼
	private double longitude;//经度
	private double latitude;//纬度
	private double avg_price;//楼盘均价
	private String company;//开发公司
	private Date open_date;//	开盘时间
	private  int total_rooms;//总套数
	private String reception_address;//接待地址
	private String tel;//楼盘售楼电话
	private double green_ratio;//绿化率
	private double plot_ratio;//容积率
	private String property_company;//物业公司
	private double property_fee;//物业费
	private int car_station;//车位数
	private String traffic;//交通状况
	private String equipments;//周边配套
	private String logo;//楼盘封面，default
	private String intro;//简介
	private Date  created_time;//创建时间
	private String status	;//状态，|激活或冻结
	private String agency_id;
	private AgencyVO agency;
	private Set<ActivityVO> activity;
	private Set<BuildingsImgVO> buildingsImgSet;//楼盘图片
	private Set<BuildingVO> buildingSet;//所有楼栋
	private Set<CommentVO> commentSet;//评论记录
	private Set<HistoryVO> historySet;//浏览记录
	private Set<LikeVO> likeSet;//点赞记录
	private Set<HourseVO> houseSet;
	private Set<EmployeeVO> empSet;
	
	@JSON(serialize=false)
	public Set<EmployeeVO> getEmpSet() {
		return empSet;
	}
	public void setEmpSet(Set<EmployeeVO> empSet) {
		this.empSet = empSet;
	}
	@JSON(serialize=false)
	public Set<HourseVO> getHouseSet() {
		return houseSet;
	}
	public void setHouseSet(Set<HourseVO> houseSet) {
		this.houseSet = houseSet;
	}
	@JSON(serialize=false)
	public Set<LikeVO> getLikeSet() {
		return likeSet;
	}
	public void setLikeSet(Set<LikeVO> likeSet) {
		this.likeSet = likeSet;
	}
	@JSON(serialize=false)
	public Set<HistoryVO> getHistorySet() {
		return historySet;
	}
	public void setHistorySet(Set<HistoryVO> historySet) {
		this.historySet = historySet;
	}
	@JSON(serialize=false)
	public Set<CommentVO> getCommentSet() {
		return commentSet;
	}
	public void setCommentSet(Set<CommentVO> commentSet) {
		this.commentSet = commentSet;
	}
	@JSON(serialize=false)
	public Set<BuildingVO> getBuildingSet() {
		return buildingSet;
	}
	public void setBuildingSet(Set<BuildingVO> buildingSet) {
		this.buildingSet = buildingSet;
	}
	public Set<BuildingsImgVO> getBuildingsImgSet() {
		return buildingsImgSet;
	}
	public void setBuildingsImgSet(Set<BuildingsImgVO> buildingsImgSet) {
		this.buildingsImgSet = buildingsImgSet;
	}
	@JSON(serialize=false)
	public Set<ActivityVO> getActivity() {
		return activity;
	}
	public void setActivity(Set<ActivityVO> activity) {
		this.activity = activity;
	}
	public AgencyVO getAgency() {
		return agency;
	}
	public void setAgency(AgencyVO agency) {
		this.agency = agency;
	}
	public int getCar_station() {
		return car_station;
	}
	public void setCar_station(int car_station) {
		this.car_station = car_station;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getFloor_area() {
		return floor_area;
	}
	public void setFloor_area(double floor_area) {
		this.floor_area = floor_area;
	}
	public double getBuilding_area() {
		return building_area;
	}
	public void setBuilding_area(double building_area) {
		this.building_area = building_area;
	}
	public String getHouse_type() {
		return house_type;
	}
	public void setHouse_type(String house_type) {
		this.house_type = house_type;
	}
	public String getBuilding_type() {
		return building_type;
	}
	public void setBuilding_type(String building_type) {
		this.building_type = building_type;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getAvg_price() {
		return avg_price;
	}
	public void setAvg_price(double avg_price) {
		this.avg_price = avg_price;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public Date getOpen_date() {
		return open_date;
	}
	public void setOpen_date(Date open_date) {
		this.open_date = open_date;
	}
	public int getTotal_rooms() {
		return total_rooms;
	}
	public void setTotal_rooms(int total_rooms) {
		this.total_rooms = total_rooms;
	}
	public String getReception_address() {
		return reception_address;
	}
	public void setReception_address(String reception_address) {
		this.reception_address = reception_address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public double getGreen_ratio() {
		return green_ratio;
	}
	public void setGreen_ratio(double green_ratio) {
		this.green_ratio = green_ratio;
	}
	public double getPlot_ratio() {
		return plot_ratio;
	}
	public void setPlot_ratio(double plot_ratio) {
		this.plot_ratio = plot_ratio;
	}
	public String getProperty_company() {
		return property_company;
	}
	public void setProperty_company(String property_company) {
		this.property_company = property_company;
	}
	public double getProperty_fee() {
		return property_fee;
	}
	public void setProperty_fee(double property_fee) {
		this.property_fee = property_fee;
	}
	
	public String getTraffic() {
		return traffic;
	}
	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}
	public String getEquipments() {
		return equipments;
	}
	public void setEquipments(String equipments) {
		this.equipments = equipments;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public Date getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(String agency_id) {
		this.agency_id = agency_id;
	}
	
}
