package com.example.devices.domain;

import javax.persistence.*;
import java.time.LocalDateTime;

//Тип нормативного документа
@Entity
@Table (name="typeNormaDoc")
public class TypeNormaDoc {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;
    private String typeNormaName;

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn (name="user_create")
    private User userCreate;

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn (name="user_update")
    private User userUpdate;
    private LocalDateTime dateCreate;
    private LocalDateTime dateUpdate;

    public TypeNormaDoc(){

    }

    public TypeNormaDoc (String typeNormaName, User userCreate){
        this.typeNormaName=typeNormaName;
        this.userCreate=userCreate;
        dateCreate=LocalDateTime.now();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTypeNormaName() {
        return typeNormaName;
    }

    public void setTypeNormaName(String typeNormaName) {
        this.typeNormaName = typeNormaName;
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
