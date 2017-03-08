

insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (1,'权限','','',NULL,0,'0/','0','1'),(11,'商品管理','menu','/item/queryItem.action',NULL,1,'0/1/','1.','1'),(12,'商品新增','permission','/item/add.action','item:create',11,'0/1/11/','','1'),(13,'商品修改','permission','/item/editItem.action','item:update',11,'0/1/11/','','1'),(14,'商品删除','permission','','item:delete',11,'0/1/11/','','1'),(15,'商品查询','permission','/item/queryItem.action','item:query',11,'0/1/15/',NULL,'1'),(21,'用户管理','menu','/user/query.action','user:query',1,'0/1/','2.','1'),(22,'用户新增','permission','','user:create',21,'0/1/21/','','1'),(23,'用户修改','permission','','user:update',21,'0/1/21/','','1'),(24,'用户删除','permission','','user:delete',21,'0/1/21/','','1');


insert  into `sys_role`(`id`,`name`,`available`) values ('ebc8a441-c6f9-11e4-b137-0adc305c3f28','商品管理员','1'),('ebc9d647-c6f9-11e4-b137-0adc305c3f28','用户管理员','1');


insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('ebc8a441-c6f9-11e4-b137-0adc305c3f21','ebc8a441-c6f9-11e4-b137-0adc305c','12'),('ebc8a441-c6f9-11e4-b137-0adc305c3f22','ebc8a441-c6f9-11e4-b137-0adc305c','11'),('ebc8a441-c6f9-11e4-b137-0adc305c3f24','ebc9d647-c6f9-11e4-b137-0adc305c','21'),('ebc8a441-c6f9-11e4-b137-0adc305c3f25','ebc8a441-c6f9-11e4-b137-0adc305c','15'),('ebc9d647-c6f9-11e4-b137-0adc305c3f23','ebc9d647-c6f9-11e4-b137-0adc305c','22'),('ebc9d647-c6f9-11e4-b137-0adc305c3f26','ebc8a441-c6f9-11e4-b137-0adc305c','13');


insert  into `sys_user`(`id`,`usercode`,`username`,`password`,`salt`,`locked`) values ('lisi','lisi','李四','bf07fd8bbc73b6f70b8319f2ebb87483','uiwueylm','0'),('zhangsan','zhangsan','张三','cb571f7bd7a6f73ab004a70322b963d5','eteokues','0');


insert  into `sys_user_role`(`id`,`sys_user_id`,`sys_role_id`) values ('ebc8a441-c6f9-11e4-b137-0adc305c3f28','zhangsan','ebc8a441-c6f9-11e4-b137-0adc305c'),('ebc9d647-c6f9-11e4-b137-0adc305c3f28','lisi','ebc9d647-c6f9-11e4-b137-0adc305c');

