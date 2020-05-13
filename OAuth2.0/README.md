Warning! You MUST protect your Client ID, Client Secret (if provided), and your Registration Access Token. If you lose your Client ID or Registration Access Token, you will no longer have access to your client's registration records and you will need to register a new client.

Client ID: f505cc8c-fb7e-4f6a-9b38-cfe463a05878
Client Secret: AINsAzoibq9eRBIjJsTJR5PfnvWOfFRyll-RRr2kuGPFslViUC7eSXHq56-JBki2PPvMgmaThWkX8EVkaa-lYzc
Client Configuration URL: http://localhost:8080/openid-connect-server-webapp/register/f505cc8c-fb7e-4f6a-9b38-cfe463a05878
Registration Access Token: 
eyJraWQiOiJyc2ExIiwiYWxnIjoiUlMyNTYifQ.eyJhdWQiOiJmNTA1Y2M4Yy1mYjdlLTRmNmEtOWIzOC1jZmU0NjNhMDU4NzgiLCJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODA4MFwvb3BlbmlkLWNvbm5lY3Qtc2VydmVyLXdlYmFwcFwvIiwiaWF0IjoxNTUxMDEzOTMyLCJqdGkiOiI4NTkxMjQ0Mi1hZTI4LTQyYzktYThlMi1iMWQwYmE1MzNlZGMifQ.RGoVotdSCKD5hwDqAcwudSBb7loIrnjDlNlYitN1so8cWRbr-yF8qlzNLAHWa1vrNLmmPoAmHkttGMHaxvQ3XvH-KdFoC_OOYiAmffhAoUc-sHUdaPmyB_nUj3pe3RhvskjVSTCWbKZq7PLDv2y4_5i6kBpdmE3a_hIdkbPLs3Q1pwjw_LcKOYxkY8FkILvhFFmhiSmokvlZQptZDZpUQQ0b_he4EqHOeC3Am3a_TX2bCeW3mAsj1zJHueH_G7Qfl91uOLlHR-pctgLMbQVVy08D5zPxCNxG_l5LZOfX2dXXCSGJJwrguAbCbDGnC9wnEO3Kz4sL4zubjcd2IcA3UQ

# Get login page
http://localhost:8080/openid-connect-server-webapp/authorize?response_type=code&scope=openid profile email&client_id=f505cc8c-fb7e-4f6a-9b38-cfe463a05878&state=af0ifjsldkj&redirect_uri=https://localhost:8181/hopsworks/auth/callback

