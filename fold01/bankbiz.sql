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
  `sale_time` datetime DEFAULT NULL COMMENT '上架时间',
  `days_of_interest` int(11) DEFAULT NULL COMMENT '计息期限',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产品创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '产品同步时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('29', '180天派息-渠道版-满兜理财', '8001ZGXX00099', 'IN_SALE', 'PREPAID', 'YES', '50.00', '1.00', '10000000000.00', '0.0460', '0.0042', '5', 'YEAR', null, null, null, null, null, '0.00', '0.00', null, null, null, null, 'ZGBANK', 'SHOW', '2020-02-29 22:38:51', null, '2020-02-27 20:23:22', '2020-03-28 05:00:01');
INSERT INTO `product` VALUES ('30', '30天派息-渠道版-满兜理财', '8001ZGXX00092', 'IN_SALE', 'PREPAID', 'YES', '50.00', '1.00', '10000000000.00', '0.0425', '0.0042', '5', 'YEAR', null, null, null, null, null, '0.00', '0.00', null, null, null, null, 'ZGBANK', 'SHOW', '2020-02-29 22:36:18', null, '2020-02-27 20:23:22', '2020-03-28 05:00:01');
INSERT INTO `product` VALUES ('31', '360天派息-渠道版-满兜理财', '8001ZGXX00104', 'IN_SALE', 'PREPAID', 'YES', '50.00', '1.00', '10000000000.00', '0.0480', '0.0042', '5', 'YEAR', null, null, null, null, null, '0.00', '0.00', null, null, null, null, 'ZGBANK', 'SHOW', '2020-02-29 18:23:11', null, '2020-02-27 20:23:22', '2020-03-28 05:00:01');
INSERT INTO `product` VALUES ('32', '7天派息-渠道版--满兜理财', '8001ZGXX00080', 'IN_SALE', 'PREPAID', 'YES', '50.00', '1.00', '10000000000.00', '0.0360', '0.0042', '5', 'YEAR', null, null, null, null, null, '0.00', '0.00', null, null, null, null, 'ZGBANK', 'SHOW', '2020-02-29 18:22:39', null, '2020-02-27 20:23:22', '2020-03-28 05:00:01');
INSERT INTO `product` VALUES ('33', '90天派息-渠道版-满兜理财', '8001ZGXX00086', 'IN_SALE', 'PREPAID', 'YES', '50.00', '1.00', '1000000000.00', '0.0440', '0.0042', '5', 'YEAR', null, null, null, null, null, '0.00', '0.00', null, null, null, null, 'ZGBANK', 'SHOW', '2020-03-02 11:42:02', null, '2020-02-27 20:23:22', '2020-03-28 05:00:01');
INSERT INTO `product` VALUES ('34', '0305测试配置', '8001ZGXX00108', 'STOP_SALE', 'PREPAID', 'YES', '50.00', '1.00', '1000000.00', '0.0480', '0.0100', '5', 'YEAR', null, null, null, null, null, '0.00', '0.00', null, null, null, null, 'ZGBANK', 'UNSHOW', '2020-03-20 17:16:42', null, '2020-03-06 00:00:01', '2020-03-28 05:00:01');

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
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='产品营销表';

