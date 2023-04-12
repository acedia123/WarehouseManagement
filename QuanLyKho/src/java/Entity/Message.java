package Entity;

public class Message {

    private String name;
    private Boolean status;

    public Message() {
    }

    public Message(String name, Boolean status) {
        this.name = name;
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "{" + "name:'" + name + "', status:" + status + '}';
    }
}
