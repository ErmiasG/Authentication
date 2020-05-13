package com.example.ldap.rest.application.config;

import com.example.ldap.rest.Auth;
import com.example.ldap.rest.ProtectedResources;
import com.example.ldap.rest.UnprotectedResources;
import org.glassfish.jersey.server.ResourceConfig;

@javax.ws.rs.ApplicationPath("api")
public class ApplicationConfig extends ResourceConfig {
  public ApplicationConfig() {
    register(ProtectedResources.class);
    register(UnprotectedResources.class);
    register(Auth.class);
  }
}
