CREATE TABLE IF NOT EXISTS `ORDERS` (
	`id` int NOT NULL AUTO_INCREMENT,
	`user_id` bigint NOT NULL,
	`cook_id` bigint NOT NULL,
	`received_time` DATETIME NOT NULL,
	`realised_time` DATETIME,
	PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `COOK` (
	`id` int NOT NULL AUTO_INCREMENT,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	`title_id` int NOT NULL,
	`email` varchar(255) NOT NULL,
	`phone` char(9) NOT NULL,
	PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `TITLE` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `PIZZA` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`description` TEXT(255) NOT NULL,
	`vege` BOOLEAN(255) NOT NULL,
	`price` double(255) NOT NULL,
	`rating` double NOT NULL,
	`day_discounted` varchar(255) NOT NULL,
	`img_path` varchar(255) not null,
	PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `USER` (
	`id` int NOT NULL AUTO_INCREMENT,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`phone` char(9) NOT NULL,
	`login` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`city` varchar(255) NOT NULL,
	`postal_code` varchar(255) NOT NULL,
	`address` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `ORDER_PIZZA` (
    `id` int NOT NULL AUTO_INCREMENT,
	`order_id` bigint NOT NULL,
	`pizza_id` bigint NOT NULL,
	`pizza_quantity` bigint NOT NULL,
	`bought_on_discount` boolean NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `SAUCE` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`vege` BOOLEAN NOT NULL,
	`price` double NOT NULL,
	`rating` double NOT NULL,
	`day_discounted` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `ORDER_SAUCE` (
    `id` int NOT NULL AUTO_INCREMENT,
	`order_id` bigint NOT NULL,
	`sauce_id` bigint NOT NULL,
	`sauce_quantity` bigint NOT NULL,
	`bought_on_discount` boolean NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `ORDER_DRINK` (
    `id` int NOT NULL AUTO_INCREMENT,
	`order_id` bigint NOT NULL,
	`drink_id` bigint NOT NULL,
	`drink_quantity` bigint NOT NULL,
	`bought_on_discount` boolean NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `DRINK` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`price` double(255) NOT NULL,
	`rating` double NOT NULL,
	`day_discounted` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `ORDERS` ADD CONSTRAINT `ORDER_fk0` FOREIGN KEY (`user_id`) REFERENCES `USER`(`id`);

ALTER TABLE `ORDERS` ADD CONSTRAINT `ORDER_fk1` FOREIGN KEY (`cook_id`) REFERENCES `COOK`(`id`);

ALTER TABLE `COOK` ADD CONSTRAINT `COOK_fk0` FOREIGN KEY (`title_id`) REFERENCES `TITLE`(`id`);

ALTER TABLE `ORDER_PIZZA` ADD CONSTRAINT `ORDER_PIZZA_fk0` FOREIGN KEY (`order_id`) REFERENCES `ORDERS`(`id`);

ALTER TABLE `ORDER_PIZZA` ADD CONSTRAINT `ORDER_PIZZA_fk1` FOREIGN KEY (`pizza_id`) REFERENCES `PIZZA`(`id`);

ALTER TABLE `ORDER_SAUCE` ADD CONSTRAINT `ORDER_SAUCE_fk0` FOREIGN KEY (`order_id`) REFERENCES `ORDERS`(`id`);

ALTER TABLE `ORDER_SAUCE` ADD CONSTRAINT `ORDER_SAUCE_fk1` FOREIGN KEY (`sauce_id`) REFERENCES `SAUCE`(`id`);

ALTER TABLE `ORDER_DRINK` ADD CONSTRAINT `ORDER_DRINK_fk0` FOREIGN KEY (`order_id`) REFERENCES `ORDERS`(`id`);

ALTER TABLE `ORDER_DRINK` ADD CONSTRAINT `ORDER_DRINK_fk1` FOREIGN KEY (`drink_id`) REFERENCES `DRINK`(`id`);

