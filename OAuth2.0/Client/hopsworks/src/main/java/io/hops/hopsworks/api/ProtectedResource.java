/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package io.hops.hopsworks.api;

import io.hops.hopsworks.entity.Person;
import io.hops.hopsworks.facade.PersonFacade;
import javax.annotation.security.RolesAllowed;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 * REST Web Service
 *
 * @author ermias
 */
@Stateless
@Path("protected")
@RolesAllowed({"USERS", "ADMINS"})
public class ProtectedResource {

  @Context
  private UriInfo context;
  @EJB
  private PersonFacade personFacade;

  /**
   * Creates a new instance of ProtectedResource
   */
  public ProtectedResource() {
  }

  @GET
  @Produces(MediaType.APPLICATION_JSON)
  public Response getXml(@Context HttpServletRequest req) {
    Person person = personFacade.findByEmail(req.getRemoteUser());
    return Response.ok(person).build();
  }

}
