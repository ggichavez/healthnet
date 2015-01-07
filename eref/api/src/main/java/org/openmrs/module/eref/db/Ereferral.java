package org.openmrs.module.eref.db;

import java.io.Serializable;
import java.util.Date;

public class Ereferral implements Serializable{
	private static final long serialVersionUID = -3498039529037358695L;
	public Integer hnet_e_reff_id;
	public String pat_encounter_id;
	
	
	public Ereferral(String encounter_id)
	{
		pat_encounter_id = encounter_id;
	}
	Ereferral(){
		
	}
	
	
	public void setHnet_e_reff_id(Integer hnet_e_reff_id) {
		this.hnet_e_reff_id = hnet_e_reff_id;
	}
	
	
	public void setPat_encounter_id(String eid) {
		this.pat_encounter_id = eid;
	}

	
	public Integer getHnet_e_reff_id() {
		return hnet_e_reff_id;
	}
	public String getPat_encounter_id() {
		return pat_encounter_id;
	}
	
	public String serialize() {
		if (getHnet_e_reff_id() != null)
			return "" + getHnet_e_reff_id();
		else
			return "";
	}
	
}
