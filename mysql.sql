CREATE TABLE `user` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`username` varchar(20) DEFAULT NULL,
`password` varchar(50) DEFAULT NULL,
`usertoken` varchar(50) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `words` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`usertoken` varchar(50) DEFAULT NULL,
`src` varchar(50) DEFAULT NULL,
`total` int(11) DEFAULT '0',
`right` int(11) DEFAULT '0',
`wordstoken` int(50) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into user (username,password) value('feng',password('root'));
