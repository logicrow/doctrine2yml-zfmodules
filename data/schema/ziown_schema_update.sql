ALTER TABLE `form_fields_data` CHANGE `data` `data` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `form_fields_data` CHANGE `email_id` `forms_data_id` INT( 11 ) NOT NULL DEFAULT '0';
ALTER TABLE `forms` ADD INDEX ( `slug` );
ALTER TABLE `forms` ADD INDEX ( `status` );
ALTER TABLE `forms` ADD INDEX ( `theme_id` );
ALTER TABLE `fields` ADD INDEX ( `type` );
ALTER TABLE `forms_data` ADD INDEX ( `form_id` );
ALTER TABLE `form_fields_data` ADD INDEX ( `forms_data_id` );
ALTER TABLE `form_fields_data` ADD INDEX ( `field_id` );
ALTER TABLE `forms` CHANGE `user_id` `user_id` INT( 11 ) UNSIGNED NOT NULL;
ALTER TABLE `forms` CHANGE `status` `status` SMALLINT NOT NULL;
ALTER TABLE `forms` CHANGE `status` `status` SMALLINT( 6 ) UNSIGNED NOT NULL;
ALTER TABLE `forms` ADD FOREIGN KEY ( `user_id` ) REFERENCES `ziown`.`users` (`id`);

ALTER TABLE `forms` ADD FOREIGN KEY ( `status` ) REFERENCES `ziown`.`user_statuses` (`id`);

ALTER TABLE `forms` ADD FOREIGN KEY ( `theme_id` ) REFERENCES `ziown`.`themes` (`id`);

ALTER TABLE `fields` ADD FOREIGN KEY ( `form_id` ) REFERENCES `ziown`.`forms` (`id`);

ALTER TABLE `fields` ADD FOREIGN KEY ( `type` ) REFERENCES `ziown`.`field_types` (`id`);

ALTER TABLE `forms_data` ADD FOREIGN KEY ( `form_id` ) REFERENCES `ziown`.`forms` (`id`);

ALTER TABLE `form_fields_data` ADD FOREIGN KEY ( `forms_data_id` ) REFERENCES `ziown`.`forms_data` (`id`);

ALTER TABLE `form_fields_data` ADD FOREIGN KEY ( `field_id` ) REFERENCES `ziown`.`fields` (`id`);

ALTER TABLE `user_themes` CHANGE `user_id` `user_id` INT( 11 ) UNSIGNED NOT NULL;

ALTER TABLE `user_themes` ADD INDEX ( `theme_id` );

ALTER TABLE `user_themes` ADD FOREIGN KEY ( `user_id` ) REFERENCES `ziown`.`users` (`id`);

ALTER TABLE `user_themes` ADD FOREIGN KEY ( `theme_id` ) REFERENCES `ziown`.`themes` (`id`);

DROP TABLE `user_themes`;
ALTER TABLE `themes` ADD FOREIGN KEY ( `user_id` ) REFERENCES `ziown`.`users` (
`id`
);


 
