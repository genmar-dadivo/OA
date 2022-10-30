-- FETCH STATEMENT
SELECT 
	u.name, 
    u.email, 
    (SELECT m.meta_value FROM tbl_users_meta m WHERE m.user_id = u.id AND m.meta_key = 'ip_address') AS ip_address,
    (SELECT m.meta_value FROM tbl_users_meta m WHERE m.user_id = u.id AND m.meta_key = 'user_agent') AS user_agent,
    (SELECT GROUP_CONCAT(i.url_path SEPARATOR '\n') FROM tbl_users_image i WHERE i.user_id = u.id) AS path
FROM `tbl_users` u;



-- TABLES

-- tbl_users
/* SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tbl_users` (`id`, `email`, `name`, `password`, `created_at`) VALUES
(1, 'john@test.com', 'John', '$$92u394ssfES', '2021-12-01 06:00:09'),
(2, 'jane@test.com', 'Jane', 'W$29#sdsDWW', '2021-12-01 17:07:33');

ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

  ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT; */

-- tbl_usrs_meta
/* SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `tbl_users_meta` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `meta_key` varchar(50) NOT NULL,
  `meta_value` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tbl_users_meta` (`id`, `user_id`, `meta_key`, `meta_value`, `created_at`) VALUES
(1, 1, 'ip_address', '127.0.0.1', '2021-12-01 13:11:08'),
(2, 1, 'referrer', 'google.com', '2021-12-01 06:00:09'),
(3, 1, 'user_agent', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.3', '2021-12-01 06:00:09'),
(4, 2, 'ip_address', '192.168.1.1', '2021-12-01 17:07:33'),
(5, 2, 'referrer', 'bing.com', '2021-12-01 17:07:33'),
(6, 2, 'user_agent', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '2021-12-01 17:07:33');

ALTER TABLE `tbl_users_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `tbl_users_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `tbl_users_meta`
  ADD CONSTRAINT `tbl_users_meta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`),
  ADD CONSTRAINT `tbl_users_meta_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`);
COMMIT; */


-- tbl_users_image
/* SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `tbl_users_image` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `url_path` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `tbl_users_image` (`id`, `user_id`, `url_path`, `created_at`) VALUES
(1, 1, 'www.test.com/img/sample1.png', '2021-12-01 06:00:09'),
(2, 1, 'www.test.com/img/sample2.png', '2021-12-01 06:00:09'),
(3, 1, 'www.test.com/img/sample3.png', '2021-12-01 06:00:09'),
(4, 2, 'www.test.com/img/sample4.png', '2021-12-01 17:07:33'),
(5, 2, 'www.test.com/img/sample5.png', '2021-12-01 17:07:33'),
(6, 2, 'www.test.com/img/sample6.png', '2021-12-01 17:07:33');

ALTER TABLE `tbl_users_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `tbl_users_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `tbl_users_image`
  ADD CONSTRAINT `tbl_users_image_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`);
COMMIT; */