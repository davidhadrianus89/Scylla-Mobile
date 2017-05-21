package com.scyllamobile.model;
// Generated May 9, 2017 11:10:35 AM by Hibernate Tools 4.3.1



/**
 * TTreeMenuId generated by hbm2java
 */
public class TTreeMenuId  implements java.io.Serializable {


     private String userGroupId;
     private String menuId;

    public TTreeMenuId() {
    }

    public TTreeMenuId(String userGroupId, String menuId) {
       this.userGroupId = userGroupId;
       this.menuId = menuId;
    }
   
    public String getUserGroupId() {
        return this.userGroupId;
    }
    
    public void setUserGroupId(String userGroupId) {
        this.userGroupId = userGroupId;
    }
    public String getMenuId() {
        return this.menuId;
    }
    
    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof TTreeMenuId) ) return false;
		 TTreeMenuId castOther = ( TTreeMenuId ) other; 
         
		 return ( (this.getUserGroupId()==castOther.getUserGroupId()) || ( this.getUserGroupId()!=null && castOther.getUserGroupId()!=null && this.getUserGroupId().equals(castOther.getUserGroupId()) ) )
 && ( (this.getMenuId()==castOther.getMenuId()) || ( this.getMenuId()!=null && castOther.getMenuId()!=null && this.getMenuId().equals(castOther.getMenuId()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getUserGroupId() == null ? 0 : this.getUserGroupId().hashCode() );
         result = 37 * result + ( getMenuId() == null ? 0 : this.getMenuId().hashCode() );
         return result;
   }   


}


