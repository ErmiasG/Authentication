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

{
    "access_token":"eyJraWQiOiJyc2ExIiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJ1c2VyIiwiYXpwIjoiZjUwNWNjOGMtZmI3ZS00ZjZhLTliMzgtY2ZlNDYzYTA1ODc4IiwiaXNzIjoiaHR0cDpcL1wvbG9jYWxob3N0OjgwODBcL29wZW5pZC1jb25uZWN0LXNlcnZlci13ZWJhcHBcLyIsImV4cCI6MTU1MTAzMjIxNiwiaWF0IjoxNTUxMDI4NjE2LCJqdGkiOiI1YjE0MDViOC00NjFmLTQxYzYtOTNmZC05M2E5MjY4ZmFmOWMifQ.ikv7W3dGGt8o0Wue5hPMejb0mJATLNO2uzq7fs-5vSOGw5vm1Dij7msIHCv0WZYOoVk0E4xOjj8LF9rV4N_IqJrs5NG_m7bwY3g_5ZODu9EC9kNtYLM0v_jeg4yNcbnYITu52-PDa7SMyMg8Ovd8dIV1a6hkgZKlfDmvllZ03OIsQuAy0gLQpLRL6Q91TZiTKHGrdpY_jcw4UM9gfiABuesixKlLpknhLZF_JI5sAr68gAzFK4FV6m239ngSa-HVIsKAiikDBotM1vQF1r5_0xmSxGVPnO2gc5AF--9r9EfR0DiuGQbdCvOnxA9pSAnqmlNZekJtQ64a7uv40zQm4w","token_type":"Bearer","expires_in":3599,"scope":"openid email profile","id_token":"eyJraWQiOiJyc2ExIiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiIwMTkyMS5GTEFOUkpRVyIsImF1ZCI6ImY1MDVjYzhjLWZiN2UtNGY2YS05YjM4LWNmZTQ2M2EwNTg3OCIsImF1dGhfdGltZSI6MTU1MTAyODYwMiwia2lkIjoicnNhMSIsImlzcyI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgwXC9vcGVuaWQtY29ubmVjdC1zZXJ2ZXItd2ViYXBwXC8iLCJleHAiOjE1NTEwMjkyMTYsImlhdCI6MTU1MTAyODYxNiwianRpIjoiYmEyZGZlNjEtMzA5ZC00YzI3LWJlNzQtNDU2ZWY5YzBkODgzIn0.jlzgldjdrJZrW9meQ2wouiBrt1ComV5Pd49ejIZNJv70bMbv8ufCzhUG9t6nIH1PTnkkChfdbwikh0Z971rZA9-KFInxnUU9574p0oxv2PBq0rs7uNavji7JRT7lRjvhu-8w1eWMXkLI0XjCEPFTLhwt6o_YjlrwrkAk7wMmg3tDrKp3AlJpXyPyiE3RA3cp52SA-vT9fLZ9e2s_BrXVHIyISQ5P_-g6aJ3wdNBLFIUgZO6LFvNE9wDcyyIHW3FV7d1UfiL76bzy3-Roh_3l2OE4LUOifwUzRdQUNiIHjd9j8KliqG7-9SMagkO12YCSMkDhWZ0Nk3ZQEdEq4sVJBA"
}

# use access token to get user info
curl --header "Authorization: Bearer eyJraWQiOiJyc2ExIiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJ1c2VyIiwiYXpwIjoiZjUwNWNjOGMtZmI3ZS00ZjZhLTliMzgtY2ZlNDYzYTA1ODc4IiwiaXNzIjoiaHR0cDpcL1wvbG9jYWxob3N0OjgwODBcL29wZW5pZC1jb25uZWN0LXNlcnZlci13ZWJhcHBcLyIsImV4cCI6MTU1MTAzMjIxNiwiaWF0IjoxNTUxMDI4NjE2LCJqdGkiOiI1YjE0MDViOC00NjFmLTQxYzYtOTNmZC05M2E5MjY4ZmFmOWMifQ.ikv7W3dGGt8o0Wue5hPMejb0mJATLNO2uzq7fs-5vSOGw5vm1Dij7msIHCv0WZYOoVk0E4xOjj8LF9rV4N_IqJrs5NG_m7bwY3g_5ZODu9EC9kNtYLM0v_jeg4yNcbnYITu52-PDa7SMyMg8Ovd8dIV1a6hkgZKlfDmvllZ03OIsQuAy0gLQpLRL6Q91TZiTKHGrdpY_jcw4UM9gfiABuesixKlLpknhLZF_JI5sAr68gAzFK4FV6m239ngSa-HVIsKAiikDBotM1vQF1r5_0xmSxGVPnO2gc5AF--9r9EfR0DiuGQbdCvOnxA9pSAnqmlNZekJtQ64a7uv40zQm4w" http://localhost:8080/openid-connect-server-webapp/userinfo

{
    "sub":"01921.FLANRJQW",
    "name":"Demo User",
    "preferred_username":"user",
    "email":"user@example.com",
    "email_verified":true
}


396865ce-dc53-4868-bcca-68fafc4f7c53
AOGS8nmOTacQQQElA2aSm_2d9KeFWuFTkVmQlR6j7LRTp1YG1K20Hc-5IRzMjgOwdgu0s_EYlafGnAKp0C40kSw
MITREid
http://10.112.10.35:8080/openid-connect-server-webapp/resources/images/openid_connect_small.png
http://10.112.10.35:8080/openid-connect-server-webapp
