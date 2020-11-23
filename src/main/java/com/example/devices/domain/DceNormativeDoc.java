package com.example.devices.domain;

import javax.persistence.*;
import java.time.LocalDateTime;

//Используемые в ДСЕ нормативные документы
@Entity
@Table(name="dceNormativeDoc")
public class DceNormativeDoc {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;

    @ManyToOne (fetch=FetchType.EAGER)
    @JoinColumn (name="dce")
    private Dce dce;

    @ManyToOne (fetch=FetchType.EAGER)
    @JoinColumn (name="normative_doc")
    private NormativeDoc normativeDoc;

    @ManyToOne (fetch=FetchType.EAGER)
    @JoinColumn (name="user_create")
    private User userCreate;

    private LocalDateTime dateCreate;

    public DceNormativeDoc(){
    }

    public DceNormativeDoc(Dce dce, NormativeDoc normativeDoc, User userCreate){
        this.dce=dce;
        this.normativeDoc=normativeDoc;
        this.userCreate=userCreate;
        dateCreate=LocalDateTime.now();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Dce getDce() {
        return dce;
    }

    public void setDce(Dce dce) {
        this.dce = dce;
    }

    public NormativeDoc getNormativeDoc() {
        return normativeDoc;
    }

    public void setNormativeDoc(NormativeDoc normativeDoc) {
        this.normativeDoc = normativeDoc;
    }

    public User getUserCreate() {
        return userCreate;
    }

    public void setUserCreate(User userCreate) {
        this.userCreate = userCreate;
    }


    public LocalDateTime getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(LocalDateTime dateCreate) {
        this.dateCreate = dateCreate;
    }


    public String dceNum(){
        return dce.getDceNum();
    }
    public String normativeNum(){
      return normativeDoc.getNormativeNum();
    }
}
