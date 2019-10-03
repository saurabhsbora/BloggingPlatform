# BloggingPlatform
A simple java based web application for blogging with design clone of a popular blogging platform [Medium](https://medium.com/).  

![Home Page](https://raw.githubusercontent.com/enthussb/BloggingPlatform/master/screenshots/Home.png)

## Functionalities
- User Registration & Authentication
- Session Management
- Create a blog post with an image and assign a category
- Display posts in multiple layouts and by categories
- Profile to keep count of all your posts and personal details
- Admin can publish posts globally for all the users

## Development Environment
- JDK 8
- Mysql Server
- Eclipse IDE with web tools platform package
- Required JARs
  - jstl-1.2
  - mysql-connector-java-5.1.46
  - servlet-api
- Apache Tomcat v8.5

## Database Schema
```
CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `image` longblob,
  `content` varchar(50000) DEFAULT NULL,
  `authorname` varchar(35) DEFAULT NULL,
  `category` varchar(25) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
)

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
)
```

## How To Run this application
1. Clone this repository
2. Configure the environment for this web application
3. Deploy and run on tomcat
4. Open your browser and navigate to `http://localhost:8080/BloggingPlatform/`

## Technology Stack
- Frontend - HTML, CSS, JavaScript, jQuery
- Backend - JSP, Servlet, MySQL
