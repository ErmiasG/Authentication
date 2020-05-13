/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package io.hops.hopsworks.facade;

import io.hops.hopsworks.entity.Groups;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author ermias
 */
@Stateless
public class GroupsFacade extends AbstractFacade<Groups> {

  @PersistenceContext(unitName = "oauthPU")
  private EntityManager em;

  @Override
  protected EntityManager getEntityManager() {
    return em;
  }

  public GroupsFacade() {
    super(Groups.class);
  }
  
}
