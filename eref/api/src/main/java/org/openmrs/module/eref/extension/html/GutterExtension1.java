package org.openmrs.module.eref.extension.html;

import org.openmrs.module.Extension;


public class GutterExtension1 extends Extension {

    /**
     * @see org.openmrs.module.extension.Extension#getMediaType()
     */
    public Extension.MEDIA_TYPE getMediaType() {
        return Extension.MEDIA_TYPE.html;
    }

    /**
     * Th visible label
     * 
     * @return The message code of the label of this link
     */
    public String getLabel(){
    	 return "Emergency Referrals";
     }
	
     /** 
      * The hyperlink connected to the label.
      * 
      * @return The url that this link should go to 
      */
     public String getUrl(){
    	 return "module/eref/chart5Link.form";
     }

    /**
     * The privilege the user must have to see this link
     * 
     * @return The String value of the privilege
     */
   public String getRequiredPrivilege(){
    return "View Patients";
    }



}