# use code to get an access token
curl -X POST -d "client_id=f505cc8c-fb7e-4f6a-9b38-cfe463a05878&client_secret=AINsAzoibq9eRBIjJsTJR5PfnvWOfFRyll-RRr2kuGPFslViUC7eSXHq56-JBki2PPvMgmaThWkX8EVkaa-lYzc&code=Gd1nNx0b7Lf59QCiZgCmzq&grant_type=authorization_code&redirect_uri=https://localhost:8181/hopsworks/auth/callback" http://localhost:8080/openid-connect-server-webapp/token
```json
{
   "access_token":"eyJraWQiOiJyc2ExIiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJ1c2VyIiwiYXpwIjoiZjUwNWNjOGMtZmI3ZS00ZjZhLTliMzgtY2ZlNDYzYTA1ODc4IiwiaXNzIjoiaHR0cDpcL1wvbG9jYWxob3N0OjgwODBcL29wZW5pZC1jb25uZWN0LXNlcnZlci13ZWJhcHBcLyIsImV4cCI6MTU1MTAzMjIxNiwiaWF0IjoxNTUxMDI4NjE2LCJqdGkiOiI1YjE0MDViOC00NjFmLTQxYzYtOTNmZC05M2E5MjY4ZmFmOWMifQ.ikv7W3dGGt8o0Wue5hPMejb0mJATLNO2uzq7fs-5vSOGw5vm1Dij7msIHCv0WZYOoVk0E4xOjj8LF9rV4N_IqJrs5NG_m7bwY3g_5ZODu9EC9kNtYLM0v_jeg4yNcbnYITu52-PDa7SMyMg8Ovd8dIV1a6hkgZKlfDmvllZ03OIsQuAy0gLQpLRL6Q91TZiTKHGrdpY_jcw4UM9gfiABuesixKlLpknhLZF_JI5sAr68gAzFK4FV6m239ngSa-HVIsKAiikDBotM1vQF1r5_0xmSxGVPnO2gc5AF--9r9EfR0DiuGQbdCvOnxA9pSAnqmlNZekJtQ64a7uv40zQm4w",
"token_type":"Bearer",
"expires_in":3599,
"scope":"openid email profile",
"id_token":"eyJraWQiOiJyc2ExIiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiIwMTkyMS5GTEFOUkpRVyIsImF1ZCI6ImY1MDVjYzhjLWZiN2UtNGY2YS05YjM4LWNmZTQ2M2EwNTg3OCIsImF1dGhfdGltZSI6MTU1MTAyODYwMiwia2lkIjoicnNhMSIsImlzcyI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgwXC9vcGVuaWQtY29ubmVjdC1zZXJ2ZXItd2ViYXBwXC8iLCJleHAiOjE1NTEwMjkyMTYsImlhdCI6MTU1MTAyODYxNiwianRpIjoiYmEyZGZlNjEtMzA5ZC00YzI3LWJlNzQtNDU2ZWY5YzBkODgzIn0.jlzgldjdrJZrW9meQ2wouiBrt1ComV5Pd49ejIZNJv70bMbv8ufCzhUG9t6nIH1PTnkkChfdbwikh0Z971rZA9-KFInxnUU9574p0oxv2PBq0rs7uNavji7JRT7lRjvhu-8w1eWMXkLI0XjCEPFTLhwt6o_YjlrwrkAk7wMmg3tDrKp3AlJpXyPyiE3RA3cp52SA-vT9fLZ9e2s_BrXVHIyISQ5P_-g6aJ3wdNBLFIUgZO6LFvNE9wDcyyIHW3FV7d1UfiL76bzy3-Roh_3l2OE4LUOifwUzRdQUNiIHjd9j8KliqG7-9SMagkO12YCSMkDhWZ0Nk3ZQEdEq4sVJBA"
}
```
### access_token
```json
{
  "kid": "rsa1",
  "alg": "RS256"
}
.
{
  "sub": "user",
  "azp": "f505cc8c-fb7e-4f6a-9b38-cfe463a05878",
  "iss": "http://localhost:8080/openid-connect-server-webapp/",
  "exp": 1551032216,
  "iat": 1551028616,
  "jti": "5b1405b8-461f-41c6-93fd-93a9268faf9c"
}
```
### id_token
```json
{
  "kid": "rsa1",
  "alg": "RS256"
}
.
{
  "sub": "01921.FLANRJQW",
  "aud": "f505cc8c-fb7e-4f6a-9b38-cfe463a05878",
  "auth_time": 1551028602,
  "kid": "rsa1",
  "iss": "http://localhost:8080/openid-connect-server-webapp/",
  "exp": 1551029216,
  "iat": 1551028616,
  "jti": "ba2dfe61-309d-4c27-be74-456ef9c0d883"
}
```
# use access token to get user info
curl --header "Authorization: Bearer eyJraWQiOiJyc2ExIiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJ1c2VyIiwiYXpwIjoiZjUwNWNjOGMtZmI3ZS00ZjZhLTliMzgtY2ZlNDYzYTA1ODc4IiwiaXNzIjoiaHR0cDpcL1wvbG9jYWxob3N0OjgwODBcL29wZW5pZC1jb25uZWN0LXNlcnZlci13ZWJhcHBcLyIsImV4cCI6MTU1MTAzMjIxNiwiaWF0IjoxNTUxMDI4NjE2LCJqdGkiOiI1YjE0MDViOC00NjFmLTQxYzYtOTNmZC05M2E5MjY4ZmFmOWMifQ.ikv7W3dGGt8o0Wue5hPMejb0mJATLNO2uzq7fs-5vSOGw5vm1Dij7msIHCv0WZYOoVk0E4xOjj8LF9rV4N_IqJrs5NG_m7bwY3g_5ZODu9EC9kNtYLM0v_jeg4yNcbnYITu52-PDa7SMyMg8Ovd8dIV1a6hkgZKlfDmvllZ03OIsQuAy0gLQpLRL6Q91TZiTKHGrdpY_jcw4UM9gfiABuesixKlLpknhLZF_JI5sAr68gAzFK4FV6m239ngSa-HVIsKAiikDBotM1vQF1r5_0xmSxGVPnO2gc5AF--9r9EfR0DiuGQbdCvOnxA9pSAnqmlNZekJtQ64a7uv40zQm4w" http://localhost:8080/openid-connect-server-webapp/userinfo
```json
{
    "sub":"01921.FLANRJQW",
    "name":"Demo User",
    "preferred_username":"user",
    "email":"user@example.com",
    "email_verified":true
}
```

