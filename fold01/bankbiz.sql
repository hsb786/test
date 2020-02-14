/*
Navicat MySQL Data Transfer

Source Server         : mandofin_test
Source Server Version : 50721
Source Host           : 192.168.0.44:3306
Source Database       : bankbiz

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2020-02-14 19:53:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account_info
-- ----------------------------
DROP TABLE IF EXISTS `account_info`;
CREATE TABLE `account_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `no` varchar(30) NOT NULL DEFAULT '0' COMMENT '帐户编码',
  `user_id` bigint(19) NOT NULL COMMENT '用户id',
  `bank_user_id` varchar(50) DEFAULT NULL COMMENT '银行侧用户ID',
  `balance` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '帐户余额',
  `hold_money` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '持仓金额',
  `freeze` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '冻结金额',
  `type` varchar(10) DEFAULT NULL COMMENT '帐户类型;  ZGBANK,自贡银行, MANDO满兜账户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '调整时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='账户信息表';

-- ----------------------------
-- Table structure for bank_card
-- ----------------------------
DROP TABLE IF EXISTS `bank_card`;
CREATE TABLE `bank_card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `account_no` varchar(30) NOT NULL COMMENT '账户编号',
  `bank_code` varchar(19) NOT NULL COMMENT '银行编码',
  `account` varchar(25) NOT NULL COMMENT '银行卡号',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '银行名称',
  `mobile` varchar(20) DEFAULT NULL COMMENT '银行预留手机号',
  `is_delete` char(1) NOT NULL DEFAULT '0' COMMENT '是否解绑 0正常 1 解绑',
  `validate` char(1) NOT NULL DEFAULT '0' COMMENT '0 未验卡，1已验卡',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '调整时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户银行卡表';

-- ----------------------------
-- Table structure for buy_order
-- ----------------------------
DROP TABLE IF EXISTS `buy_order`;
CREATE TABLE `buy_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) NOT NULL COMMENT '订单号',
  `bank_order_no` varchar(50) DEFAULT NULL COMMENT '银行侧订单号',
  `order_status` varchar(50) NOT NULL COMMENT '订单状态:处理中：PROCESSING成功：SUCCESS失败：FAIL',
  `trade_amount` decimal(16,2) NOT NULL COMMENT '交易金额',
  `user_id` bigint(19) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) NOT NULL COMMENT '用户名称',
  `user_mobile` varchar(11) NOT NULL COMMENT '用户手机号',
  `bank_user_id` varchar(50) DEFAULT NULL COMMENT '银行侧userid',
  `bank_account_no` varchar(50) DEFAULT NULL COMMENT '银行侧账户编号',
  `product_id` bigint(19) NOT NULL COMMENT '产品id',
  `product_name` varchar(30) NOT NULL COMMENT '产品名称',
  `product_belong` varchar(30) NOT NULL COMMENT '所属机构',
  `bank_trade_time` datetime DEFAULT NULL COMMENT '银行交易时间',
  `interest_begin_date` datetime DEFAULT NULL COMMENT '计息开始时间',
  `interest_due_end_date` datetime DEFAULT NULL COMMENT '计息期满结束时间',
  `redeemable_date` datetime DEFAULT NULL COMMENT '可赎回日期',
  `discount` varchar(10) NOT NULL COMMENT '是否贴息：YES/NO',
  `discount_type` varchar(20) DEFAULT NULL COMMENT '贴息方式',
  `discount_period` int(10) DEFAULT NULL COMMENT '贴息持满期限',
  `discount_money` decimal(16,2) DEFAULT NULL COMMENT '贴息金额或利率',
  `discount_reward_money` decimal(16,2) DEFAULT NULL COMMENT '贴息奖励金额',
  `additional` varchar(50) DEFAULT NULL COMMENT '失败附加信息',
  `current_interest` decimal(16,2) DEFAULT '0.00' COMMENT '''当前收益''',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='购买订单';

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `channel_name` varchar(20) NOT NULL COMMENT '渠道名称',
  `channel_code` varchar(30) NOT NULL COMMENT '渠道号',
  `status` varchar(20) NOT NULL DEFAULT 'PROBATION' COMMENT 'STOP:停止合作,PROBATION:试用期,FORMAL:正式合作',
  `user_name` varchar(30) NOT NULL COMMENT '联系人',
  `mobile` varchar(11) NOT NULL COMMENT '联系人手机号',
  `settlement_type` varchar(10) NOT NULL COMMENT '结算类型',
  `settlement_period` varchar(10) NOT NULL COMMENT '结算周期',
  `settlement_bank` varchar(20) NOT NULL COMMENT '结算银行',
  `settlement_bank_account` varchar(50) NOT NULL COMMENT '结算银行卡号',
  `settlement_bank_user_name` varchar(20) NOT NULL COMMENT '结算银行户名',
  `settlement_price` varchar(20) NOT NULL COMMENT '结算单价',
  `login_mobile` varchar(11) NOT NULL COMMENT '渠道系统登录账户',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_code` (`channel_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='渠道商信息';

-- ----------------------------
-- Table structure for cros_data
-- ----------------------------
DROP TABLE IF EXISTS `cros_data`;
CREATE TABLE `cros_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `identity_authen` varchar(10) DEFAULT NULL COMMENT '身份认证状态：PASS：通过；NOT_PASS：不通过',
  `face_authen` varchar(10) DEFAULT NULL COMMENT '人脸识别状态：PASS：通过；NOT_PASS：不通过',
  `identity_front_img` varchar(255) DEFAULT NULL COMMENT '身份证正面',
  `identity_back_img` varchar(255) DEFAULT NULL COMMENT '身份证反面',
  `face_img` varchar(255) DEFAULT NULL COMMENT '人脸',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `imageOrderNo` varchar(55) DEFAULT NULL COMMENT '证件影像订单号',
  `ivepOrderNo` varchar(55) DEFAULT NULL COMMENT '活体影像订单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='认证信息';

-- ----------------------------
-- Table structure for discount_draw
-- ----------------------------
DROP TABLE IF EXISTS `discount_draw`;
CREATE TABLE `discount_draw` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `user_name` varchar(30) NOT NULL COMMENT '用户名称',
  `mobile` varchar(11) NOT NULL COMMENT '用户手机号',
  `draw_money` decimal(10,2) NOT NULL COMMENT '提现金额',
  `bank_name` varchar(30) NOT NULL COMMENT '银行名称',
  `bank_user_name` varchar(30) NOT NULL COMMENT '户主',
  `bank_account` varchar(50) NOT NULL COMMENT '银行卡号',
  `trade_no` varchar(100) NOT NULL COMMENT '打款流水号',
  `draw_status` varchar(20) NOT NULL COMMENT '提现状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提现时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '打款时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='提现申请';

-- ----------------------------
-- Table structure for enum_info
-- ----------------------------
DROP TABLE IF EXISTS `enum_info`;
CREATE TABLE `enum_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enum_type` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '枚举类型',
  `enum_code` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '枚举code',
  `enum_text` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '枚举解释',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='枚举表';

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(30) NOT NULL COMMENT '产品名称',
  `product_code` varchar(20) NOT NULL COMMENT '产品代码',
  `product_status` varchar(10) NOT NULL COMMENT '产品状态, IN_SALE:售卖中 OUT_SALE:已售罄,STOP_SALE:停售',
  `product_type` varchar(50) DEFAULT 'PREPAID' COMMENT '产品类型,先息后本:PREPAID 到期一次性付息:NORMAL',
  `partialRedeemable` varchar(10) NOT NULL COMMENT '支持部分赎回：YES不支持部分赎回：NO',
  `min_amount` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '起投金额',
  `step_amount` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '递增金额',
  `max_amount` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '单笔最大购买金额',
  `due_rate` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '满期利率',
  `ahead_rate` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '提前支取利率',
  `invest_period` int(10) NOT NULL COMMENT '产品投资期限',
  `invest_periodType` varchar(10) NOT NULL COMMENT '产品投资期限类型：DAY MONTH YEAR',
  `freeze_period` int(10) DEFAULT NULL COMMENT '产品冻结期限',
  `freeze_PeriodType` varchar(10) DEFAULT NULL COMMENT '产品冻结期限类型：DAY MONTH YEAR',
  `interest_rule` varchar(500) DEFAULT NULL COMMENT '计息规则',
  `redeem_rule` varchar(500) DEFAULT NULL COMMENT '赎回规则',
  `product_category` varchar(50) DEFAULT NULL COMMENT '产品分类',
  `price` decimal(16,2) DEFAULT '0.00' COMMENT '产品募集总金额',
  `raise_amount` decimal(16,2) DEFAULT '0.00' COMMENT '已募集金额',
  `rate_Type` varchar(10) DEFAULT NULL COMMENT '利率类型：FLOAT-浮动FIX-固定LADDER-阶梯',
  `profit_type` varchar(20) DEFAULT NULL COMMENT '收益类型：ONE-一次性还本付息，MONTH-按月付息到期还本',
  `max_interestRate` decimal(6,4) DEFAULT NULL COMMENT '最大利率',
  `min_interestRate` decimal(6,4) DEFAULT NULL COMMENT '最低利率',
  `belong` varchar(30) NOT NULL COMMENT '产品所属机构',
  `sale_status` varchar(30) DEFAULT 'UNSHOW' COMMENT '上架状态，show上架 unshow下架中',
  `days_of_interest` int(11) DEFAULT NULL COMMENT '计息期限',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产品创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产品同步时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Table structure for product_marking
-- ----------------------------
DROP TABLE IF EXISTS `product_marking`;
CREATE TABLE `product_marking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL COMMENT '产品id',
  `product_attribute` varchar(50) DEFAULT NULL COMMENT '产品属性',
  `product_label` varchar(100) DEFAULT NULL COMMENT '产品标签',
  `product_interest_rule` varchar(500) DEFAULT NULL COMMENT '计息规则',
  `product_redeem_rule` varchar(500) DEFAULT NULL COMMENT '赎回规则',
  `discount` varchar(10) DEFAULT NULL COMMENT '是否贴息：YES/NO',
  `discount_type` varchar(20) DEFAULT NULL COMMENT '贴息方式',
  `discount_period` int(10) DEFAULT NULL COMMENT '贴息持满期限',
  `discount_reward_type` varchar(20) DEFAULT NULL COMMENT '贴息奖励方式',
  `discount_min_hold_money` decimal(16,2) DEFAULT NULL COMMENT '贴息起投金额',
  `discount_money` decimal(16,2) DEFAULT NULL COMMENT '贴息金额',
  `discount_rate` decimal(16,4) DEFAULT NULL COMMENT '贴息利息',
  `discount_rule` varchar(500) DEFAULT NULL COMMENT '贴息规则',
  `days_of_interest` int(10) DEFAULT NULL COMMENT '付息期限',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='产品营销表';

-- ----------------------------
-- Table structure for provider_bank
-- ----------------------------
DROP TABLE IF EXISTS `provider_bank`;
CREATE TABLE `provider_bank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bank_code` varchar(50) NOT NULL COMMENT '银行编号',
  `bank_name` varchar(100) DEFAULT NULL COMMENT '银行名称',
  `single_amount` decimal(16,2) NOT NULL COMMENT '单笔限额',
  `day_amount` decimal(16,2) NOT NULL COMMENT '日限额',
  `month_amount` decimal(16,2) NOT NULL COMMENT '月限额',
  `state` varchar(20) NOT NULL COMMENT '银行状态',
  `channel` varchar(20) NOT NULL COMMENT '所属机构',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='银行卡限额表';

-- ----------------------------
-- Table structure for rebate
-- ----------------------------
DROP TABLE IF EXISTS `rebate`;
CREATE TABLE `rebate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `account_no` varchar(30) DEFAULT NULL COMMENT '返利资金账号',
  `type` varchar(20) DEFAULT NULL COMMENT '返利类型： CASH_BONUS：现金红包； INVITE_FRIEND：邀请好友；PLATFORM_INTEREST：平台加息；DRAW：取现',
  `money` decimal(18,0) DEFAULT NULL COMMENT '返利金额',
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='返利流水';

-- ----------------------------
-- Table structure for redeem_order
-- ----------------------------
DROP TABLE IF EXISTS `redeem_order`;
CREATE TABLE `redeem_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `redeem_no` varchar(50) NOT NULL COMMENT '赎回订单号',
  `bank_redeem_no` varchar(50) DEFAULT NULL COMMENT '银行侧赎回订单号',
  `trade_status` varchar(50) NOT NULL COMMENT '订单状态:处理中：PROCESSING成功：SUCCESS失败：FAIL',
  `trade_amount` decimal(16,2) NOT NULL COMMENT '交易金额',
  `user_id` bigint(19) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) NOT NULL COMMENT '用户名称',
  `user_mobile` varchar(11) NOT NULL COMMENT '用户手机号',
  `product_id` bigint(19) NOT NULL COMMENT '产品id',
  `product_name` varchar(30) NOT NULL COMMENT '产品名称',
  `product_belong` varchar(30) NOT NULL COMMENT '所属机构',
  `principal` decimal(16,2) DEFAULT NULL COMMENT '赎回本金',
  `interest` decimal(16,2) DEFAULT NULL COMMENT '总利息',
  `paid_interest` decimal(16,2) DEFAULT NULL COMMENT '已付利息',
  `days_interest` int(10) NOT NULL COMMENT '计息天数',
  `rate` decimal(6,4) NOT NULL COMMENT '利率',
  `bank_trade_time` datetime DEFAULT NULL COMMENT '银行交易时间',
  `arrival_time` datetime DEFAULT NULL COMMENT '预计到账日期',
  `ref_order_no` varchar(50) DEFAULT NULL COMMENT '关联订单编号',
  `additional` varchar(50) DEFAULT NULL COMMENT '失败附加信息',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='赎回订单';

-- ----------------------------
-- Table structure for statistics
-- ----------------------------
DROP TABLE IF EXISTS `statistics`;
CREATE TABLE `statistics` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
  `statistics_class` varchar(32) NOT NULL COMMENT '静态分类 USRE_STATISTICS:用户数据 TRADE_MONEY:订单数据 PRODUCT_TOP:产品数据',
  `type` varchar(32) NOT NULL COMMENT '类型YEAR:年份 MONTH, DAY:日',
  `content` varchar(2000) NOT NULL DEFAULT '{}' COMMENT 'JSON格式，包含每个模块的数据',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统验证码';

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统配置信息表';

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1224586670284865497 DEFAULT CHARSET=utf8mb4 COMMENT='系统日志';

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(1500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COMMENT='菜单管理';

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_type` tinyint(2) DEFAULT '0' COMMENT '角色标识类型（0：系统用户，1：校队负责人，2：校区负责人，3：其他用户,4,客服）',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5276 DEFAULT CHARSET=utf8mb4 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `user_type` varchar(50) DEFAULT NULL COMMENT 'SYSTEM:系统用户，CHANNEL渠道用户',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `logo` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像logo',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=1198902790928273419 DEFAULT CHARSET=utf8mb4 COMMENT='系统用户';

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=527 DEFAULT CHARSET=utf8mb4 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(500) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户Token';

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mobile` varchar(11) NOT NULL COMMENT '用户手机号',
  `password` varchar(64) NOT NULL COMMENT '用户登录密码',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号码',
  `user_name` varchar(50) DEFAULT NULL COMMENT '实名（姓名）',
  `user_status` varchar(10) DEFAULT 'NORMAL' COMMENT '用户状态：NORMAL：正常；FREEZE：冻结；LOCK：锁定',
  `identity_authen` varchar(10) DEFAULT NULL COMMENT '身份认证状态：PASS：通过；NOT_PASS：不通过',
  `face_authen` varchar(10) DEFAULT NULL COMMENT '人脸识别状态：PASS：通过；NOT_PASS：不通过',
  `four_authen` varchar(10) DEFAULT NULL COMMENT '四要素认证状态：PASS：通过；NOT_PASS：不通过',
  `channel_code` varchar(50) NOT NULL COMMENT '渠道商',
  `invite_source_id` varchar(20) DEFAULT NULL COMMENT '邀请人',
  `source` varchar(20) NOT NULL COMMENT '终端来源：H5：H5；IOS：IOS；ANDROID：安卓；MINI_PROGRAM：小程序',
  `avatar` varchar(150) DEFAULT NULL COMMENT '头像',
  `sex` varchar(20) DEFAULT NULL COMMENT '性别:M-男,F-女',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Table structure for user_statistic
-- ----------------------------
DROP TABLE IF EXISTS `user_statistic`;
CREATE TABLE `user_statistic` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `channel_code` varchar(30) NOT NULL COMMENT '渠道编码',
  `registry_count` int(10) NOT NULL DEFAULT '0' COMMENT '注册数',
  `authentic_count` int(10) NOT NULL DEFAULT '0' COMMENT '实名数',
  `trade_count` int(10) NOT NULL DEFAULT '0' COMMENT '交易数',
  `order_count` int(10) NOT NULL DEFAULT '0' COMMENT '订单数',
  `trade_amount` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '交易金额',
  `handle_time` date NOT NULL COMMENT '统计时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='用户统计快照';
