package io.hops.hopsworks.api;

import io.hops.hopsworks.entity.Person;
import io.hops.hopsworks.facade.PersonFacade;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.security.RolesAllowed;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

@Stateless
@Path("auth")
public class AuthResource {

  private static final Logger LOGGER = Logger.getLogger(AuthResource.class.getName());
  @Context
  private UriInfo context;
  @EJB
  private PersonFacade personFacade;

  public AuthResource() {
  }

  @GET
  @Path("session")
  @RolesAllowed({"USERS", "ADMINS"})
  @Produces(MediaType.APPLICATION_JSON)
  public Response session() {
    return Response.ok().build();
  }

  @POST
  @Path("login")
  @Produces(MediaType.APPLICATION_JSON)
  public Response login(@FormParam("username") String username, @FormParam("password") String password,
      @Context HttpServletRequest req) throws ServletException {
    req.login(username, password);
    String role = req.isUserInRole("ADMINS")? "ADMINS" : req.isUserInRole("USERS")? "USERS" : "-";
    LOGGER.log(Level.SEVERE, "Username: {0}, Password: {1}, Role: {2}", new Object[]{username, password, role});
    Person person = personFacade.findByEmail(username);
    LOGGER.log(Level.SEVERE, "User role: {0}", person.getGroupsCollection().size());
    LOGGER.log(Level.SEVERE, "User: {0}", person);
    return Response.ok(person).build();
  }

  @GET
  @Path("logout")
  @Produces(MediaType.APPLICATION_JSON)
  public Response logout(@Context HttpServletRequest req) throws ServletException {
    req.logout();
    return Response.ok().build();
  }
}