# .well-known/openid-configuration

## https://accounts.google.com/.well-known/openid-configuration
```json
{
 "issuer": "https://accounts.google.com",
 "authorization_endpoint": "https://accounts.google.com/o/oauth2/v2/auth",
 "token_endpoint": "https://oauth2.googleapis.com/token",
 "userinfo_endpoint": "https://openidconnect.googleapis.com/v1/userinfo",
 "revocation_endpoint": "https://oauth2.googleapis.com/revoke",
 "jwks_uri": "https://www.googleapis.com/oauth2/v3/certs",
 "response_types_supported": [
  "code",
  "token",
  "id_token",
  "code token",
  "code id_token",
  "token id_token",
  "code token id_token",
  "none"
 ],
 "subject_types_supported": [
  "public"
 ],
 "id_token_signing_alg_values_supported": [
  "RS256"
 ],
 "scopes_supported": [
  "openid",
  "email",
  "profile"
 ],
 "token_endpoint_auth_methods_supported": [
  "client_secret_post",
  "client_secret_basic"
 ],
 "claims_supported": [
  "aud",
  "email",
  "email_verified",
  "exp",
  "family_name",
  "given_name",
  "iat",
  "iss",
  "locale",
  "name",
  "picture",
  "sub"
 ],
 "code_challenge_methods_supported": [
  "plain",
  "S256"
 ]
}
```

