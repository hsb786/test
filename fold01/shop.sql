/*
Navicat MySQL Data Transfer

Source Server         : mandofin_test
Source Server Version : 50721
Source Host           : 192.168.0.44:3306
Source Database       : test_shopmall

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-11-08 10:31:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for advertisement
-- ----------------------------
DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE `advertisement` (
  `id` bigint(20) NOT NULL COMMENT '广告id',
  `title` varchar(50) NOT NULL COMMENT '广告标题',
  `sequence` int(20) DEFAULT NULL COMMENT '顺序',
  `use_type` varchar(10) DEFAULT NULL COMMENT '用途',
  `type` varchar(10) NOT NULL DEFAULT 'ALL' COMMENT '类型',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `image` varchar(500) DEFAULT NULL COMMENT '图片id',
  `state` tinyint(10) DEFAULT '1' COMMENT '状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `category_name` varchar(20) NOT NULL COMMENT '分类名称',
  `display` tinyint(4) DEFAULT '0' COMMENT '0：显示，1：隐藏',
  `school_team_sell` tinyint(4) DEFAULT '0' COMMENT '0：采购，1：自营',
  `sequence` int(20) NOT NULL DEFAULT '0' COMMENT '排序',
  `delete_state` tinyint(4) DEFAULT '0' COMMENT '0：正常，1：已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类';

-- ----------------------------
-- Table structure for commission_plan
-- ----------------------------
DROP TABLE IF EXISTS `commission_plan`;
CREATE TABLE `commission_plan` (
  `id` bigint(20) NOT NULL,
  `planNo` varchar(20) DEFAULT NULL COMMENT '计划编号',
  `orderNo` varchar(20) DEFAULT NULL COMMENT '销售订单编号',
  `receive_user_id` bigint(20) DEFAULT NULL COMMENT '收钱用户id',
  `receive_accountNo` varchar(20) DEFAULT NULL COMMENT '收钱账户编号',
  `target_user_id` bigint(20) DEFAULT NULL COMMENT '目标用户id',
  `target_accountNo` varchar(20) DEFAULT NULL COMMENT '目标用户账户编号',
  `money` decimal(9,2) DEFAULT '0.00' COMMENT '分佣金额',
  `state` varchar(20) DEFAULT NULL COMMENT '结算状态：已结算，未结算',
  `pay_time` date DEFAULT NULL COMMENT '计划分佣日期',
  `real_time` datetime DEFAULT NULL COMMENT '实际分佣时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分佣计划';

-- ----------------------------
-- Table structure for delivery_address
-- ----------------------------
DROP TABLE IF EXISTS `delivery_address`;
CREATE TABLE `delivery_address` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `receive_mobile` varchar(20) NOT NULL COMMENT '收件人手机号',
  `receive_user_name` varchar(100) NOT NULL COMMENT '收件人姓名',
  `address_label` varchar(255) DEFAULT NULL COMMENT '地址类型：SCHOOL：学校；COMPANY：公司；HOME：家',
  `default_select` tinyint(4) DEFAULT '0' COMMENT '是否是默认地址：0：不是；1：是',
  `province_id` bigint(20) DEFAULT NULL COMMENT '省份id',
  `province_name` varchar(255) DEFAULT NULL COMMENT '省份名称',
  `city_id` bigint(20) DEFAULT NULL COMMENT '城市id',
  `city_name` varchar(255) DEFAULT NULL COMMENT '城市名称',
  `country_id` bigint(20) DEFAULT NULL COMMENT '区id',
  `country_name` varchar(255) DEFAULT NULL COMMENT '区名称',
  `street_id` bigint(20) DEFAULT NULL COMMENT '街道id',
  `street_name` varchar(255) DEFAULT NULL COMMENT '街道名称',
  `detail` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收获地址';

-- ----------------------------
-- Table structure for distribution_place
-- ----------------------------
DROP TABLE IF EXISTS `distribution_place`;
CREATE TABLE `distribution_place` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `order_no` varchar(20) DEFAULT NULL COMMENT '订单编号',
  `receive_mobile` varchar(20) DEFAULT NULL COMMENT '收件人',
  `receive_user_name` varchar(20) DEFAULT NULL COMMENT '收件人姓名',
  `province_name` varchar(20) DEFAULT NULL COMMENT '省份名称',
  `city_name` varchar(20) DEFAULT NULL COMMENT '区名称',
  `country_name` varchar(20) DEFAULT NULL COMMENT '区名称',
  `street_name` varchar(20) DEFAULT NULL COMMENT '街道名称',
  `detail` varchar(100) DEFAULT NULL COMMENT '收件人详细地址',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单配送地址';

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `good_spec_id` bigint(20) DEFAULT NULL COMMENT '商品（单品）规格id',
  `store_id` bigint(20) NOT NULL COMMENT '店铺id',
  `order_no` varchar(255) DEFAULT NULL COMMENT '订单号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '评价用户id',
  `describe_star` int(9) DEFAULT '5' COMMENT '描述相符',
  `service_star` int(9) DEFAULT '5' COMMENT '服务态度',
  `distribution_star` int(9) DEFAULT '5' COMMENT '校内配送服务',
  `content` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '评论内容',
  `imageurls` varchar(255) DEFAULT NULL COMMENT '图片地址id，逗号分隔',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评价';

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `store_id` bigint(20) NOT NULL COMMENT '店铺id',
  `good_stock_id` bigint(20) NOT NULL COMMENT '商品库id',
  `recommend` tinyint(4) DEFAULT '0' COMMENT '商品属性（0：不推荐；1：推荐）',
  `labels` varchar(255) DEFAULT NULL COMMENT '标签（逗号分隔）',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字（逗号分隔）',
  `sequence` int(11) DEFAULT NULL COMMENT '排序',
  `state` tinyint(4) DEFAULT '0' COMMENT '上架（0：待上架，1：已上架，2：已下架）',
  `open_sell_time` datetime DEFAULT NULL COMMENT '上架时间(未上架的时候为空）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除标识：0：未删除；1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品营销信息';

-- ----------------------------
-- Table structure for good_attribute
-- ----------------------------
DROP TABLE IF EXISTS `good_attribute`;
CREATE TABLE `good_attribute` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `good_stock_id` bigint(20) NOT NULL COMMENT '商品库id',
  `attribute_name` varchar(20) DEFAULT NULL COMMENT '商品属性',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除标识：0：未删除；1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格属性';

-- ----------------------------
-- Table structure for good_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `good_attribute_value`;
CREATE TABLE `good_attribute_value` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `good_stock_id` bigint(20) NOT NULL COMMENT '商品库id',
  `attribute_id` bigint(20) NOT NULL COMMENT '商品属性id',
  `attribute_value` varchar(20) DEFAULT NULL COMMENT '商品属性值',
  `img_url` varchar(500) DEFAULT NULL COMMENT '图片地址',
  `file_url` varchar(500) DEFAULT NULL COMMENT '文件地址',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除标识：0：未删除；1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性值表';

-- ----------------------------
-- Table structure for good_spec
-- ----------------------------
DROP TABLE IF EXISTS `good_spec`;
CREATE TABLE `good_spec` (
  `id` bigint(20) NOT NULL,
  `good_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `good_store_spec_id` bigint(20) DEFAULT NULL COMMENT '商品库规格id',
  `price` decimal(9,2) DEFAULT NULL COMMENT '价格',
  `shell_number` int(11) DEFAULT NULL COMMENT '校贝',
  `state` tinyint(4) DEFAULT '0' COMMENT '上架（0：待上架，1：已上架，2：已下架）',
  `open_sell_time` datetime DEFAULT NULL COMMENT '上架时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除标识：0：未删除；1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品(单品)规格';

-- ----------------------------
-- Table structure for good_stock
-- ----------------------------
DROP TABLE IF EXISTS `good_stock`;
CREATE TABLE `good_stock` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `category_id` bigint(20) NOT NULL COMMENT '商品分类id',
  `good_type` varchar(20) NOT NULL COMMENT '商品类型：（ACTUAL：实际商品，VIRTUAL：虚拟商品）',
  `good_source` varchar(20) NOT NULL COMMENT '商品来源：(PLATFORM：平台，SCHOOL_TEAM：校队)',
  `original_type` varchar(255) DEFAULT 'PLATFORM' COMMENT '创建来源：(PLATFORM：平台，SCHOOL_TEAM：校队)',
  `good_title` varchar(50) NOT NULL COMMENT '商品名称',
  `original_price` decimal(12,2) DEFAULT '0.00' COMMENT '原价，划线价',
  `stock_number_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '库存计算的方式（0：不冻结；1：冻结）',
  `good_spec_type` varchar(20) NOT NULL COMMENT '商品规格类型（SINGLE：单进货价；MULTI：多进货价）',
  `person_buy_times_limit` int(11) DEFAULT '0' COMMENT '单人购买次数限制，0无限制',
  `person_buy_number_times_limit` int(11) DEFAULT '0' COMMENT '单人单次购买件数限制 0无限制',
  `person_buy_number_limit` int(11) DEFAULT '0' COMMENT '单人购买件数限制 0无限制',
  `imageurls` varchar(255) DEFAULT NULL COMMENT '图片id逗号分隔',
  `state` tinyint(4) DEFAULT '0' COMMENT '是否上库0：待上库 1：上库，2：下库，默认为0',
  `open_sell_time` datetime DEFAULT NULL COMMENT '上库时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除标识：0：未删除；1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品库';

-- ----------------------------
-- Table structure for good_stock_campus_spec
-- ----------------------------
DROP TABLE IF EXISTS `good_stock_campus_spec`;
CREATE TABLE `good_stock_campus_spec` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `good_stock_id` bigint(20) NOT NULL COMMENT '商品库id',
  `good_attribute_value_id` bigint(20) NOT NULL COMMENT '商品属性值id',
  `good_attribute_value` varchar(20) DEFAULT NULL COMMENT '商品属性值',
  `campus_id` bigint(20) NOT NULL COMMENT '校区id',
  `campus_name` varchar(20) DEFAULT NULL COMMENT '校区名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除标识：0：未删除；1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品库校区规格';

-- ----------------------------
-- Table structure for good_stock_region
-- ----------------------------
DROP TABLE IF EXISTS `good_stock_region`;
CREATE TABLE `good_stock_region` (
  `id` bigint(20) NOT NULL,
  `good_stock_id` bigint(20) NOT NULL COMMENT '商品库id',
  `campus_id` bigint(20) NOT NULL COMMENT '校区id',
  `campus_name` varchar(50) NOT NULL COMMENT '校区名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除标识：0：未删除；1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品库销售校区';

-- ----------------------------
-- Table structure for good_stock_spec
-- ----------------------------
DROP TABLE IF EXISTS `good_stock_spec`;
CREATE TABLE `good_stock_spec` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `good_stock_id` bigint(20) NOT NULL COMMENT '商品库id',
  `spec_text` varchar(500) DEFAULT NULL COMMENT '商品规格',
  `cost_price` decimal(9,2) DEFAULT '0.00' COMMENT '成本价',
  `enter_price` decimal(9,2) DEFAULT '0.00' COMMENT '进价',
  `sell_max_price` decimal(9,2) DEFAULT '0.00' COMMENT '最高售价',
  `shell_number` int(11) DEFAULT '0' COMMENT '校贝抵用数',
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `freeze_stock` int(11) DEFAULT '0' COMMENT '冻结库存',
  `sell_number` int(11) DEFAULT '0' COMMENT '销量',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(4) DEFAULT '0' COMMENT '删除标识：0：未删除；1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品库规格表';

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `relation_id` bigint(20) DEFAULT NULL COMMENT '关联对象id',
  `url` varchar(500) DEFAULT NULL COMMENT '图片url',
  `type` varchar(20) DEFAULT NULL COMMENT '商品图片、商品图文图片、评论图片',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片存储';

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `order_no` varchar(20) NOT NULL COMMENT '订单编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `role` varchar(30) DEFAULT 'NORMAL' COMMENT 'NORMAL普通账户，PLATFORM平台收入账户，GOODDEAL商品交易账户，PUBLICGROUP社团公共账户，PUBLICTEAM校队公共账户',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `user_mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `order_type` varchar(30) DEFAULT NULL COMMENT '订单类型：REFUND：退款；DRAW：代理提现；COMMISSION：分佣结算',
  `money` decimal(9,2) DEFAULT '0.00' COMMENT '订单金额',
  `order_state` varchar(20) DEFAULT NULL COMMENT '订单状态（INIT：初始化，HNDLE：处理中， FAILE：失败， SUCCESS：成功，PERSONHANDLE：人工处理）',
  `describe_reason` varchar(255) DEFAULT NULL COMMENT '描述',
  `relation_order_no` varchar(20) DEFAULT NULL COMMENT '关联订单',
  `server_id` bigint(20) DEFAULT '0' COMMENT '关联分佣计划id',
  `operation_type` varchar(30) DEFAULT 'SYSTEM' COMMENT '操作类型，SYSTEM系统操作，PERSON人工操作',
  `finish_time` datetime DEFAULT NULL COMMENT '完成时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资金订单表';

-- ----------------------------
-- Table structure for order_record
-- ----------------------------
DROP TABLE IF EXISTS `order_record`;
CREATE TABLE `order_record` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `order_no` varchar(20) DEFAULT NULL COMMENT '订单编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '操作者userID',
  `mobile` varchar(20) DEFAULT NULL COMMENT '操作者手机号',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `content` varchar(20) DEFAULT NULL COMMENT '操作内容',
  `mark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单记录';

-- ----------------------------
-- Table structure for profit_detail
-- ----------------------------
DROP TABLE IF EXISTS `profit_detail`;
CREATE TABLE `profit_detail` (
  `id` bigint(20) NOT NULL,
  `orderNo` varchar(20) DEFAULT NULL COMMENT '销售订单编号',
  `commission_rate` decimal(9,2) DEFAULT '0.00' COMMENT '佣金利率',
  `pay_rate` decimal(9,2) DEFAULT '0.00' COMMENT '支付手续费率',
  `payRateMoney` decimal(9,2) DEFAULT '0.00' COMMENT '支付手续费',
  `order_money` decimal(9,2) DEFAULT '0.00' COMMENT '订单实付金额',
  `good_stock_price` decimal(9,2) DEFAULT '0.00' COMMENT '商品进货价',
  `total_profit` decimal(9,2) DEFAULT '0.00' COMMENT '总利润',
  `store_profit` decimal(9,2) DEFAULT '0.00' COMMENT '校区利润',
  `platform_profit` decimal(9,2) DEFAULT '0.00' COMMENT '平台利润',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分润详情';

-- ----------------------------
-- Table structure for sell_order
-- ----------------------------
DROP TABLE IF EXISTS `sell_order`;
CREATE TABLE `sell_order` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `no` varchar(20) DEFAULT NULL COMMENT '商品编号',
  `good_spec_id` bigint(20) NOT NULL COMMENT '商品单品id',
  `good_id` bigint(20) DEFAULT NULL COMMENT '商品集合id',
  `good_stock_id` bigint(20) DEFAULT NULL,
  `good_stock_name` varchar(50) NOT NULL COMMENT '商品名称',
  `good_stock_type` varchar(50) DEFAULT NULL,
  `good_stock_source` varchar(20) DEFAULT NULL,
  `good_stock_spec_text` varchar(500) DEFAULT NULL,
  `good_stock_spec_image` varchar(500) DEFAULT NULL,
  `good_stock_spec_file` varchar(500) DEFAULT NULL COMMENT '商品文件信息',
  `category_name` varchar(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) NOT NULL COMMENT '店铺id',
  `school_team_id` bigint(20) DEFAULT NULL COMMENT '校队id',
  `school_team_name` varchar(50) DEFAULT NULL COMMENT '校队名称',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `user_nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `user_mobile` varchar(20) DEFAULT NULL COMMENT '用户手机号',
  `pay_rate` decimal(9,2) DEFAULT '0.00' COMMENT '支付手续费率',
  `pay_model` varchar(20) DEFAULT '' COMMENT '支付方式：WECHAT,SHELL,ALIPAY,SHELLANDWECHAT',
  `commission_rate` decimal(9,2) DEFAULT '0.00' COMMENT '店铺分佣利率',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '购买时单价',
  `buy_number` int(11) DEFAULT NULL COMMENT '购买数量',
  `pay_money` decimal(9,2) DEFAULT '0.00' COMMENT '支付金额',
  `shell` int(11) DEFAULT '0' COMMENT '使用校贝数',
  `coupon` varchar(20) DEFAULT NULL COMMENT '使用优惠',
  `state` varchar(20) DEFAULT NULL COMMENT '订单状态',
  `describe_reason` varchar(100) DEFAULT NULL COMMENT '订单关闭原因',
  `evaluate_state` varchar(20) DEFAULT NULL COMMENT '是否已评价',
  `end_type` varchar(10) DEFAULT NULL COMMENT '订单结束类型，system:系统自动结束，user:用户结束',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售订单表';

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence` (
  `name` varchar(20) NOT NULL COMMENT '序列名称',
  `current_value` bigint(20) NOT NULL COMMENT '当前值',
  `pre_value` int(11) NOT NULL DEFAULT '1' COMMENT '增量',
  `seq_date` date NOT NULL COMMENT '序列当前日期',
  PRIMARY KEY (`name`,`seq_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shell_details
-- ----------------------------
DROP TABLE IF EXISTS `shell_details`;
CREATE TABLE `shell_details` (
  `id` bigint(20) NOT NULL,
  `user_shell_id` bigint(20) NOT NULL COMMENT '用户校贝id',
  `change_number` bigint(20) NOT NULL COMMENT '变动个数',
  `gain` tinyint(4) NOT NULL COMMENT '1：+（收入）， 0：-（支出）',
  `before_num` bigint(20) NOT NULL COMMENT '变动前个数',
  `after_num` bigint(20) NOT NULL COMMENT '变动后个数',
  `describe_reason` varchar(255) NOT NULL COMMENT '变动原因',
  `order_no` varchar(20) DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='校贝详情表';

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `id` bigint(20) NOT NULL,
  `store_name` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `school_id` bigint(20) NOT NULL COMMENT '学校id',
  `school_team_id` bigint(20) NOT NULL COMMENT '校队ID',
  `describe_score` decimal(9,2) DEFAULT '0.00' COMMENT '描述评分',
  `service_score` decimal(9,2) DEFAULT '0.00' COMMENT '服务评分',
  `distribution_score` decimal(9,2) DEFAULT '0.00' COMMENT '配送评分',
  `commission_rate` decimal(9,2) DEFAULT '0.00' COMMENT '佣金费率',
  `state` tinyint(4) DEFAULT '0' COMMENT '0：关闭，1：开启',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='校队店铺';

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` bigint(20) NOT NULL COMMENT '系统配置id',
  `config_name` varchar(50) NOT NULL COMMENT '系统配置名称',
  `config_value` varchar(255) NOT NULL COMMENT '系统配置值',
  `config_desc` varchar(50) DEFAULT NULL COMMENT '系统配置说明',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_shell
-- ----------------------------
DROP TABLE IF EXISTS `user_shell`;
CREATE TABLE `user_shell` (
  `id` bigint(20) NOT NULL COMMENT '用户校贝表id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `shell_number` bigint(20) NOT NULL COMMENT '校贝数量',
  `version` bigint(20) NOT NULL COMMENT '版本号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户校贝数量表';

-- ----------------------------
-- Procedure structure for gen_sequence
-- ----------------------------
DROP PROCEDURE IF EXISTS `gen_sequence`;
DELIMITER ;;
CREATE DEFINER=`testgroup`@`%` PROCEDURE `gen_sequence`( IN seqName VARCHAR(50), IN size INT)
BEGIN
DECLARE v_result INT DEFAULT 0;
DECLARE v_cur_date DATE;
DECLARE v_current_val INTEGER DEFAULT 0;
DECLARE v_error INTEGER DEFAULT 0;
SET v_result = 0;
SET v_cur_date = CURDATE();
SELECT current_value INTO v_current_val FROM `sequence` WHERE `name` = seqName AND `seq_date` = v_cur_date FOR UPDATE;
IF v_current_val = 0 THEN
	INSERT INTO sequence(`name`, current_value, pre_value, seq_date) VALUES (seqName, size, 1, v_cur_date);
ELSE
	UPDATE sequence
	SET current_value = v_current_val + size, pre_value = v_current_val
	WHERE NAME = seqName AND `seq_date` = DATE(NOW());
END IF;
SET v_result = v_current_val + 1 ;
SELECT v_result AS seq;
END
;;
DELIMITER ;
