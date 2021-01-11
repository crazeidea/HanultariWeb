package favorite;

import java.util.Date;

public class FavoriteDTO {
	
	private String member_id, parking_id;
	private Date added_date;
		
	public FavoriteDTO(String member_id, String parking_id, Date added_date) {
		super();
		this.member_id = member_id;
		this.parking_id = parking_id;
		this.added_date = added_date;
	}
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getParking_id() {
		return parking_id;
	}
	public void setParking_id(String parking_id) {
		this.parking_id = parking_id;
	}
	public Date getAdded_date() {
		return added_date;
	}
	public void setAdded_date(Date added_date) {
		this.added_date = added_date;
	}
	
	

}
