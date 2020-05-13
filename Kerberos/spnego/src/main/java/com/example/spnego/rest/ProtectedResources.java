package com.example.spnego.rest;

import com.example.spnego.ldap.realm.LdapRealm;
import com.example.spnego.ldap.realm.RemoteUserGroupMapper;
import com.example.spnego.ldap.realm.RemoteUserDTO;

import java.util.List;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.naming.NamingException;
import javax.security.auth.login.LoginException;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.SecurityContext;

@Path("/protected")
public class ProtectedResources {

  private final static Logger LOGGER = Logger.getLogger(ProtectedResources.class.getName());
  @EJB
  private LdapRealm ldapRealm;
  @EJB
  private RemoteUserGroupMapper remoteUserGroupMapper;

  @GET
  @Path("/resource")
  @Produces(MediaType.APPLICATION_JSON)
  public Response getProtectedResource(@Context SecurityContext sc, @Context HttpServletRequest req) throws
    NamingException, LoginException {
    JsonResponse json = new JsonResponse();
    json.setStatus("SUCCESS");
    json.setMessage("Protected Resource!");
    json.setSessionID(req.getSession().getId());
    json.setAuthType(req.getAuthType());
    String principalName = sc.getUserPrincipal() == null ? "" : sc.getUserPrincipal().getName();
    json.setPrincipal(principalName);
    Enumeration<String> names = req.getHeaderNames();
    while (names.hasMoreElements()) {
      String name = names.nextElement();
      LOGGER.log(Level.INFO, "{0} = {1}", new Object[]{name, req.getHeader(name)});
      if ("authorization".equals(name)) {
        json.setToken(req.getHeader(name));
      }
    }
    RemoteUserDTO remoteUserDTO = ldapRealm.findKrbUser(principalName);
    LOGGER.log(Level.INFO, "RemoteUserDTO: {0}", remoteUserDTO);
    List<String> mappings = remoteUserGroupMapper.getMappedGroups(remoteUserDTO.getGroups());
    LOGGER.log(Level.INFO, "Mappings: {0}", mappings);
    remoteUserDTO.setSystemGroups(mappings);
    json.setUser(remoteUserDTO);
    LOGGER.log(Level.INFO, "Response: {0}", json);
    return Response.ok(json).build();
  }
}