## https://login.windows.net/common/.well-known/openid-configuration
```json
{
  "authorization_endpoint": "https://login.windows.net/common/oauth2/authorize",
  "token_endpoint": "https://login.windows.net/common/oauth2/token",
  "token_endpoint_auth_methods_supported": [
    "client_secret_post",
    "private_key_jwt",
    "client_secret_basic"
  ],
  "jwks_uri": "https://login.windows.net/common/discovery/keys",
  "response_modes_supported": [
    "query",
    "fragment",
    "form_post"
  ],
  "subject_types_supported": [
    "pairwise"
  ],
  "id_token_signing_alg_values_supported": [
    "RS256"
  ],
  "http_logout_supported": true,
  "frontchannel_logout_supported": true,
  "end_session_endpoint": "https://login.windows.net/common/oauth2/logout",
  "response_types_supported": [
    "code",
    "id_token",
    "code id_token",
    "token id_token",
    "token"
  ],
  "scopes_supported": [
    "openid"
  ],
  "issuer": "https://sts.windows.net/{tenantid}/",
  "claims_supported": [
    "sub",
    "iss",
    "cloud_instance_name",
    "cloud_instance_host_name",
    "cloud_graph_host_name",
    "msgraph_host",
    "aud",
    "exp",
    "iat",
    "auth_time",
    "acr",
    "amr",
    "nonce",
    "email",
    "given_name",
    "family_name",
    "nickname"
  ],
  "microsoft_multi_refresh_token": true,
  "check_session_iframe": "https://login.windows.net/common/oauth2/checksession",
  "userinfo_endpoint": "https://login.windows.net/common/openid/userinfo",
  "tenant_region_scope": null,
  "cloud_instance_name": "microsoftonline.com",
  "cloud_graph_host_name": "graph.windows.net",
  "msgraph_host": "graph.microsoft.com",
  "rbac_url": "https://pas.windows.net"
}
```
## http://10.112.10.35:8080/openid-connect-server-webapp
## localhost:8080/openid-connect-server-webapp/.well-known/openid-configuration
```json
{
  "request_parameter_supported": true,
  "claims_parameter_supported": false,
  "introspection_endpoint": "http://localhost:8080/openid-connect-server-webapp/introspect",
  "scopes_supported": [
    "openid",
    "profile",
    "email",
    "address",
    "phone",
    "offline_access"
  ],
  "issuer": "http://localhost:8080/openid-connect-server-webapp/",
  "userinfo_encryption_enc_values_supported": [
    "A256CBC+HS512",
    "A256GCM",
    "A192GCM",
    "A128GCM",
    "A128CBC-HS256",
    "A192CBC-HS384",
    "A256CBC-HS512",
    "A128CBC+HS256"
  ],
  "id_token_encryption_enc_values_supported": [
    "A256CBC+HS512",
    "A256GCM",
    "A192GCM",
    "A128GCM",
    "A128CBC-HS256",
    "A192CBC-HS384",
    "A256CBC-HS512",
    "A128CBC+HS256"
  ],
  "authorization_endpoint": "http://localhost:8080/openid-connect-server-webapp/authorize",
  "service_documentation": "http://localhost:8080/openid-connect-server-webapp/about",
  "request_object_encryption_enc_values_supported": [
    "A256CBC+HS512",
    "A256GCM",
    "A192GCM",
    "A128GCM",
    "A128CBC-HS256",
    "A192CBC-HS384",
    "A256CBC-HS512",
    "A128CBC+HS256"
  ],
  "device_authorization_endpoint": "http://localhost:8080/openid-connect-server-webapp/devicecode",
  "userinfo_signing_alg_values_supported": [
    "HS256",
    "HS384",
    "HS512",
    "RS256",
    "RS384",
    "RS512",
    "ES256",
    "ES384",
    "ES512",
    "PS256",
    "PS384",
    "PS512"
  ],
  "claims_supported": [
    "sub",
    "name",
    "preferred_username",
    "given_name",
    "family_name",
    "middle_name",
    "nickname",
    "profile",
    "picture",
    "website",
    "gender",
    "zoneinfo",
    "locale",
    "updated_at",
    "birthdate",
    "email",
    "email_verified",
    "phone_number",
    "phone_number_verified",
    "address"
  ],
  "claim_types_supported": [
    "normal"
  ],
  "op_policy_uri": "http://localhost:8080/openid-connect-server-webapp/about",
  "token_endpoint_auth_methods_supported": [
    "client_secret_post",
    "client_secret_basic",
    "client_secret_jwt",
    "private_key_jwt",
    "none"
  ],
  "token_endpoint": "http://localhost:8080/openid-connect-server-webapp/token",
  "response_types_supported": [
    "code",
    "token"
  ],
  "request_uri_parameter_supported": false,
  "userinfo_encryption_alg_values_supported": [
    "RSA-OAEP",
    "RSA-OAEP-256",
    "RSA1_5"
  ],
  "grant_types_supported": [
    "authorization_code",
    "implicit",
    "urn:ietf:params:oauth:grant-type:jwt-bearer",
    "client_credentials",
    "urn:ietf:params:oauth:grant_type:redelegate",
    "urn:ietf:params:oauth:grant-type:device_code"
  ],
  "end_session_endpoint": "http://localhost:8080/openid-connect-server-webapp/endsession",
  "revocation_endpoint": "http://localhost:8080/openid-connect-server-webapp/revoke",
  "userinfo_endpoint": "http://localhost:8080/openid-connect-server-webapp/userinfo",
  "token_endpoint_auth_signing_alg_values_supported": [
    "HS256",
    "HS384",
    "HS512",
    "RS256",
    "RS384",
    "RS512",
    "ES256",
    "ES384",
    "ES512",
    "PS256",
    "PS384",
    "PS512"
  ],
  "op_tos_uri": "http://localhost:8080/openid-connect-server-webapp/about",
  "require_request_uri_registration": false,
  "code_challenge_methods_supported": [
    "plain",
    "S256"
  ],
  "id_token_encryption_alg_values_supported": [
    "RSA-OAEP",
    "RSA-OAEP-256",
    "RSA1_5"
  ],
  "jwks_uri": "http://localhost:8080/openid-connect-server-webapp/jwk",
  "subject_types_supported": [
    "public",
    "pairwise"
  ],
  "id_token_signing_alg_values_supported": [
    "HS256",
    "HS384",
    "HS512",
    "RS256",
    "RS384",
    "RS512",
    "ES256",
    "ES384",
    "ES512",
    "PS256",
    "PS384",
    "PS512",
    "none"
  ],
  "registration_endpoint": "http://localhost:8080/openid-connect-server-webapp/register",
  "request_object_signing_alg_values_supported": [
    "HS256",
    "HS384",
    "HS512",
    "RS256",
    "RS384",
    "RS512",
    "ES256",
    "ES384",
    "ES512",
    "PS256",
    "PS384",
    "PS512"
  ],
  "request_object_encryption_alg_values_supported": [
    "RSA-OAEP",
    "RSA-OAEP-256",
    "RSA1_5"
  ]
}
```



