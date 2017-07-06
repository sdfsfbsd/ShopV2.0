package domain;



/**
 * ShopId entity. @author MyEclipse Persistence Tools
 */

public class ShopId  implements java.io.Serializable {


    // Fields    

     private Integer idshop;
     private User user;


    // Constructors

    /** default constructor */
    public ShopId() {
    }

    
    /** full constructor */
    public ShopId(Integer idshop, User user) {
        this.idshop = idshop;
        this.user = user;
    }

   
    // Property accessors

    public Integer getIdshop() {
        return this.idshop;
    }
    
    public void setIdshop(Integer idshop) {
        this.idshop = idshop;
    }

    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
   



   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof ShopId) ) return false;
		 ShopId castOther = ( ShopId ) other; 
         
		 return ( (this.getIdshop()==castOther.getIdshop()) || ( this.getIdshop()!=null && castOther.getIdshop()!=null && this.getIdshop().equals(castOther.getIdshop()) ) )
 && ( (this.getUser()==castOther.getUser()) || ( this.getUser()!=null && castOther.getUser()!=null && this.getUser().equals(castOther.getUser()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getIdshop() == null ? 0 : this.getIdshop().hashCode() );
         result = 37 * result + ( getUser() == null ? 0 : this.getUser().hashCode() );
         return result;
   }   





}