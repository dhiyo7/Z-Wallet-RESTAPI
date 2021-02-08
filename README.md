
<h1 align="center">Zwallet Backend</h1>
<p>This is the dependency of <a href="https://github.com/GasPoll-Team/Z-Wallet-React-Native">Zwallet App</a>.
  
Built with NodeJs using the <a href="https://en.wikipedia.org/wiki/Express.js">Express.Js</a> Framework.


Express.js is a web application framework for Node.js.</p> 


## Contents

  

-  [Description](#description)

-  [Requirements](#requirements)

-  [Installation](#installation)

-  [Endpoint](#endpoint)

-  [Documentation](#documentation)

-  [Related Project](#related-project)

  

## Description

  

This is RESTful api design for

[`Zwallet App frontend`](https://github.com/GasPoll-Team/Z-Wallet-React-Native).

Built with Node js, using ExpressJs framework and other libraries.

  

## Requirements

  

-  [`Node Js`](https://nodejs.org/en/)

-  [`npm`](https://www.npmjs.com/get-npm)

-  [`ExpressJs`](https://expressjs.com/)

-  [`Postman`](https://www.postman.com/downloads/)

-  [`Remote MYSQL`](https://remotemysql.com/phpmyadmin/index.php)

  

## Installation

  

1. Open your terminal or command prompt

2. Type `git clone https://github.com/GasPoll-Team/Z-Wallet-React-Native.git`

3. Open the folder and type `yarn install` or `npm install` for install dependencies

4. Register an account at **[RemoteMysql](https://remotemysql.com/)** and create new database

5. Create file **_.env_** in root folder with the following contents :

  

```bash

MYSQL_HOST = "remotemysql.com"
MYSQL_USER = "remotemysqldb_user"
MYSQL_PASS = "remotemysqldb_pass"
MYSQL_DATABASE = "remotemysqldb"
HOSTNAME = "your_localhost"
SECRET_KEY = "VERY_SECRET_KEY"

USER_EMAIL = EMAIL
PASS_EMAIL = PASSWORD

```

  

Customize each value with the one you are using.

  

Example:

  

```bash

MYSQL_HOST = 'localhost'
MYSQL_USERNAME = 'root'
MYSQL_DATABASE = 'zwallet_db'
MYSQL_PASSWORD = ''

USER_EMAIL= yourname@gmail.com
PASS_EMAIL= your-email-password
SECRET_KEY='VERY-SECRET-KEY'

```
 

6. Type `npm run server` or `npm start` in terminal for run this backend.

  

## Endpoint
 

### Auth Router

**Used for authentication**

| No. | Method | Endpoint                     | Information                      |
| --- | ------ | ---------------------------- | -------------------------------- |
| 1.  | POST   | /auth/signup                 | Used for signup new user.        |
| 2.  |        | /auth/login                  | Used for login into app.         |
| 3.  |        | /auth/forgot                 | Used for forgot password.        |
| 4.  | GET    | /auth/activate/:email/:token | Used for activating new account. |
| 5.  |        | /auth/checkPIN/:pin          | Used for checking PIN .          |
| 6.  | PATCH  | /auth/PIN                    | Used for set PIN / update PIN.   |
| 7.  |        | /auth/reset                  | Used for reseting password.     |
| 8.  | DELETE | /auth/logout/:token          | Used for logout from system.     |
  


### Home Router
**Used for supplying data to home, history, and notification**

| No. | Method | Endpoint            | Information                                                   |
| --- | ------ | ------------------- | ------------------------------------------------------------- |
| 1.  | GET    | /home/getBalance    | Used for get balance user that are logged in.                 |
| 2.  |        | /home/getInvoice    | Used for get invoice (**IN** or **OUT**) with some range date |
| 3.  |        | /home/getAllInvoice | Used for get **ALL** invoices with some range date            |
  

### Topup Router
**Used for topup any balance to user**

| No. | Method. | Endpoint            | Information                                                    |
| --- | ------- | ------------------- | -------------------------------------------------------------- |
| 1.  | PATCH   | /topup/topupBalance | Used for topup any virtual number matched on user phone number |
 
### Tranfer Router
**Used to all about tranfer feature needed**

| No. | Method | Endpoint             | Information                             |
| --- | ------ | -------------------- | --------------------------------------- |
| 1.  | POST   | /tranfer/newTranfer  | Used to create new tranfer.             |
| 2.  | GET    | /tranfer/search      | Used to search any recipient.           |
| 3.  |        | /tranfer/contactUser | Used to get all contact data.           |
| 4.  |        | /tranfer/details/:id | Used to get details of tranfer history. |

### User Router
**Used for any user feature**

| No. | Method | Endpoint             | Information                                                |
| --- | ------ | -------------------- | ---------------------------------------------------------- |
| 1.  | GET    | /user/myProfile      | Used for get all data user that are logged in.             |
| 2.  | PATCH  | /user/changePassword | Used to change password for user.                          |
| 3.  |        | /user/changeInfo     | Used to change any info for example name and phone number. |
| 4.  |        | /user/changePhoto    | Used to change profile picture for user.                   |

## Documentation

For more documentation , check it out below!

<a  href="https://documenter.getpostman.com/view/13530339/TW6xoU7C">

<img  src="https://img.shields.io/badge/Documentation-POSTMAN-blue.svg?style=popout&logo=postman"/>

</a>

  

## Related Project

  

Frontend Zwallet App that use this RESTful API.

  

<a  href="https://github.com/GasPoll-Team/Z-Wallet-React-Native">

<img  src="https://img.shields.io/badge/Zwallet%20Frontend-Repository-blue.svg?style=popout&logo=github"/>

</a>
