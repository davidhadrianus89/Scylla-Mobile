package com.scyllamobile.model;
// Generated Jun 8, 2017 5:46:44 AM by Hibernate Tools 4.3.1



/**
 * MenutreeId generated by hbm2java
 */
public class MenutreeId  implements java.io.Serializable {


     private String roleId;
     private String menuId;

    public MenutreeId() {
    }

    public MenutreeId(String roleId, String menuId) {
       this.roleId = roleId;
       this.menuId = menuId;
    }
   
    public String getRoleId() {
        return this.roleId;
    }
    
    public void setRoleId(String roleId) {
        this.roleId = roleId;
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
		 if ( !(other instanceof MenutreeId) ) return false;
		 MenutreeId castOther = ( MenutreeId ) other; 
         
		 return ( (this.getRoleId()==castOther.getRoleId()) || ( this.getRoleId()!=null && castOther.getRoleId()!=null && this.getRoleId().equals(castOther.getRoleId()) ) )
 && ( (this.getMenuId()==castOther.getMenuId()) || ( this.getMenuId()!=null && castOther.getMenuId()!=null && this.getMenuId().equals(castOther.getMenuId()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getRoleId() == null ? 0 : this.getRoleId().hashCode() );
         result = 37 * result + ( getMenuId() == null ? 0 : this.getMenuId().hashCode() );
         return result;
   }   


}


