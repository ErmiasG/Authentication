/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package io.hops.hopsworks.entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ermias
 */
@Entity
@Table(name = "Person")
@XmlRootElement
@NamedQueries({
  @NamedQuery(name = "Person.findAll",
      query = "SELECT p FROM Person p")
  ,
    @NamedQuery(name = "Person.findById",
      query = "SELECT p FROM Person p WHERE p.id = :id")
  ,
    @NamedQuery(name = "Person.findByFirstname",
      query = "SELECT p FROM Person p WHERE p.firstname = :firstname")
  ,
    @NamedQuery(name = "Person.findByLastname",
      query = "SELECT p FROM Person p WHERE p.lastname = :lastname")
  ,
    @NamedQuery(name = "Person.findByEmail",
      query = "SELECT p FROM Person p WHERE p.email = :email")
  ,
    @NamedQuery(name = "Person.findByAddress",
      query = "SELECT p FROM Person p WHERE p.address = :address")
  ,
    @NamedQuery(name = "Person.findByCity",
      query = "SELECT p FROM Person p WHERE p.city = :city")
  ,
    @NamedQuery(name = "Person.findByPassword",
      query = "SELECT p FROM Person p WHERE p.password = :password")
  ,
    @NamedQuery(name = "Person.findByDtype",
      query = "SELECT p FROM Person p WHERE p.dtype = :dtype")})
public class Person implements Serializable {

  @JoinTable(name = "Person_Groups",
      joinColumns = {
        @JoinColumn(name = "email",
            referencedColumnName = "email")},
      inverseJoinColumns
      = {
        @JoinColumn(name = "groups_id",
            referencedColumnName = "id")})
  @ManyToMany
  private Collection<Groups> groupsCollection;

  private static final long serialVersionUID = 1L;
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Basic(optional = false)
  @Column(name = "id")
  private Integer id;
  @Basic(optional = false)
  @NotNull
  @Size(min = 1,
      max = 50)
  @Column(name = "firstname")
  private String firstname;
  @Basic(optional = false)
  @NotNull
  @Size(min = 1,
      max = 100)
  @Column(name = "lastname")
  private String lastname;
  // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
  @Basic(optional = false)
  @NotNull
  @Size(min = 1,
      max = 45)
  @Column(name = "email")
  private String email;
  @Basic(optional = false)
  @NotNull
  @Size(min = 1,
      max = 45)
  @Column(name = "address")
  private String address;
  @Basic(optional = false)
  @NotNull
  @Size(min = 1,
      max = 45)
  @Column(name = "city")
  private String city;
  @Size(max = 100)
  @Column(name = "password")
  private String password;
  @Size(max = 31)
  @Column(name = "dtype")
  private String dtype;

  public Person() {
  }

  public Person(Integer id) {
    this.id = id;
  }

  public Person(Integer id, String firstname, String lastname, String email, String address, String city) {
    this.id = id;
    this.firstname = firstname;
    this.lastname = lastname;
    this.email = email;
    this.address = address;
    this.city = city;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getFirstname() {
    return firstname;
  }

  public void setFirstname(String firstname) {
    this.firstname = firstname;
  }

  public String getLastname() {
    return lastname;
  }

  public void setLastname(String lastname) {
    this.lastname = lastname;
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

  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getDtype() {
    return dtype;
  }

  public void setDtype(String dtype) {
    this.dtype = dtype;
  }

  @Override
  public int hashCode() {
    int hash = 0;
    hash += (id != null ? id.hashCode() : 0);
    return hash;
  }

  @Override
  public boolean equals(Object object) {
    // TODO: Warning - this method won't work in the case the id fields are not set
    if (!(object instanceof Person)) {
      return false;
    }
    Person other = (Person) object;
    if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "Person{" + "groupsCollection=" + groupsCollection + ", id=" + id + ", firstname=" + firstname + ", lastname=" +
        lastname + ", email=" + email + ", address=" + address + ", city=" + city + ", password=" + password + ", dtype=" +
        dtype + '}';
  }

  public Collection<Groups> getGroupsCollection() {
    return groupsCollection;
  }

  public void setGroupsCollection(Collection<Groups> groupsCollection) {
    this.groupsCollection = groupsCollection;
  }
  
}
