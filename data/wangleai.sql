/*
Navicat MySQL Data Transfer

Source Server         : wangleai
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : wangleai

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2015-11-22 00:22:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `wla_active_record`
-- ----------------------------
DROP TABLE IF EXISTS `wla_active_record`;
CREATE TABLE `wla_active_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `dateline` int(11) NOT NULL COMMENT '操作时间',
  `ip` char(255) NOT NULL COMMENT '操作IP',
  `module` varchar(255) NOT NULL COMMENT '操作模块',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='用户操作记录表';

-- ----------------------------
-- Records of wla_active_record
-- ----------------------------
INSERT INTO `wla_active_record` VALUES ('1', '1', '1447575305', '127.0.0.1', 'admin/index/index');
INSERT INTO `wla_active_record` VALUES ('2', '1', '1447575309', '127.0.0.1', 'admin/user/index');
INSERT INTO `wla_active_record` VALUES ('3', '1', '1447575311', '127.0.0.1', 'admin/user/details');
INSERT INTO `wla_active_record` VALUES ('4', '1', '1447575634', '127.0.0.1', 'admin/user/details');
INSERT INTO `wla_active_record` VALUES ('5', '1', '1447575707', '127.0.0.1', 'admin/user/details');
INSERT INTO `wla_active_record` VALUES ('6', '1', '1447575786', '127.0.0.1', 'admin/index/logout');
INSERT INTO `wla_active_record` VALUES ('7', '2', '1447575804', '127.0.0.1', 'admin/index/index');
INSERT INTO `wla_active_record` VALUES ('8', '2', '1447575818', '127.0.0.1', 'admin/index/index');
INSERT INTO `wla_active_record` VALUES ('9', '2', '1447575830', '127.0.0.1', 'admin/index/index');
INSERT INTO `wla_active_record` VALUES ('10', '2', '1447576033', '127.0.0.1', 'admin/index/logout');
INSERT INTO `wla_active_record` VALUES ('11', '1', '1447576042', '127.0.0.1', 'admin/index/index');
INSERT INTO `wla_active_record` VALUES ('12', '1', '1447576044', '127.0.0.1', 'admin/user/index');
INSERT INTO `wla_active_record` VALUES ('13', '1', '1447576045', '127.0.0.1', 'admin/user/details');
INSERT INTO `wla_active_record` VALUES ('14', '1', '1447576058', '127.0.0.1', 'admin/user/details');
INSERT INTO `wla_active_record` VALUES ('15', '1', '1447576598', '127.0.0.1', '/index.php/Admin/Index/index');
INSERT INTO `wla_active_record` VALUES ('16', '1', '1447576601', '127.0.0.1', '/index.php/Admin/User/index');
INSERT INTO `wla_active_record` VALUES ('17', '1', '1447576605', '127.0.0.1', '/index.php/Admin/User/details/id/1');
INSERT INTO `wla_active_record` VALUES ('18', '1', '1447576613', '127.0.0.1', '/index.php/Admin/User/updateUser/id/1');
INSERT INTO `wla_active_record` VALUES ('19', '1', '1447576617', '127.0.0.1', '/index.php/Admin/Index/index');
INSERT INTO `wla_active_record` VALUES ('20', '1', '1447576619', '127.0.0.1', '/index.php/Admin/User/index');
INSERT INTO `wla_active_record` VALUES ('21', '1', '1447576620', '127.0.0.1', '/index.php/Admin/User/details/id/1');

-- ----------------------------
-- Table structure for `wla_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `wla_auth_group`;
CREATE TABLE `wla_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `rules` char(80) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id,多个规则","隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of wla_auth_group
-- ----------------------------
INSERT INTO `wla_auth_group` VALUES ('1', '管理员', '1', '18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1');
INSERT INTO `wla_auth_group` VALUES ('2', '作者', '1', '6');

-- ----------------------------
-- Table structure for `wla_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `wla_auth_group_access`;
CREATE TABLE `wla_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组明细表';

-- ----------------------------
-- Records of wla_auth_group_access
-- ----------------------------
INSERT INTO `wla_auth_group_access` VALUES ('1', '1');
INSERT INTO `wla_auth_group_access` VALUES ('3', '2');

-- ----------------------------
-- Table structure for `wla_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `wla_auth_rule`;
CREATE TABLE `wla_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则ID',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '规则类型，如果type为1，condition字段就可以定义规则表达式。 如定义{score}>5  and {score}<100  表示用户的分数在5-100之间时这条规则才会通过。',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '规则附件条件,满足附加条件的规则,才认为是有效的规则',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of wla_auth_rule
-- ----------------------------
INSERT INTO `wla_auth_rule` VALUES ('1', 'Admin/User/index', '用户列表', '1', '1', '');
INSERT INTO `wla_auth_rule` VALUES ('2', 'Admin/User/details', '用户详情', '1', '1', '');
INSERT INTO `wla_auth_rule` VALUES ('3', 'Admin/User/addUser', '添加用户', '1', '1', '');
INSERT INTO `wla_auth_rule` VALUES ('4', 'Admin/User/updateUser', '修改用户', '1', '1', '');
INSERT INTO `wla_auth_rule` VALUES ('5', 'Admin/User/deleteUser', '删除用户', '1', '1', '');
INSERT INTO `wla_auth_rule` VALUES ('6', 'Admin/User/group', '角色列表', '1', '1', '');
INSERT INTO `wla_auth_rule` VALUES ('7', 'Admin/User/addGroup', '添加角色', '1', '1', '');
INSERT INTO `wla_auth_rule` VALUES ('8', 'Admin/User/updateGroup', '修改角色', '1', '1', '');
INSERT INTO `wla_auth_rule` VALUES ('9', 'Admin/User/rule', '规则列表', '1', '1', '');
INSERT INTO `wla_auth_rule` VALUES ('10', 'Admin/User/addRule', '添加规则', '1', '1', '');
INSERT INTO `wla_auth_rule` VALUES ('11', 'Admin/User/updateRule', '修改规则', '1', '1', '');
INSERT INTO `wla_auth_rule` VALUES ('12', 'Admin/User/addUserForm', '添加用户表单', '1', '1', '');
INSERT INTO `wla_auth_rule` VALUES ('13', 'Admin/User/updateUserForm', '修改用户表单', '1', '1', '');
INSERT INTO `wla_auth_rule` VALUES ('14', 'Admin/User/addGroupForm', '添加角色表单', '1', '1', '');
INSERT INTO `wla_auth_rule` VALUES ('15', 'Admin/User/updateGroupForm', '修改角色表单', '1', '1', '');
INSERT INTO `wla_auth_rule` VALUES ('16', 'Admin/User/addRuleForm', '添加规则表单', '1', '1', '');
INSERT INTO `wla_auth_rule` VALUES ('17', 'Admin/User/updateRuleForm', '修改规则表单', '1', '1', '');
INSERT INTO `wla_auth_rule` VALUES ('18', 'Admin/User/upload', '上传头像', '1', '1', '');

-- ----------------------------
-- Table structure for `wla_comments`
-- ----------------------------
DROP TABLE IF EXISTS `wla_comments`;
CREATE TABLE `wla_comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `comment_post_id` bigint(20) NOT NULL COMMENT '所属文章ID',
  `comment_author` tinytext NOT NULL COMMENT '评论者',
  `comment_author_email` varchar(100) NOT NULL COMMENT '评论者email',
  `comment_author_url` varchar(200) NOT NULL COMMENT '评论者URL',
  `comment_author_ip` varchar(15) NOT NULL COMMENT '评论者IP',
  `created_at` int(11) NOT NULL COMMENT '评论时间',
  `comment_content` text NOT NULL COMMENT '评论内容',
  `comment_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评论状态(0:审核;1:正常;2:垃圾;)',
  `comment_agent` varchar(255) NOT NULL COMMENT '评论者浏览器信息',
  `comment_parent` bigint(20) NOT NULL DEFAULT '0' COMMENT '父评论ID',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '评论用户ID',
  PRIMARY KEY (`comment_id`),
  KEY `comment_author_email` (`comment_author_email`) USING BTREE,
  KEY `comment_parent` (`comment_parent`) USING BTREE,
  KEY `comment_post_id` (`comment_post_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论表';

-- ----------------------------
-- Records of wla_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `wla_posts`
-- ----------------------------
DROP TABLE IF EXISTS `wla_posts`;
CREATE TABLE `wla_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `post_author` varchar(255) NOT NULL COMMENT '文章作者',
  `created_at` int(11) NOT NULL COMMENT '发布时间',
  `post_title` text NOT NULL COMMENT '文章标题',
  `post_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '文章类型(0:普通;1:心情;2:音乐;3:图片;4:视频;)',
  `post_description` text NOT NULL COMMENT '文章描述',
  `post_content` longtext NOT NULL COMMENT '文章内容',
  `post_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '文章状态(0:发布;1:草稿;2:垃圾箱)',
  `comment_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评论状态(0:可以评论;1:不能评论)',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论总数',
  `click_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `post_author` (`post_author`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of wla_posts
-- ----------------------------
INSERT INTO `wla_posts` VALUES ('1', '测试账号001', '1448018992', 'PHP函数定义', '0', '怎样定义PHP函数', '&lt;pre class=&quot;brush:php;toolbar:false&quot;&gt;&amp;lt;?php\r\nfunction&amp;nbsp;test(){\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;echo&amp;nbsp;&amp;quot;This&amp;nbsp;is&amp;nbsp;a&amp;nbsp;test&amp;nbsp;function;&amp;quot;;\r\n}\r\n?&amp;gt;&lt;/pre&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '0', '0', '0');
INSERT INTO `wla_posts` VALUES ('2', '测试账号001', '1448031303', 'Thinkphp多对多模型定义', '0', 'Thinkphp多对多模型定义', '&lt;pre class=&quot;brush:php;toolbar:false&quot;&gt;protected&amp;nbsp;$_link&amp;nbsp;=&amp;nbsp;[\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;quot;Terms&amp;quot;&amp;nbsp;=&amp;gt;&amp;nbsp;[//标签\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;#39;mapping_type&amp;#39;&amp;nbsp;=&amp;gt;&amp;nbsp;self::MANY_TO_MANY,//与POSTS表关联方式\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;#39;class_name&amp;#39;&amp;nbsp;=&amp;gt;&amp;nbsp;&amp;#39;Terms&amp;#39;,//关联表的类名\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;#39;mapping_name&amp;#39;&amp;nbsp;=&amp;gt;&amp;nbsp;&amp;#39;terms&amp;#39;,//关联表数据外层键值,不能与POSTS表字段重复\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;#39;foreign_key&amp;#39;&amp;nbsp;=&amp;gt;&amp;nbsp;&amp;#39;post_id&amp;#39;,//POSTS表外键\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;#39;relation_foreign_key&amp;#39;&amp;nbsp;=&amp;gt;&amp;nbsp;&amp;#39;term_id&amp;#39;,//关联表外键\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;#39;relation_table&amp;#39;&amp;nbsp;=&amp;gt;&amp;nbsp;&amp;#39;wla_post_term&amp;#39;,//中间表名称\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;],\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;quot;Property&amp;quot;&amp;nbsp;=&amp;gt;&amp;nbsp;[//属性\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;#39;mapping_type&amp;#39;&amp;nbsp;=&amp;gt;&amp;nbsp;self::MANY_TO_MANY,\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;#39;class_name&amp;#39;&amp;nbsp;=&amp;gt;&amp;nbsp;&amp;#39;Property&amp;#39;,\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;#39;mapping_name&amp;#39;&amp;nbsp;=&amp;gt;&amp;nbsp;&amp;#39;property&amp;#39;,\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;#39;foreign_key&amp;#39;&amp;nbsp;=&amp;gt;&amp;nbsp;&amp;#39;post_id&amp;#39;,\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;#39;relation_foreign_key&amp;#39;&amp;nbsp;=&amp;gt;&amp;nbsp;&amp;#39;property_id&amp;#39;,\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;#39;relation_table&amp;#39;&amp;nbsp;=&amp;gt;&amp;nbsp;&amp;#39;wla_post_property&amp;#39;,\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;],\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;];&lt;/pre&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '0', '0', '0', '0');
INSERT INTO `wla_posts` VALUES ('3', '测试账号001', '1448114675', '测试一篇新文章1', '0', '测试一篇新文章1', '&lt;p&gt;测试一篇新文章11&lt;/p&gt;', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `wla_post_property`
-- ----------------------------
DROP TABLE IF EXISTS `wla_post_property`;
CREATE TABLE `wla_post_property` (
  `post_id` int(11) NOT NULL COMMENT '文章ID',
  `property_id` int(11) NOT NULL COMMENT '属性ID',
  KEY `post_id` (`post_id`) USING BTREE,
  KEY `property_id` (`property_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章和属性中间表';

-- ----------------------------
-- Records of wla_post_property
-- ----------------------------
INSERT INTO `wla_post_property` VALUES ('1', '2');
INSERT INTO `wla_post_property` VALUES ('1', '1');
INSERT INTO `wla_post_property` VALUES ('3', '3');
INSERT INTO `wla_post_property` VALUES ('2', '1');
INSERT INTO `wla_post_property` VALUES ('3', '2');
INSERT INTO `wla_post_property` VALUES ('3', '1');

-- ----------------------------
-- Table structure for `wla_post_term`
-- ----------------------------
DROP TABLE IF EXISTS `wla_post_term`;
CREATE TABLE `wla_post_term` (
  `post_id` bigint(20) NOT NULL COMMENT '博客ID',
  `term_id` bigint(20) NOT NULL COMMENT '对应term_taxonomy表中的term_taxonomy_id',
  KEY `term_id` (`term_id`) USING BTREE,
  KEY `post_id` (`post_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='关系表，多对多的，object_id是与不同的对象关联。\r\n从这个表可以获得一篇文章与标签、分类之间的关系，object_id为博文的ID，term_taxonomy_id为wp_term_taxonomy表中相应的标签、分类的ID。';

-- ----------------------------
-- Records of wla_post_term
-- ----------------------------
INSERT INTO `wla_post_term` VALUES ('1', '28');
INSERT INTO `wla_post_term` VALUES ('2', '11');
INSERT INTO `wla_post_term` VALUES ('1', '7');
INSERT INTO `wla_post_term` VALUES ('3', '1');

-- ----------------------------
-- Table structure for `wla_property`
-- ----------------------------
DROP TABLE IF EXISTS `wla_property`;
CREATE TABLE `wla_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property` varchar(255) NOT NULL COMMENT '属性名',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '属性状态(1:启用;0:关闭)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文章属性表';

-- ----------------------------
-- Records of wla_property
-- ----------------------------
INSERT INTO `wla_property` VALUES ('1', '置顶', '1');
INSERT INTO `wla_property` VALUES ('2', '推荐', '1');
INSERT INTO `wla_property` VALUES ('3', '头条', '1');

-- ----------------------------
-- Table structure for `wla_terms`
-- ----------------------------
DROP TABLE IF EXISTS `wla_terms`;
CREATE TABLE `wla_terms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(200) NOT NULL COMMENT '链接名',
  `slug` varchar(200) NOT NULL COMMENT '分类、标签缩写',
  `sort` smallint(6) NOT NULL DEFAULT '100' COMMENT '排序',
  `taxonomy` smallint(6) NOT NULL COMMENT '类型(0:category;1:tag;)',
  `description` longtext COMMENT '分类图片描述、标签描述',
  `parent` bigint(20) NOT NULL DEFAULT '0' COMMENT '父类ID',
  `term_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类下文章数量、当前标签所拥有文章数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `term_id` (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `slug` (`slug`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='记录分类、标签的一些简要信息，包括名称，缩写。\r\n从这个表可以获得：分类、标签对应的ID，这个ID将在"wla_term_taxonomy"表中使用';

-- ----------------------------
-- Records of wla_terms
-- ----------------------------
INSERT INTO `wla_terms` VALUES ('1', '顶级栏目一', 'top1', '1', '0', '', '0', '1');
INSERT INTO `wla_terms` VALUES ('2', '顶级栏目二', 'top2', '2', '0', '', '0', '0');
INSERT INTO `wla_terms` VALUES ('3', '顶级栏目三', 'top3', '3', '0', '', '0', '0');
INSERT INTO `wla_terms` VALUES ('4', '顶级栏目四', 'top4', '4', '0', '', '0', '0');
INSERT INTO `wla_terms` VALUES ('5', '顶级栏目五', 'top5', '5', '0', '', '0', '0');
INSERT INTO `wla_terms` VALUES ('12', '标签一', 'tag1', '100', '1', '', '0', '0');
INSERT INTO `wla_terms` VALUES ('7', '二级栏目二', 'secend2', '2', '0', '', '1', '1');
INSERT INTO `wla_terms` VALUES ('8', '二级栏目三', 'secend3', '1', '0', '', '4', '0');
INSERT INTO `wla_terms` VALUES ('9', '三级栏目一', 'thr1', '1', '0', '', '8', '0');
INSERT INTO `wla_terms` VALUES ('10', '三级栏目二', 'thr2', '2', '0', '', '8', '0');
INSERT INTO `wla_terms` VALUES ('11', '三级栏目三', 'thr3', '100', '0', '', '8', '1');
INSERT INTO `wla_terms` VALUES ('16', '测试一', '测试一', '100', '1', null, '0', '0');
INSERT INTO `wla_terms` VALUES ('14', '标签三', 'tag3', '100', '1', '', '0', '0');
INSERT INTO `wla_terms` VALUES ('15', '标签四', 'tag4', '100', '1', '', '0', '0');
INSERT INTO `wla_terms` VALUES ('17', '新标签测试', '新标签测试', '0', '1', '', '0', '0');
INSERT INTO `wla_terms` VALUES ('18', 'PHP函数', 'PHP函数', '0', '1', '', '0', '0');
INSERT INTO `wla_terms` VALUES ('19', 'thinkphp', 'thinkphp', '0', '1', '', '0', '2');
INSERT INTO `wla_terms` VALUES ('20', '多对多模型', '多对多模型', '0', '1', '', '0', '0');
INSERT INTO `wla_terms` VALUES ('21', '新标签', '新标签', '0', '1', '', '0', '1');
INSERT INTO `wla_terms` VALUES ('24', '真的是新的', '真的是新的', '0', '1', '', '0', '1');

-- ----------------------------
-- Table structure for `wla_user`
-- ----------------------------
DROP TABLE IF EXISTS `wla_user`;
CREATE TABLE `wla_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '标识',
  `username` varchar(255) NOT NULL COMMENT '登录帐号',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `display_name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `description` varchar(255) DEFAULT NULL COMMENT '简介',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '帐号状态(0-10)',
  `password_reset_key` varchar(255) DEFAULT NULL COMMENT '密码重置令牌',
  `created_at` int(11) NOT NULL COMMENT '创建于',
  `updated_at` int(11) NOT NULL COMMENT '更新于',
  `login_ip` char(20) NOT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  UNIQUE KEY `password_reset_key` (`password_reset_key`) USING BTREE,
  UNIQUE KEY `display_name` (`display_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of wla_user
-- ----------------------------
INSERT INTO `wla_user` VALUES ('1', 'test001', 'test001@qq.com', 'fa820cc1ad39a4e99283e9fa555035ec', '测试账号001', '/Public/Uploads/avatar/2015-11-15/5647f26f63b30.jpg', '这是一个测试账号', '10', null, '1447547536', '1448116797', '127.0.0.1');
INSERT INTO `wla_user` VALUES ('3', 'test003', 'test003@qq.com', 'db270e0074bad27c1177f31627818618', '测试用户3', '/Public/Uploads/avatar/2015-11-15/5648789f50cc1.jpg', '这是一个测试用户', '10', null, '1447590053', '1447591487', '127.0.0.1');
