package Model;

public class Store {
    private int storeId;
    private String storeName;
    private String phone;
    private String email;
    private String address;
    private String introduction;
    private String image;

    // Constructors
    public Store() {
    }

    public Store(int storeId, String storeName, String phone, String email, String address, String introduction, String image) {
        this.storeId = storeId;
        this.storeName = storeName;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.introduction = introduction;
        this.image = image;
    }

    // Getters and Setters
    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    // toString method for debugging
    @Override
    public String toString() {
        return "Store{" +
                "storeId=" + storeId +
                ", storeName='" + storeName + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", introduction='" + introduction + '\'' +
                ", image='" + image + '\'' +
                '}';
    }
}
