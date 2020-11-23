package com.example.devices.domain;

import javax.persistence.*;
import java.time.LocalDateTime;

//Нормативные документы
@Entity
@Table(name="normativeDoc")
public class NormativeDoc {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;

    private String normativeNum;
    private String normativeName;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="type_norma_doc_id")
    private TypeNormaDoc typeNormaDoc;

    @ManyToOne
    @JoinColumn(name="application_area_id")
    private ApplicationArea applicationArea;

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn (name="user_create")
    private User userCreate;

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn (name="user_update")
    private User userUpdate;

    private LocalDateTime dateCreate;
    private LocalDateTime dateUpdate;

    public NormativeDoc(){
    }

    public NormativeDoc(String normativeNum, String normativeName, TypeNormaDoc typeNormaDoc, ApplicationArea applicationArea, User userCreate){
          this.normativeNum=normativeNum;
          this.normativeName=normativeName;
          this.typeNormaDoc=typeNormaDoc;
          this.applicationArea=applicationArea;
          this.userCreate=userCreate;
          dateCreate=LocalDateTime.now();
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNormativeNum() {
        return normativeNum;
    }

    public void setNormativeNum(String normativeNum) {
        this.normativeNum = normativeNum;
    }

    public String getNormativeName() {
        return normativeName;
    }

    public void setNormativeName(String normativeName) {
        this.normativeName = normativeName;
    }

    public TypeNormaDoc getTypeNormaDoc() {
        return typeNormaDoc;
    }

    public void setTypeNormaDoc(TypeNormaDoc typeNormaDoc) {
        this.typeNormaDoc = typeNormaDoc;
    }

    public ApplicationArea getApplicationArea() {
        return applicationArea;
    }

    public void setApplicationArea(ApplicationArea applicationArea) {
        this.applicationArea = applicationArea;
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

    public String getApplicationAreaName(){return applicationArea.getApplicationAreaName(); }

    public String getTypeNormaDocName(){return typeNormaDoc.getTypeNormaName(); }
    public Long getTypeNormaDocId(){return typeNormaDoc.getId(); }
    public Long getApplicationAreaId(){return applicationArea.getId(); }
}