## CSRF Session Swapping

1. attach a attacker’s own code in a link that goes to the RP's openid login
2. make the victem click it 
3. 

## CSRF Automatic login




{  
   "0":{  
      "id":1,
      "clientId":"client",
      "clientSecret":"secret",
      "redirectUris":[  
         "http://localhost/",
         "http://localhost:8080/"
      ],
      "clientName":"Test Client",
      "clientUri":null,
      "logoUri":null,
      "contacts":[  

      ],
      "tosUri":null,
      "tokenEndpointAuthMethod":null,
      "scope":[  
         "address",
         "phone",
         "openid",
         "profile",
         "offline_access",
         "email"
      ],
      "grantTypes":[  
         "implicit",
         "refresh_token",
         "urn:ietf:params:oauth:grant_type:redelegate",
         "authorization_code"
      ],
      "responseTypes":[  

      ],
      "policyUri":null,
      "jwksUri":null,
      "jwks":null,
      "softwareId":null,
      "softwareVersion":null,
      "applicationType":null,
      "sectorIdentifierUri":null,
      "subjectType":null,
      "requestObjectSigningAlg":null,
      "userInfoSignedResponseAlg":null,
      "userInfoEncryptedResponseAlg":null,
      "userInfoEncryptedResponseEnc":null,
      "idTokenSignedResponseAlg":null,
      "idTokenEncryptedResponseAlg":null,
      "idTokenEncryptedResponseEnc":null,
      "tokenEndpointAuthSigningAlg":null,
      "defaultMaxAge":null,
      "requireAuthTime":null,
      "defaultACRvalues":[  

      ],
      "initiateLoginUri":null,
      "postLogoutRedirectUris":[  

      ],
      "requestUris":[  

      ],
      "authorities":[  

      ],
      "accessTokenValiditySeconds":3600,
      "refreshTokenValiditySeconds":null,
      "resourceIds":[  

      ],
      "clientDescription":null,
      "reuseRefreshToken":true,
      "dynamicallyRegistered":false,
      "allowIntrospection":true,
      "idTokenValiditySeconds":600,
      "createdAt":null,
      "clearAccessTokensOnRefresh":true,
      "deviceCodeValiditySeconds":null,
      "claimsRedirectUris":[  

      ],
      "softwareStatement":null,
      "codeChallengeMethod":null
   },
   "id":null,
   "clientId":null,
   "clientSecret":null,
   "redirectUris":[  
      "https://10.112.10.35:8181/hopsworks/callback"
   ],
   "clientName":"hopsworks",
   "clientUri":null,
   "logoUri":"https://10.112.10.35:8181/hops.png",
   "contacts":[  
      "admin@example.com"
   ],
   "tosUri":null,
   "tokenEndpointAuthMethod":"SECRET_POST",
   "scope":[  
      "openid",
      "profile",
      "email",
      "address",
      "phone"
   ],
   "grantTypes":[  
      "authorization_code"
   ],
   "responseTypes":[  
      "code"
   ],
   "policyUri":null,
   "jwksUri":null,
   "jwks":null,
   "jwksType":"URI",
   "sectorIdentifierUri":null,
   "subjectType":"PUBLIC",
   "requestObjectSigningAlg":null,
   "userInfoSignedResponseAlg":null,
   "userInfoEncryptedResponseAlg":null,
   "userInfoEncryptedResponseEnc":null,
   "idTokenSignedResponseAlg":null,
   "idTokenEncryptedResponseAlg":null,
   "idTokenEncryptedResponseEnc":null,
   "tokenEndpointAuthSigningAlg":null,
   "defaultMaxAge":60000,
   "requireAuthTime":true,
   "defaultACRvalues":[  

   ],
   "initiateLoginUri":null,
   "postLogoutRedirectUris":[  

   ],
   "requestUris":[  

   ],
   "softwareStatement":null,
   "softwareId":null,
   "softwareVersion":null,
   "codeChallengeMethod":null,
   "authorities":[  

   ],
   "accessTokenValiditySeconds":3600,
   "refreshTokenValiditySeconds":null,
   "resourceIds":[  

   ],
   "claimsRedirectUris":[  

   ],
   "clientDescription":null,
   "reuseRefreshToken":true,
   "clearAccessTokensOnRefresh":true,
   "dynamicallyRegistered":false,
   "allowIntrospection":true,
   "idTokenValiditySeconds":600,
   "deviceCodeValiditySeconds":1800,
   "createdAt":null,
   "allowRefresh":false,
   "displayClientSecret":false,
   "generateClientSecret":true
}



