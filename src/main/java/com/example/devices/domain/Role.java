package com.example.devices.domain;

import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.util.Set;
import java.time.LocalDateTime;
@Entity
@Table(name="role")
public class Role implements GrantedAuthority {
   @Id
   @GeneratedValue(strategy=GenerationType.AUTO)
   private Long id;

   private String name;

   @ManyToMany (mappedBy = "roles")
   private Set<User> users;

   private LocalDateTime dateCreate;
   private LocalDateTime dateUpdate;

   public Role(){
       dateCreate=LocalDateTime.now();
   }

   public Role (Long id){
       this.id=id;
       dateCreate=LocalDateTime.now();
   }

   public Role (Long id, String name){
       this.id=id;
       this.name=name;
       dateCreate=LocalDateTime.now();
   }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name =name;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    @Override
    public String getAuthority() {
        return getName();
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
