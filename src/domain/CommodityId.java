package domain;



/**
 * CommodityId entity. @author MyEclipse Persistence Tools
 */

public class CommodityId  implements java.io.Serializable {


    // Fields    

     private Integer idcommodity;
     private Shop shop;


    // Constructors

    /** default constructor */
    public CommodityId() {
    }

    
    /** full constructor */
    public CommodityId(Integer idcommodity, Shop shop) {
        this.idcommodity = idcommodity;
        this.shop = shop;
    }

   
    // Property accessors

    public Integer getIdcommodity() {
        return this.idcommodity;
    }
    
    public void setIdcommodity(Integer idcommodity) {
        this.idcommodity = idcommodity;
    }

    public Shop getShop() {
        return this.shop;
    }
    
    public void setShop(Shop shop) {
        this.shop = shop;
    }
   



   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof CommodityId) ) return false;
		 CommodityId castOther = ( CommodityId ) other; 
         
		 return ( (this.getIdcommodity()==castOther.getIdcommodity()) || ( this.getIdcommodity()!=null && castOther.getIdcommodity()!=null && this.getIdcommodity().equals(castOther.getIdcommodity()) ) )
 && ( (this.getShop()==castOther.getShop()) || ( this.getShop()!=null && castOther.getShop()!=null && this.getShop().equals(castOther.getShop()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getIdcommodity() == null ? 0 : this.getIdcommodity().hashCode() );
         result = 37 * result + ( getShop() == null ? 0 : this.getShop().hashCode() );
         return result;
   }   





}