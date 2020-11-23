package com.example.devices.domain;

import javax.persistence.*;
import java.time.LocalDateTime;

//Детали и сборочные единицы
@Entity
@Table (name="dce")
public class Dce {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;

    private String dceNum;
    private String dceName;
    private Float dceMass;

    @ManyToOne (fetch=FetchType.EAGER)
    @JoinColumn (name="user_create")
    private User userCreate;


    @ManyToOne (fetch=FetchType.EAGER)
    @JoinColumn  (name="user_update")
    private User userUpdate;

    @ManyToOne (fetch=FetchType.EAGER)
    @JoinColumn (name="littera_id")
    private Littera littera;

    @ManyToOne (fetch=FetchType.EAGER)
    @JoinColumn (name="device_id")
    private Device device;

    private LocalDateTime dateCreate;
    private LocalDateTime dateUpdate;

    public Dce(){
    }

    public Dce (String dceNum, String dceName, Littera littera, Float dceMass, Device device, User userCreate){
        this.dceName=dceName;
        this.dceNum=dceNum;
        this.littera=littera;
        this.dceMass=dceMass;
        this.device=device;
        this.userCreate=userCreate;
        dateCreate=LocalDateTime.now();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Float getDceMass() {
        return dceMass;
    }

    public void setDceMass(Float dceMass) {
        this.dceMass = dceMass;
    }

    public String getDceNum() {
        return dceNum;
    }

    public void setDceNum(String dceNum) {
        this.dceNum = dceNum;
    }

    public String getDceName() {
        return dceName;
    }

    public void setDceName(String dceName) {
        this.dceName = dceName;
    }

    public Littera getLittera() {
        return littera;
    }

    public void setLittera(Littera littera) {
        this.littera = littera;
    }

    public Device getDevice() {
        return device;
    }

    public void setDevice(Device device) {
        this.device = device;
    }

    public User getUserCreate() {
        return userCreate;
    }

    public void setUserCreate(User userCreate) {
        this.userCreate = userCreate;
    }

    public User getUserUpdate() {
        return userUpdate;
    }

    public void setUserUpdate(User userUpdate) {
        this.userUpdate = userUpdate;
    }

    public LocalDateTime getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(LocalDateTime dateCreate) {
        this.dateCreate = dateCreate;
    }

    public LocalDateTime getDateUpdate() {
        return dateUpdate;
    }

    public void setDateUpdate() {
        dateUpdate =LocalDateTime.now() ;
    }

    public String getLitteraName(){ return littera !=null ? littera.getLitteraName():""; }

    public String getDeviceNumber() {return device!=null ? device.getDeviceNum():""; }

}
