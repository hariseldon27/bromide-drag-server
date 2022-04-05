# README

End points and notes

get info back to see if you're logged in
/member-data
be sure to set the Headers: 'Authentication': 'Bearer <auth key from header on sign-in or sign-up>
nothing in body - header only with Auth token

Signup route
post /users 

```
    "user": {
        "email": "email@email.com",
        "password": "password"
    }
```

Sign-in route
post /users/sign_in
be sure to capture header Authentication token and store in state
```
    "user": {
        "email":"email@email.com",
        "password":"password"
    }
```

Sign-out route
delete /users/sign_out
send the auth token in header
