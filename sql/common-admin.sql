/*
Navicat MySQL Data Transfer

Source Server         : mysql3307
Source Server Version : 50643
Source Host           : 106.13.0.171:3307
Source Database       : db_test

Target Server Type    : MYSQL
Target Server Version : 50643
File Encoding         : 65001

Date: 2019-03-18 00:14:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for common_bill
-- ----------------------------
DROP TABLE IF EXISTS `common_bill`;
CREATE TABLE `common_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `billTime` datetime NOT NULL COMMENT '交易时间',
  `billMoney` varchar(255) NOT NULL COMMENT '金额',
  `billType` varchar(255) NOT NULL COMMENT '类型',
  `billUser` varchar(255) NOT NULL COMMENT '用户',
  `billNote` varchar(255) NOT NULL COMMENT '备注',
  `billFlag` int(11) NOT NULL COMMENT '支出 or 收入 0:出 1:入',
  `createTime` datetime NOT NULL COMMENT '记录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_bill
-- ----------------------------
INSERT INTO `common_bill` VALUES ('1', '2019-12-12 00:00:00', '30', '支付宝', 'super', '买东西', '0', '2019-12-12 00:00:00');
INSERT INTO `common_bill` VALUES ('2', '2019-12-12 00:00:00', '80', '微信', 'super', '充电话费', '0', '2019-12-12 00:00:00');

-- ----------------------------
-- Table structure for common_brrow_lend
-- ----------------------------
DROP TABLE IF EXISTS `common_brrow_lend`;
CREATE TABLE `common_brrow_lend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowLendTime` datetime NOT NULL COMMENT '借入或借出时间',
  `money` varchar(255) NOT NULL COMMENT '金额',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `borrowUser` varchar(255) NOT NULL COMMENT '借款人',
  `lendUser` varchar(255) NOT NULL COMMENT '借出人',
  `status` int(1) NOT NULL COMMENT '状态',
  `createTime` datetime NOT NULL COMMENT '记录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_brrow_lend
-- ----------------------------

-- ----------------------------
-- Table structure for common_deal_type
-- ----------------------------
DROP TABLE IF EXISTS `common_deal_type`;
CREATE TABLE `common_deal_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inOrOut` int(1) NOT NULL COMMENT '支出或者收入项目 0:收入 1:支出',
  `type` varchar(255) NOT NULL COMMENT '类型',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `createTime` datetime NOT NULL COMMENT '类型创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_deal_type
-- ----------------------------
INSERT INTO `common_deal_type` VALUES ('1', '0', '工资', '每月工资收入', '2019-03-17 18:17:53');
INSERT INTO `common_deal_type` VALUES ('5', '1', '房租', '每月缴纳的房租', '2019-03-17 19:03:02');
INSERT INTO `common_deal_type` VALUES ('13', '1', '水费', '每月缴纳的水费', '2019-03-17 19:36:43');
INSERT INTO `common_deal_type` VALUES ('14', '0', '奖金', '公司发放的奖金', '2019-03-17 19:35:36');

-- ----------------------------
-- Table structure for common_dict
-- ----------------------------
DROP TABLE IF EXISTS `common_dict`;
CREATE TABLE `common_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tips` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_dict
-- ----------------------------
INSERT INTO `common_dict` VALUES ('16', '0', '0', '状态', null);
INSERT INTO `common_dict` VALUES ('17', '1', '16', '启用', null);
INSERT INTO `common_dict` VALUES ('18', '2', '16', '禁用', null);
INSERT INTO `common_dict` VALUES ('29', '0', '0', '性别', null);
INSERT INTO `common_dict` VALUES ('30', '1', '29', '男', null);
INSERT INTO `common_dict` VALUES ('31', '2', '29', '女', null);
INSERT INTO `common_dict` VALUES ('35', '0', '0', '账号状态', null);
INSERT INTO `common_dict` VALUES ('36', '1', '35', '启用', null);
INSERT INTO `common_dict` VALUES ('37', '2', '35', '冻结', null);
INSERT INTO `common_dict` VALUES ('38', '3', '35', '已删除', null);

-- ----------------------------
-- Table structure for common_login_log
-- ----------------------------
DROP TABLE IF EXISTS `common_login_log`;
CREATE TABLE `common_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) DEFAULT NULL,
  `user_id` int(65) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `succeed` varchar(255) DEFAULT NULL,
  `message` text,
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for common_menu
-- ----------------------------
DROP TABLE IF EXISTS `common_menu`;
CREATE TABLE `common_menu` (
  `id` varchar(64) NOT NULL,
  `code` varchar(255) DEFAULT NULL COMMENT '菜单编码',
  `p_code` varchar(255) DEFAULT NULL COMMENT '菜单父编码',
  `p_id` varchar(255) DEFAULT NULL COMMENT '父菜单ID',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `url` varchar(255) DEFAULT NULL COMMENT '请求地址',
  `is_menu` int(11) DEFAULT NULL COMMENT '是否是菜单',
  `level` int(11) DEFAULT NULL COMMENT '菜单层级',
  `sort` int(11) DEFAULT NULL COMMENT '菜单排序',
  `status` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FK_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_menu
-- ----------------------------
INSERT INTO `common_menu` VALUES ('000000000000000000', 'root', '0', '0', '系统根目录', '', '1', '0', '1', '1', null, '2017-08-03 18:31:54', null);
INSERT INTO `common_menu` VALUES ('1106900863944753152', 'bills/history', 'bills', '894752734459199488', '历史列表', 'bills/history', '1', '2', '1', '1', 'fa fa-book', '2019-03-16 20:51:46', '2019-03-17 14:20:33');
INSERT INTO `common_menu` VALUES ('1106903030818668544', 'count', 'root', '000000000000000000', '统计管理', 'count', '1', '1', '2', '1', 'fa fa-pie-chart', '2019-03-16 21:00:22', '2019-03-16 21:54:37');
INSERT INTO `common_menu` VALUES ('1106906272881442816', 'bills/outcome', 'bills', '894752734459199488', '支出列表', 'bills/outcome', '1', '2', '3', '1', 'fa fa-location-arrow', '2019-03-16 21:13:15', '2019-03-17 14:22:21');
INSERT INTO `common_menu` VALUES ('1106906446622097408', 'bills/income', 'bills', '894752734459199488', '收入列表', 'bills/income', '1', '2', '2', '1', 'fa fa-circle-o', '2019-03-16 21:13:57', '2019-03-17 14:22:02');
INSERT INTO `common_menu` VALUES ('1106908605833019392', 'count/day', 'count', '1106903030818668544', '日统计', 'count/day', '1', '2', '1', '1', 'fa fa-calendar', '2019-03-16 21:22:32', '2019-03-16 22:25:01');
INSERT INTO `common_menu` VALUES ('1106908754596593664', 'count/month', 'count', '1106903030818668544', '月统计', 'count/month', '1', '2', '2', '1', 'fa fa-area-chart', '2019-03-16 21:23:07', '2019-03-16 22:25:32');
INSERT INTO `common_menu` VALUES ('1106908859693268992', 'count/year', 'count', '1106903030818668544', '年统计', 'count/year', '1', '2', '3', '1', 'fa fa-calendar-check-o', '2019-03-16 21:23:32', '2019-03-16 22:26:02');
INSERT INTO `common_menu` VALUES ('1106912782072152064', 'comparison', 'root', '000000000000000000', '账单对比', 'comparison', '1', '1', '3', '1', 'fa fa-eye', '2019-03-16 21:39:07', '2019-03-16 21:56:04');
INSERT INTO `common_menu` VALUES ('1106919967531466752', 'type', 'root', '000000000000000000', '交易类型', 'type', '1', '1', '3', '1', 'fa fa-list', '2019-03-16 22:07:40', '2019-03-17 15:08:15');
INSERT INTO `common_menu` VALUES ('1106920664020811776', 'type/in', 'type', '1106919967531466752', '收入项目', 'type/in', '1', '2', '1', '1', 'fa fa-circle-o', '2019-03-16 22:10:27', '2019-03-17 15:08:50');
INSERT INTO `common_menu` VALUES ('1106921151260524544', 'type/out', 'type', '1106919967531466752', '支出项目', 'type/out', '1', '2', '2', '1', 'fa fa-location-arrow', '2019-03-16 22:12:23', '2019-03-17 15:09:01');
INSERT INTO `common_menu` VALUES ('1106921511500906496', 'plan', 'root', '000000000000000000', '财务计划', 'plan', '1', '1', '5', '1', 'fa fa-bookmark', '2019-03-16 22:13:49', '2019-03-16 22:14:58');
INSERT INTO `common_menu` VALUES ('1106922422579232768', 'comparison/day', 'comparison', '1106912782072152064', '日对比', 'comparison/day', '1', '2', '1', '1', 'fa fa-circle', '2019-03-16 22:17:26', '2019-03-16 22:20:32');
INSERT INTO `common_menu` VALUES ('1106922526077878272', 'comparison/month', 'comparison', '1106912782072152064', '月对比', 'comparison/month', '1', '2', '2', '1', 'fa fa-circle-o', '2019-03-16 22:17:51', '2019-03-16 22:22:57');
INSERT INTO `common_menu` VALUES ('1106922630637682688', 'comparison/year', 'comparison', '1106912782072152064', '年对比', 'comparison/year', '1', '2', '3', '1', 'fa  fa-square-o', '2019-03-16 22:18:15', '2019-03-16 22:23:39');
INSERT INTO `common_menu` VALUES ('1106924873885679616', 'plan/remind', 'plan', '1106921511500906496', '财务提醒', 'plan/remind', '1', '2', '1', '1', 'fa fa-clock-o', '2019-03-16 22:27:10', '2019-03-17 14:42:49');
INSERT INTO `common_menu` VALUES ('1106925336056037376', 'plan/borrow', 'plan', '1106921511500906496', '借入借出', 'plan/borrow', '1', '2', '2', '1', 'fa fa-exchange', '2019-03-16 22:29:00', '2019-03-17 14:43:05');
INSERT INTO `common_menu` VALUES ('1106925513508651008', 'plan/toloan', 'plan', '1106921511500906496', '借贷管理', 'plan/toloan', '1', '2', '3', '1', 'fa fa-book', '2019-03-16 22:29:43', '2019-03-17 14:43:22');
INSERT INTO `common_menu` VALUES ('1107200493295239168', 'type/add', 'type', '1106919967531466752', '添加', 'type/add', '0', '2', '3', '1', '', '2019-03-17 16:42:23', '2019-03-17 18:44:01');
INSERT INTO `common_menu` VALUES ('1107200750674509824', 'type/edit', 'type', '1106919967531466752', '修改', 'type/edit', '0', '2', '4', '1', '', '2019-03-17 16:43:24', '2019-03-17 18:44:09');
INSERT INTO `common_menu` VALUES ('1107200835726606336', 'type/delete', 'type', '1106919967531466752', '删除', 'type/delete', '0', '2', '5', '1', '', '2019-03-17 16:43:45', '2019-03-17 18:44:18');
INSERT INTO `common_menu` VALUES ('1107209037616775168', 'type/view', 'type', '1106919967531466752', '查看', 'type/view', '0', '2', '6', '1', '', '2019-03-17 17:16:20', '2019-03-17 18:44:29');
INSERT INTO `common_menu` VALUES ('1107223852666060800', 'bills/exportExcel', 'bills', '894752734459199488', '导出', 'bills/exportExcel', '0', '2', '1', '1', '', '2019-03-17 18:15:12', '2019-03-17 22:06:12');
INSERT INTO `common_menu` VALUES ('1107277727846629376', 'bills/edit', 'bills', '894752734459199488', '修改', 'bills/edit', '0', '2', '1', '1', '', '2019-03-17 21:49:17', '2019-03-17 22:05:53');
INSERT INTO `common_menu` VALUES ('1107297300050345984', 'plan/remind/add', 'plan/remind', '1106924873885679616', '新增', 'plan/remind/add', '0', '3', '1', '1', '', '2019-03-17 23:07:04', null);
INSERT INTO `common_menu` VALUES ('1107302594092466176', 'plan/remind/edit', 'plan/remind', '1106924873885679616', '修改', 'plan/remind/edit', '0', '3', '2', '1', '', '2019-03-17 23:28:06', null);
INSERT INTO `common_menu` VALUES ('1107302682407731200', 'plan/remind/delete', 'plan/remind', '1106924873885679616', '删除', 'plan/remind/delete', '0', '3', '3', '1', '', '2019-03-17 23:28:27', null);
INSERT INTO `common_menu` VALUES ('893287144657780736', 'system', 'root', '000000000000000000', '系统设置', 'system', '1', '1', '10', '1', 'fa fa-cog', '2017-08-04 09:47:06', '2019-03-15 15:57:18');
INSERT INTO `common_menu` VALUES ('893288715881807872', 'userList', 'system', '893287144657780736', '用户管理', 'user/list', '1', '2', '1', '1', 'fa fa-user', '2017-08-04 09:53:21', '2019-03-15 16:00:46');
INSERT INTO `common_menu` VALUES ('893304960282787840', 'user/add', 'userList', '893288715881807872', '用户添加', 'user/add', '0', '3', '1', '1', '', '2017-08-04 10:57:54', '2017-08-08 11:02:55');
INSERT INTO `common_menu` VALUES ('894396523532517376', 'user/edit', 'userList', '893288715881807872', '用户修改', 'user/edit', '0', '3', '1', '1', '', '2017-08-07 11:15:23', '2017-08-07 16:57:52');
INSERT INTO `common_menu` VALUES ('894473486712438784', 'user/view', 'userList', '893288715881807872', '用户查看', 'user/View', '0', '3', '2', '1', '', '2017-08-07 16:21:12', null);
INSERT INTO `common_menu` VALUES ('894473651837992960', 'user/delete', 'userList', '893288715881807872', '用户删除', 'user/delete', '0', '3', '4', '1', '', '2017-08-07 16:21:52', null);
INSERT INTO `common_menu` VALUES ('894475142061621248', 'roleList', 'system', '893287144657780736', '角色管理', 'role/list', '1', '2', '2', '1', 'fa fa-users', '2017-08-07 16:27:47', '2019-03-15 16:07:25');
INSERT INTO `common_menu` VALUES ('894475827880656896', 'role/add', 'roleList', '894475142061621248', '角色添加', 'role/add', '0', '3', '1', '1', '', '2017-08-07 16:30:31', null);
INSERT INTO `common_menu` VALUES ('894475985452269568', 'role/edit', 'roleList', '894475142061621248', '角色编辑', 'role/edit', '0', '3', '2', '1', '', '2017-08-07 16:31:08', null);
INSERT INTO `common_menu` VALUES ('894476118730473472', 'role/delete', 'roleList', '894475142061621248', '角色删除', 'role/delete', '0', '3', '2', '1', '', '2017-08-07 16:31:40', '2017-08-07 16:37:24');
INSERT INTO `common_menu` VALUES ('894476276402749440', 'role/permission', 'roleList', '894475142061621248', '角色配权', 'role/permission', '0', '3', '3', '1', '', '2017-08-07 16:32:18', null);
INSERT INTO `common_menu` VALUES ('894476950951690240', 'menu/list', 'system', '893287144657780736', '菜单管理', 'menu/list', '1', '2', '3', '1', 'fa fa-list', '2017-08-07 16:34:58', '2019-03-15 16:05:39');
INSERT INTO `common_menu` VALUES ('894477107919323136', 'menu/add', 'menu/list', '894476950951690240', '菜单添加', 'menu/add', '0', '3', '1', '1', '', '2017-08-07 16:35:36', null);
INSERT INTO `common_menu` VALUES ('894477244926263296', 'menu/edit', 'menu/list', '894476950951690240', '菜单编辑', 'menu/edit', '0', '3', '2', '1', '', '2017-08-07 16:36:08', null);
INSERT INTO `common_menu` VALUES ('894477420512411648', 'menu/delete', 'menu/list', '894476950951690240', '菜单删除', 'menu/delete', '0', '3', '2', '1', '', '2017-08-07 16:36:50', null);
INSERT INTO `common_menu` VALUES ('894477851082883072', 'apidoc', 'system', '893287144657780736', 'Api文档', 'swagger-ui.html', '1', '2', '9', '1', 'fa fa-file-code-o', '2017-08-07 16:38:33', '2019-03-15 16:08:03');
INSERT INTO `common_menu` VALUES ('894477995903811584', 'database/log', 'system', '893287144657780736', '数据库日志', 'druid', '1', '2', '10', '1', 'fa  fa-file', '2017-08-07 16:39:07', '2019-03-15 16:08:23');
INSERT INTO `common_menu` VALUES ('894752734459199488', 'bills', 'root', '000000000000000000', '账本管理', 'bills', '1', '1', '1', '1', 'fa fa-money', '2017-08-08 10:50:50', '2019-03-16 21:53:00');
INSERT INTO `common_menu` VALUES ('903459378655395840', '/user/modify', 'userList', '893288715881807872', '密码重置', '/user/modify', '1', '3', '2', '1', '', '2017-09-01 11:27:56', null);

-- ----------------------------
-- Table structure for common_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `common_operation_log`;
CREATE TABLE `common_operation_log` (
  `id` varchar(36) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '操作人ID',
  `username` varchar(255) DEFAULT NULL COMMENT '操作人姓名',
  `class_name` varchar(255) DEFAULT NULL COMMENT '被操作类',
  `method` varchar(255) DEFAULT NULL COMMENT '方法',
  `args` varchar(255) DEFAULT NULL COMMENT '参数',
  `origin_data` text COMMENT '原始数据',
  `new_data` text COMMENT '新数据',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for common_privilege
-- ----------------------------
DROP TABLE IF EXISTS `common_privilege`;
CREATE TABLE `common_privilege` (
  `role_id` int(11) DEFAULT NULL,
  `menu_id` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_privilege
-- ----------------------------
INSERT INTO `common_privilege` VALUES ('6', '893287144657780736', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '893288715881807872', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894396523532517376', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894477851082883072', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '893287144657780736', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '893288715881807872', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894396523532517376', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894477851082883072', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894477995903811584', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '893287144657780736', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '893288715881807872', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894396523532517376', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894473486712438784', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894477851082883072', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894477995903811584', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '893287144657780736', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '893288715881807872', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894396523532517376', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894473486712438784', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894473651837992960', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894477851082883072', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894477995903811584', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '893287144657780736', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '893288715881807872', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '893304960282787840', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894396523532517376', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894473486712438784', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894473651837992960', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894477851082883072', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('6', '894477995903811584', '2017-08-08 11:31:39');
INSERT INTO `common_privilege` VALUES ('17', '893287144657780736', '2017-09-12 18:52:38');
INSERT INTO `common_privilege` VALUES ('17', '894477995903811584', '2017-09-12 18:52:38');
INSERT INTO `common_privilege` VALUES ('17', '894752734459199488', '2017-09-12 18:52:38');
INSERT INTO `common_privilege` VALUES ('17', '894769217763540992', '2017-09-12 18:52:38');
INSERT INTO `common_privilege` VALUES ('8', '1106903030818668544', '2019-03-17 23:28:38');
INSERT INTO `common_privilege` VALUES ('8', '1106908605833019392', '2019-03-17 23:28:38');
INSERT INTO `common_privilege` VALUES ('8', '1106908754596593664', '2019-03-17 23:28:38');
INSERT INTO `common_privilege` VALUES ('8', '1106908859693268992', '2019-03-17 23:28:39');
INSERT INTO `common_privilege` VALUES ('8', '1106912782072152064', '2019-03-17 23:28:39');
INSERT INTO `common_privilege` VALUES ('8', '1106922422579232768', '2019-03-17 23:28:39');
INSERT INTO `common_privilege` VALUES ('8', '1106922526077878272', '2019-03-17 23:28:39');
INSERT INTO `common_privilege` VALUES ('8', '1106922630637682688', '2019-03-17 23:28:39');
INSERT INTO `common_privilege` VALUES ('8', '1106919967531466752', '2019-03-17 23:28:39');
INSERT INTO `common_privilege` VALUES ('8', '1106920664020811776', '2019-03-17 23:28:39');
INSERT INTO `common_privilege` VALUES ('8', '1106921151260524544', '2019-03-17 23:28:39');
INSERT INTO `common_privilege` VALUES ('8', '1107200493295239168', '2019-03-17 23:28:39');
INSERT INTO `common_privilege` VALUES ('8', '1107200750674509824', '2019-03-17 23:28:39');
INSERT INTO `common_privilege` VALUES ('8', '1107200835726606336', '2019-03-17 23:28:39');
INSERT INTO `common_privilege` VALUES ('8', '1107209037616775168', '2019-03-17 23:28:39');
INSERT INTO `common_privilege` VALUES ('8', '1106921511500906496', '2019-03-17 23:28:39');
INSERT INTO `common_privilege` VALUES ('8', '1106925336056037376', '2019-03-17 23:28:39');
INSERT INTO `common_privilege` VALUES ('8', '1106925513508651008', '2019-03-17 23:28:40');
INSERT INTO `common_privilege` VALUES ('8', '893287144657780736', '2019-03-17 23:28:40');
INSERT INTO `common_privilege` VALUES ('8', '893288715881807872', '2019-03-17 23:28:40');
INSERT INTO `common_privilege` VALUES ('8', '893304960282787840', '2019-03-17 23:28:40');
INSERT INTO `common_privilege` VALUES ('8', '894396523532517376', '2019-03-17 23:28:40');
INSERT INTO `common_privilege` VALUES ('8', '894473486712438784', '2019-03-17 23:28:40');
INSERT INTO `common_privilege` VALUES ('8', '894473651837992960', '2019-03-17 23:28:40');
INSERT INTO `common_privilege` VALUES ('8', '903459378655395840', '2019-03-17 23:28:40');
INSERT INTO `common_privilege` VALUES ('8', '894475142061621248', '2019-03-17 23:28:40');
INSERT INTO `common_privilege` VALUES ('8', '894475827880656896', '2019-03-17 23:28:40');
INSERT INTO `common_privilege` VALUES ('8', '894475985452269568', '2019-03-17 23:28:40');
INSERT INTO `common_privilege` VALUES ('8', '894476118730473472', '2019-03-17 23:28:40');
INSERT INTO `common_privilege` VALUES ('8', '894476276402749440', '2019-03-17 23:28:40');
INSERT INTO `common_privilege` VALUES ('8', '894476950951690240', '2019-03-17 23:28:41');
INSERT INTO `common_privilege` VALUES ('8', '894477107919323136', '2019-03-17 23:28:41');
INSERT INTO `common_privilege` VALUES ('8', '894477244926263296', '2019-03-17 23:28:41');
INSERT INTO `common_privilege` VALUES ('8', '894477420512411648', '2019-03-17 23:28:41');
INSERT INTO `common_privilege` VALUES ('8', '894477851082883072', '2019-03-17 23:28:41');
INSERT INTO `common_privilege` VALUES ('8', '894477995903811584', '2019-03-17 23:28:41');
INSERT INTO `common_privilege` VALUES ('8', '894752734459199488', '2019-03-17 23:28:41');
INSERT INTO `common_privilege` VALUES ('8', '1106900863944753152', '2019-03-17 23:28:41');
INSERT INTO `common_privilege` VALUES ('8', '1106906272881442816', '2019-03-17 23:28:41');
INSERT INTO `common_privilege` VALUES ('8', '1106906446622097408', '2019-03-17 23:28:41');
INSERT INTO `common_privilege` VALUES ('8', '1107223852666060800', '2019-03-17 23:28:41');
INSERT INTO `common_privilege` VALUES ('8', '1107277727846629376', '2019-03-17 23:28:41');
INSERT INTO `common_privilege` VALUES ('8', '1106903030818668544', '2019-03-17 23:28:41');
INSERT INTO `common_privilege` VALUES ('8', '1106908605833019392', '2019-03-17 23:28:41');
INSERT INTO `common_privilege` VALUES ('8', '1106908754596593664', '2019-03-17 23:28:42');
INSERT INTO `common_privilege` VALUES ('8', '1106908859693268992', '2019-03-17 23:28:42');
INSERT INTO `common_privilege` VALUES ('8', '1106912782072152064', '2019-03-17 23:28:42');
INSERT INTO `common_privilege` VALUES ('8', '1106922422579232768', '2019-03-17 23:28:42');
INSERT INTO `common_privilege` VALUES ('8', '1106922526077878272', '2019-03-17 23:28:42');
INSERT INTO `common_privilege` VALUES ('8', '1106922630637682688', '2019-03-17 23:28:42');
INSERT INTO `common_privilege` VALUES ('8', '1106919967531466752', '2019-03-17 23:28:42');
INSERT INTO `common_privilege` VALUES ('8', '1106920664020811776', '2019-03-17 23:28:42');
INSERT INTO `common_privilege` VALUES ('8', '1106921151260524544', '2019-03-17 23:28:42');
INSERT INTO `common_privilege` VALUES ('8', '1107200493295239168', '2019-03-17 23:28:42');
INSERT INTO `common_privilege` VALUES ('8', '1107200750674509824', '2019-03-17 23:28:42');
INSERT INTO `common_privilege` VALUES ('8', '1107200835726606336', '2019-03-17 23:28:42');
INSERT INTO `common_privilege` VALUES ('8', '1107209037616775168', '2019-03-17 23:28:42');
INSERT INTO `common_privilege` VALUES ('8', '1106921511500906496', '2019-03-17 23:28:43');
INSERT INTO `common_privilege` VALUES ('8', '1106924873885679616', '2019-03-17 23:28:43');
INSERT INTO `common_privilege` VALUES ('8', '1107297300050345984', '2019-03-17 23:28:43');
INSERT INTO `common_privilege` VALUES ('8', '1107302594092466176', '2019-03-17 23:28:43');
INSERT INTO `common_privilege` VALUES ('8', '1107302682407731200', '2019-03-17 23:28:43');
INSERT INTO `common_privilege` VALUES ('8', '1106925336056037376', '2019-03-17 23:28:43');
INSERT INTO `common_privilege` VALUES ('8', '1106925513508651008', '2019-03-17 23:28:43');
INSERT INTO `common_privilege` VALUES ('8', '893287144657780736', '2019-03-17 23:28:43');
INSERT INTO `common_privilege` VALUES ('8', '893288715881807872', '2019-03-17 23:28:43');
INSERT INTO `common_privilege` VALUES ('8', '893304960282787840', '2019-03-17 23:28:43');
INSERT INTO `common_privilege` VALUES ('8', '894396523532517376', '2019-03-17 23:28:43');
INSERT INTO `common_privilege` VALUES ('8', '894473486712438784', '2019-03-17 23:28:43');
INSERT INTO `common_privilege` VALUES ('8', '894473651837992960', '2019-03-17 23:28:43');
INSERT INTO `common_privilege` VALUES ('8', '903459378655395840', '2019-03-17 23:28:43');
INSERT INTO `common_privilege` VALUES ('8', '894475142061621248', '2019-03-17 23:28:44');
INSERT INTO `common_privilege` VALUES ('8', '894475827880656896', '2019-03-17 23:28:44');
INSERT INTO `common_privilege` VALUES ('8', '894475985452269568', '2019-03-17 23:28:44');
INSERT INTO `common_privilege` VALUES ('8', '894476118730473472', '2019-03-17 23:28:44');
INSERT INTO `common_privilege` VALUES ('8', '894476276402749440', '2019-03-17 23:28:44');
INSERT INTO `common_privilege` VALUES ('8', '894476950951690240', '2019-03-17 23:28:44');
INSERT INTO `common_privilege` VALUES ('8', '894477107919323136', '2019-03-17 23:28:44');
INSERT INTO `common_privilege` VALUES ('8', '894477244926263296', '2019-03-17 23:28:44');
INSERT INTO `common_privilege` VALUES ('8', '894477420512411648', '2019-03-17 23:28:44');
INSERT INTO `common_privilege` VALUES ('8', '894477851082883072', '2019-03-17 23:28:44');
INSERT INTO `common_privilege` VALUES ('8', '894477995903811584', '2019-03-17 23:28:44');
INSERT INTO `common_privilege` VALUES ('8', '894752734459199488', '2019-03-17 23:28:44');
INSERT INTO `common_privilege` VALUES ('8', '1106900863944753152', '2019-03-17 23:28:44');
INSERT INTO `common_privilege` VALUES ('8', '1106906272881442816', '2019-03-17 23:28:45');
INSERT INTO `common_privilege` VALUES ('8', '1106906446622097408', '2019-03-17 23:28:45');
INSERT INTO `common_privilege` VALUES ('8', '1107223852666060800', '2019-03-17 23:28:45');
INSERT INTO `common_privilege` VALUES ('8', '1107277727846629376', '2019-03-17 23:28:45');

-- ----------------------------
-- Table structure for common_remind
-- ----------------------------
DROP TABLE IF EXISTS `common_remind`;
CREATE TABLE `common_remind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL COMMENT '时间',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `status` int(1) NOT NULL COMMENT '0:完成 1:待做',
  `user` varchar(255) NOT NULL COMMENT '用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_remind
-- ----------------------------
INSERT INTO `common_remind` VALUES ('1', '2019-03-17 22:48:53', '打卡', '0', 'super');
INSERT INTO `common_remind` VALUES ('3', '2019-03-18 00:00:00', '还房租', '1', 'super');

-- ----------------------------
-- Table structure for common_role
-- ----------------------------
DROP TABLE IF EXISTS `common_role`;
CREATE TABLE `common_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `tips` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_role_name` (`name`),
  UNIQUE KEY `unique_role_value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_role
-- ----------------------------
INSERT INTO `common_role` VALUES ('6', '管理员', 'admin', null, '2017-06-20 15:07:13', '2017-06-26 12:46:09', '1');
INSERT INTO `common_role` VALUES ('8', '超级管理员', 'super', null, '2017-06-20 15:08:45', null, '1');
INSERT INTO `common_role` VALUES ('17', '用户', 'user', null, '2017-06-28 18:50:39', '2017-07-21 09:41:28', '1');

-- ----------------------------
-- Table structure for common_to_loan
-- ----------------------------
DROP TABLE IF EXISTS `common_to_loan`;
CREATE TABLE `common_to_loan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `toLoan` varchar(255) NOT NULL COMMENT '借贷项目',
  `money` varchar(255) NOT NULL COMMENT '借贷金额',
  `interest` varchar(255) NOT NULL COMMENT '利息',
  `life` varchar(255) NOT NULL COMMENT '年限',
  `alreadyRepaid` varchar(255) NOT NULL COMMENT '已还金额',
  `surplus` varchar(255) NOT NULL COMMENT '剩余金额',
  `user` varchar(255) NOT NULL COMMENT '借贷人',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_to_loan
-- ----------------------------

-- ----------------------------
-- Table structure for common_user
-- ----------------------------
DROP TABLE IF EXISTS `common_user`;
CREATE TABLE `common_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `salt` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_user
-- ----------------------------
INSERT INTO `common_user` VALUES ('46', null, 'super', 'a5322b1321d2c849e22fa3f62bf87d6b', 'u2w3z', '超级管理员', '2017-06-22 14:26:09', '1', null, null, '1', '2017-06-20 15:12:16', '2017-09-12 14:39:48');
INSERT INTO `common_user` VALUES ('48', null, 'admin', '439b9b33eb18d644f3b57e182f45b86a', 'bycca', '管理员', null, '1', null, null, '1', '2017-06-26 17:31:41', null);
INSERT INTO `common_user` VALUES ('49', null, 'yangxiufeng', '51d69a1a145c293eedb25e90378a0985', 'hm8ow', '秀秀2', null, '1', null, null, '1', '2017-08-30 10:34:59', null);
INSERT INTO `common_user` VALUES ('50', null, 'test', 'add119aedb346d8b58eb4955072344e9', 'xkbjg', '测试用户', null, '1', null, null, '1', '2017-09-11 20:51:31', '2017-09-12 13:09:04');
INSERT INTO `common_user` VALUES ('58', null, 'ces1', '19f33490ae4e4732b299d54f9e8f0253', 'rxkuh', '小娃娃', null, '1', null, null, '1', '2017-09-14 16:38:16', '2019-03-16 20:43:35');

-- ----------------------------
-- Table structure for common_user_role
-- ----------------------------
DROP TABLE IF EXISTS `common_user_role`;
CREATE TABLE `common_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_user_role
-- ----------------------------
INSERT INTO `common_user_role` VALUES ('1', '46', '8', '2017-09-11 13:02:45', null);
INSERT INTO `common_user_role` VALUES ('2', '48', '6', '2017-09-11 13:02:56', null);
INSERT INTO `common_user_role` VALUES ('3', '49', '17', '2017-09-11 13:03:12', null);
INSERT INTO `common_user_role` VALUES ('19', '50', '6', '2017-09-12 14:20:20', '超级管理员');
INSERT INTO `common_user_role` VALUES ('20', '50', '17', '2017-09-12 14:20:20', '超级管理员');