https://10.112.10.35:8181/hopsworks/callback?code=OvDpEYuEm8VeWwonuUtqmd&state=pNPqFnENSkyaalSNkH-LpHiAc2rGQT5ugW2YvA1HQ74


var name;
  for(name in data) {
    urlEncodedDataPairs.push(encodeURIComponent(name) + '=' + encodeURIComponent(data[name]));
  }
  urlEncodedData = urlEncodedDataPairs.join('&').replace(/%20/g, '+');
  XHR.open("POST",  baseUrl + "/hopsworks-remote-user-auth/api/remote/user/auth/oauth/login");
  XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  XHR.send(urlEncodedData);

  XHR.onload = function() {
    var jsonResponse = JSON.parse(XHR.responseText);
    if (XHR.status == 200) {
      document.cookie = "email=" + jsonResponse.data.value;
      localStorage.setItem('token', XHR.getResponseHeader('Authorization'));
      location.replace(baseUrl + '/hopsworks');
    } else if (XHR.status == 412) {
      var srtJSON = JSON.stringify(jsonResponse);
      sessionStorage.setItem('newRemoteUser', srtJSON);
      location.replace(baseUrl + '/hopsworks/#!/callback?code=' + encodeURIComponent(data['code']) + '&state=' +
      encodeURIComponent(data['state']));
    } else { // show the result
      var error = (typeof jsonResponse.usrMsg !== 'undefined')? jsonResponse.usrMsg : XHR.statusText;
      location.replace(baseUrl + '/hopsworks/#!/error?e=' + encodeURIComponent(error));
    }
  };

  XHR.onerror = function() {
    console.log("Request failed");
  };





var self = this;
            self.working = false;
            self.user = {code: $location.search()['code'], state: $location.search()['state'], chosenEmail: '',  consent: ''};
            var newRemoteUser = sessionStorage.getItem('newRemoteUser');
            sessionStorage.removeItem('newRemoteUser');
            self.remoteUser = newRemoteUser? JSON.parse(newRemoteUser) : undefined;
            var oidp = $cookies.get("openIdProviders");
            self.openIdProviders = oidp? JSON.parse(oidp) : undefined;
            $rootScope.oauthLoginErrorMsg = undefined;

            var showModal = function (user, remoteUser) {
                ModalService.remoteUserConsent('sm', remoteUser).then(function (success) {
                    if (success.val.consent) {
                        user.chosenEmail = success.val.chosenEmail;
                        user.consent = success.val.consent;
                        login(user);
                    } else {
                        user = {code: '', state: '', chosenEmail: '', consent: ''};
                        $location.replace('/login');
                    }
                }, function (error) {
                    user = {code: '', state: '', chosenEmail: '', consent: ''};
                    $location.replace('/login');
                });
            };

            var login = function (user) {
                AuthService.oauthLogin(user).then(function (success) {
                    self.working = false;
                    AuthService.saveToken(success.headers('Authorization'));
                    $cookies.put("email", success.data.data.value);
                    $location.path('/');
                }, function (error) {
                    if (error !== undefined && error.status === 412) {
                        self.errorMessage = '';
                        showModal(user, error.data);
                    } else {
                        $rootScope.oauthLoginErrorMsg = (typeof error.data.usrMsg !== 'undefined')? error.data.usrMsg : "";
                        $location.replace('/login');
                    }
                })
            };

            if (self.openIdProviders !== undefined && self.openIdProviders.length > 0 && self.user.code !== undefined &&
                self.user.state !== undefined) {
                if (self.remoteUser !== undefined) {
                    showModal(self.user, self.remoteUser);
                }
                // } else {
                //    login(self.user);
                // }

            } else {
                $rootScope.oauthLoginErrorMsg = "No login state found."
                $location.path('/login');
            }