-- ----------------------------
-- Records of product_marking
-- ----------------------------
INSERT INTO `product_marking` VALUES ('22', '29', '无', '双11推荐', '<p>1.该产品21:00之前购买当日起息，每180日为一个结息周期，到期后利息将会自动转出至电子账户，本金自动续存到下一周期。</p><p>2.最长存期5年，到期自动兑付。</p><p>3.若未满一个结息周期，则根据实际存款天数按自贡银行当日挂牌活期利率计息。</p>', '<p>1.支取当日不计息，支持全部提前支取，提前支取本金对应的利息按我行当日挂牌利率计算。</p><p>2.到期自动赎回至自贡银行电子账户。</p>', 'YES', 'RATE', '30', 'EVERY', '10000.00', '1.00', '0.0030', '<p>当前产品平台返利规则如下：</p><p>1.该笔购买金额所持天数必须≥30天。若所持天数＜30天，则加息金额=0元。</p><p>2.加息金额=10元。</p><p>3.加息金额将在持满周期后的次日18点前发放至您的余额，您可手动提现至您的银行卡。</p><p>4.购买次日开始算起持日期。</p>', '180', '2020-03-20 12:39:15', '2020-03-20 12:39:15');
INSERT INTO `product_marking` VALUES ('23', '30', '爆款', '双11热推', '<p>1.该产品21:00之前购买当日起息，每30日为一个结息周期，到期后利息将会自动转出至电子账户，本金自动续存到下一周期。</p><p>2.最长存期5年，到期自动兑付。</p><p>3.若未满一个结息周期，则根据实际存款天数按自贡银行当日挂牌活期利率计息。</p>', '<p>1.支取当日不计息，支持全部提前支取，提前支取本金对应的利息按我行当日挂牌利率计算。</p><p>2.到期自动赎回至自贡银行电子账户。</p>', 'YES', 'RATE', '7', 'FIRST', '10000.00', '1.00', '0.0100', '<p>当前产品平台返利规则如下：</p><p>1、该笔购买金额所持天数必须≥7天。若所持天数＜7天，则加息金额=0元。</p><p>2、购买金额&gt;=10000元。</p><p>3、加息金额=购买金额*贴息利率/365*持满周期7天。（四舍五入精确到小数点后2位）</p><p>4、加息金额将在持满周期后的次日18点前发放至您的余额，您可手动提现至您的银行卡。</p><p>5、购买次日开始算起持日期。</p>', '30', '2020-03-20 11:09:13', '2020-03-20 11:09:13');
INSERT INTO `product_marking` VALUES ('24', '31', '新品', '双11热推', '<p>1.该产品21:00之前购买当日起息，每360日为一个结息周期，到期后利息将会自动转出至电子账户，本金自动续存到下一周期。</p><p>2.最长存期5年，到期自动兑付。</p><p>3.若未满一个结息周期，则根据实际存款天数按自贡银行当日挂牌活期利率计息。</p>', '<p>1.支取当日不计息，支持全部提前支取，提前支取本金对应的利息按我行当日挂牌利率计算。</p><p>2.到期自动赎回至自贡银行电子账户。</p>', 'YES', 'RATE', '30', 'EVERY', '10000.00', '1.00', '0.0050', '<p>当前产品平台返利规则如下：</p><p>1、该笔购买金额所持天数必须≥30天。若所持天数＜30天，则加息金额=0元。</p><p>2、购买金额&gt;=10000元。</p><p>3、加息金额=购买金额*贴息利率/365*持满周期30天。（四舍五入精确到小数点后2位）</p><p>4、加息金额将在持满周期后的次日18点前发放至您的余额，您可手动提现至您的银行卡。</p><p>5、购买次日开始算起持日期。</p>', '360', '2020-03-04 16:38:40', '2020-03-04 16:38:40');
INSERT INTO `product_marking` VALUES ('25', '32', '精选', '双11热推', '<p>1.该产品21:00之前购买当日起息，每7日为一个结息周期，到期后利息将会自动转出至电子账户，本金自动续存到下一周期。</p><p>2.最长存期5年，到期自动兑付。</p><p>3.若未满一个结息周期，则根据实际存款天数按自贡银行当日挂牌活期利率计息。</p>', '<p>1.支取当日不计息，支持全部提前支取，提前支取本金对应的利息按我行当日挂牌利率计算。</p><p>2.到期自动赎回至自贡银行电子账户。</p>', 'YES', 'RATE', '1', 'EVERY', '1000.00', '1.00', '0.0100', '<p>当前产品平台返利规则如下：</p><p>1、该笔购买金额所持天数必须≥1天。若所持天数＜1天，则加息金额=0元。</p><p>2、购买金额&gt;=1000元。</p><p>3、加息金额=购买金额*贴息利率/365*持满周期7天。（四舍五入精确到小数点后2位）</p><p>4、加息金额将在持满周期后的次日18点前发放至您的余额，您可手动提现至您的银行卡。</p><p>5、购买次日开始算起持日期。</p>', '7', '2020-03-05 13:20:11', '2020-03-05 13:20:11');
INSERT INTO `product_marking` VALUES ('26', '33', '精选', '11推荐优选', '<p>1.该产品21:00之前购买当日起息，每90日为一个结息周期，到期后利息将会自动转出至电子账户，本金自动续存到下一周期。</p><p>2.最长存期5年，到期自动兑付。</p><p>3.若未满一个结息周期，则根据实际存款天数按自贡银行当日挂牌活期利率计息。</p>', '<p>1.支取当日不计息，支持全部提前支取，提前支取本金对应的利息按我行当日挂牌利率计算。</p><p>2.到期自动赎回至自贡银行电子账户。</p>', 'YES', 'RATE', '9', 'EVERY', '1000.00', '1.00', '0.0030', '<p>当前产品平台返利规则如下：</p><p>1、该笔购买金额所持天数必须≥7天。若所持天数＜7天，则加息金额=0元。</p><p>2、购买金额&gt;=10000元。</p><p>3、加息金额=购买金额*贴息利率/365*持满周期7天。（四舍五入精确到小数点后2位）</p><p>4、加息金额将在持满周期后的次日18点前发放至您的余额，您可手动提现至您的银行卡。</p><p>5、购买次日开始算起持日期。</p>', '90', '2020-03-20 17:28:05', '2020-03-20 17:28:05');
INSERT INTO `product_marking` VALUES ('27', '34', '精选', '', '', '', 'YES', 'RATE', '15', 'EVERY', '50.00', '1.00', '0.0030', '', '1', '2020-03-20 17:16:34', '2020-03-20 17:16:34');

