package com.example.ldap.rest;

import com.example.ldap.realm.LdapRealm;
import com.example.ldap.realm.RemoteUserDTO;

import javax.ejb.EJB;
import javax.naming.NamingException;
import javax.security.auth.login.LoginException;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.logging.Level;
import java.util.logging.Logger;

@Path("/auth")
public class Auth {
  private final static Logger LOGGER = Logger.getLogger(Auth.class.getName());
  
  @EJB
  private LdapRealm ldapRealm;
  
  @POST
  @Path("login")
  @Produces(MediaType.APPLICATION_JSON)
  public Response login(@FormParam("username") String username, @FormParam("password") String password) {
    LOGGER.log(Level.SEVERE, "Logging in user: {0}, password: {1}", new Object[]{username, password});
    RemoteUserDTO remoteUserDTO = null;
    try {
      remoteUserDTO = ldapRealm.findAndBind(username, password);
      return Response.ok(remoteUserDTO).build();
    } catch (LoginException e) {
      return Response.status(Response.Status.UNAUTHORIZED).build();
    } catch (NamingException e) {
      return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(e.getCause().getMessage()).build();
    }
    
  }
}
