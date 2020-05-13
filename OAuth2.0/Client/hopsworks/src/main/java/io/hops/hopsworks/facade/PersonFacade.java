/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package io.hops.hopsworks.facade;

import io.hops.hopsworks.entity.Person;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

/**
 *
 * @author ermias
 */
@Stateless
public class PersonFacade extends AbstractFacade<Person> {

  @PersistenceContext(unitName = "oauthPU")
  private EntityManager em;

  @Override
  protected EntityManager getEntityManager() {
    return em;
  }

  public PersonFacade() {
    super(Person.class);
  }
  
  public Person findByEmail(String email) {
    try {
      return em.createNamedQuery("Person.findByEmail", Person.class).setParameter("email", email).getSingleResult();
    } catch (NoResultException e) {
      return null;
    }
  }
  
}
