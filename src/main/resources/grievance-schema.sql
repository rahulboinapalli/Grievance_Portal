CREATE TABLE `grievance_details` (
                     `member_id` bigint(20) NOT NULL AUTO_INCREMENT,
                     `SSN` bigint(15) DEFAULT '0',
                     `member_name` varchar(765) DEFAULT 'NULL',
                     `request_type` varchar(765) DEFAULT 'NULL',
                     `request_date` datetime DEFAULT NULL,
                     `email_id` varchar(765) DEFAULT 'NULL',
                     `contact_no` bigint(15) DEFAULT '0',
                     `comments` varchar(765) DEFAULT 'NULL',
                     `file` blob,
                     PRIMARY KEY (`member_id`)
                   );