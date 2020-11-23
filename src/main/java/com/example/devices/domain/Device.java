package com.example.devices.domain;

import javax.persistence.*;
import java.time.LocalDateTime;

//Приборы
@Entity
@Table(name="device")
public class Device {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;
    private String deviceNum;
    private String deviceName;
    private Float deviceMass;
    private Float deviceDepth;
    private Float deviceWidth;
    private Float deviceHeight;

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn (name="user_create")
    private User userCreate;

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn (name="user_update")
    private User userUpdate;

    private LocalDateTime dateCreate;
    private LocalDateTime dateUpdate;

    public Device(){
    }

    public Device(String deviceNum, String deviceName, Float deviceMass, Float deviceDepth, Float deviceWidth, Float deviceHeight, User userCreate){
        this.deviceNum=deviceNum;
        this.deviceName=deviceName;
        this.deviceMass=deviceMass;
        this.deviceDepth=deviceDepth;
        this.deviceWidth=deviceWidth;
        this.deviceHeight=deviceHeight;
        this.userCreate=userCreate;
        dateCreate=LocalDateTime.now();
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDeviceNum() {
        return deviceNum;
    }

    public void setDeviceNum(String deviceNum) {
        this.deviceNum = deviceNum;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public Float getDeviceMass() {
        return deviceMass;
    }

    public void setDeviceMass(Float deviceMass) {
        this.deviceMass = deviceMass;
    }

    public Float getDeviceDepth() {
        return deviceDepth;
    }

    public void setDeviceDepth(Float deviceDepth) {
        this.deviceDepth = deviceDepth;
    }

    public Float getDeviceWidth() {
        return deviceWidth;
    }

    public void setDeviceWidth(Float deviceWidth) {
        this.deviceWidth = deviceWidth;
    }

    public Float getDeviceHeight() {
        return deviceHeight;
    }

    public void setDeviceHeight(Float deviceHeight) {
        this.deviceHeight = deviceHeight;
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
}
