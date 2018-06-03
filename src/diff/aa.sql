
DROP TABLE IF EXISTS `bd_bank_account_info`;
CREATE TABLE `bd_bank_account_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `acc_brief_code` varchar(20) DEFAULT NULL COMMENT '账户简码',
  `acc_brief_name` varchar(40) DEFAULT NULL COMMENT '账户简称',
  `account_code` varchar(40) DEFAULT NULL COMMENT '帐号',
  `acc_name` varchar(200) DEFAULT NULL COMMENT '账户名',
  `cnaps` varchar(40) DEFAULT NULL COMMENT '联行号',
  `belong_bank_id` int(11) DEFAULT NULL COMMENT '所属银行编号',
  `belong_bank_name` varchar(100) DEFAULT NULL COMMENT '所属银行名称',
  `open_acc_bank_id` int(11) DEFAULT NULL COMMENT '开户行id',
  `open_acc_bank` varchar(100) DEFAULT NULL,
  `belong_company_id` int(11) DEFAULT NULL COMMENT '所属公司ID',
  `belong_company_ou` varchar(50) DEFAULT NULL COMMENT '所属公司OU编码',
  `belong_company` varchar(200) DEFAULT NULL COMMENT '所属公司',
  `currency` int(11) DEFAULT NULL COMMENT '币种',
  `currency_name` varchar(64) DEFAULT NULL COMMENT '币种名称',
  `acc_nature` tinyint(4) DEFAULT NULL COMMENT '账户性质',
  `open_acc_area` varchar(50) DEFAULT NULL COMMENT '开户地区',
  `bank_linkman` varchar(30) DEFAULT NULL COMMENT '银行联系人',
  `bank_linkman_phone` varchar(50) DEFAULT NULL,
  `acc_leader` varchar(30) DEFAULT NULL COMMENT '账户负责人',
  `fund_manage_org` tinyint(4) DEFAULT NULL COMMENT '资金管理机构',
  `acc_manage_org` tinyint(4) DEFAULT NULL COMMENT '核算管理机构',
  `bank_address` varchar(100) DEFAULT NULL COMMENT '银行地址',
  `open_acc_date` datetime DEFAULT NULL COMMENT '开户时间',
  `cancel_acc_date` datetime DEFAULT NULL COMMENT '销户时间',
  `acc_use` tinyint(4) DEFAULT NULL COMMENT '账户用途',
  `limit_type` tinyint(4) DEFAULT NULL COMMENT '受限类型',
  `fund_cache_acc` tinyint(4) DEFAULT NULL COMMENT '是否资金池账户',
  `acc_type` tinyint(4) DEFAULT NULL COMMENT '账户类型',
  `acc_status` tinyint(4) DEFAULT NULL COMMENT '账户状态',
  `money_properties` tinyint(4) DEFAULT NULL COMMENT '存款性质',
  `creator_pin` varchar(30) DEFAULT NULL COMMENT '创建人pin',
  `creator` varchar(30) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_user_pin` varchar(30) DEFAULT NULL COMMENT '最后修改人pin',
  `last_update_user` varchar(30) DEFAULT NULL COMMENT '最后修改人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `swift_code` varchar(40) DEFAULT NULL COMMENT 'swift code代码',
  `city` varchar(40) DEFAULT NULL COMMENT '城市编码',
  `country` varchar(40) DEFAULT '' COMMENT '国家编码',
  `domestic_overseas` tinyint(4) DEFAULT NULL COMMENT '境内境外',
  `business_section` tinyint(4) DEFAULT NULL COMMENT '业务板块',
  `limit_type_detail` tinyint(4) DEFAULT NULL COMMENT '余额来源',
  `independent_account` tinyint(4) DEFAULT NULL COMMENT '独立核算 1:是，2:否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `acc_brief_code` (`acc_brief_code`),
  UNIQUE KEY `acc_brief_name` (`acc_brief_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5493 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_bank_info
-- ----------------------------
DROP TABLE IF EXISTS `bd_bank_info`;
CREATE TABLE `bd_bank_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bank_code` varchar(16) DEFAULT NULL COMMENT '银行编码',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '银行名称',
  `status` tinyint(4) DEFAULT NULL COMMENT '使用状态',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(30) DEFAULT NULL COMMENT '创建人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `last_update_user` varchar(30) DEFAULT NULL COMMENT '最后修改人',
  `old_id` int(11) DEFAULT NULL COMMENT '对应fmsDictionary表中银行的id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bank_code` (`bank_code`),
  UNIQUE KEY `bank_name` (`bank_name`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_bank_other_info
-- ----------------------------
DROP TABLE IF EXISTS `bd_bank_other_info`;
CREATE TABLE `bd_bank_other_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bank_id` int(11) DEFAULT NULL COMMENT '银行id',
  `acc_brief_name` varchar(40) DEFAULT NULL COMMENT '账户简称',
  `order_trans_type` varchar(40) DEFAULT NULL COMMENT '订单交易费扣收方式(账扣非帐扣)',
  `order_trans_rate` varchar(40) DEFAULT NULL COMMENT '订单交易费费率(%)',
  `rate_start_date` datetime DEFAULT NULL COMMENT '费率开始时间',
  `rate_end_date` datetime DEFAULT NULL COMMENT '费率结束时间',
  `contract_start_date` datetime DEFAULT NULL COMMENT '合同开始时间',
  `contract_end_date` datetime DEFAULT NULL COMMENT '合同结束时间',
  `certifi_start_date` datetime DEFAULT NULL COMMENT '证书开始时间',
  `certifi_end_date` datetime DEFAULT NULL COMMENT '证书结束时间',
  `pay_product` varchar(64) DEFAULT NULL COMMENT '支付产品/功能',
  `email_addr` varchar(128) DEFAULT NULL COMMENT '邮件地址',
  `login_user` varchar(64) DEFAULT NULL COMMENT '登录用户名',
  `login_password` varchar(128) DEFAULT NULL COMMENT '登录密码',
  `creator` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `busi_partment` tinyint(4) DEFAULT NULL COMMENT '业务部门',
  `busi_segement2` tinyint(4) DEFAULT NULL COMMENT '业务板块2',
  `report_type` tinyint(4) DEFAULT NULL COMMENT '报表类型',
  `modifier` varchar(50) DEFAULT NULL COMMENT '修改人erp',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `bd_bank_other_info_index` (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=utf8 COMMENT='账户其他信息';

-- ----------------------------
-- Table structure for bd_bank_protocol_savings_info
-- ----------------------------
DROP TABLE IF EXISTS `bd_bank_protocol_savings_info`;
CREATE TABLE `bd_bank_protocol_savings_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bank_id` int(11) DEFAULT NULL COMMENT '银行id',
  `current_rate` decimal(30,6) DEFAULT NULL,
  `protocol_saving` tinyint(4) DEFAULT NULL COMMENT '是否协定存款',
  `protocol_start_date` datetime DEFAULT NULL COMMENT '协定开始日期',
  `protocol_end_date` datetime DEFAULT NULL COMMENT '协定结束日期',
  `protocol_start_amount` decimal(30,4) DEFAULT NULL COMMENT '协定起存金额',
  `protocol_save_rate` decimal(30,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bd_bank_protocol_savings_info_index` (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2734 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_call_system_info
-- ----------------------------
DROP TABLE IF EXISTS `bd_call_system_info`;
CREATE TABLE `bd_call_system_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `systemid` int(11) DEFAULT NULL COMMENT '系统id',
  `systemname` varchar(100) DEFAULT NULL COMMENT '系统名称',
  `systemleader` varchar(100) DEFAULT NULL COMMENT '系统负责人',
  `systemtoken` varchar(100) DEFAULT NULL COMMENT '系统token',
  `valid` int(11) DEFAULT NULL COMMENT '是否有效 0 无效 1 有效',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_id_token` (`systemid`,`systemtoken`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='主数据调用系统信息';

-- ----------------------------
-- Table structure for bd_company_base_info
-- ----------------------------
DROP TABLE IF EXISTS `bd_company_base_info`;
CREATE TABLE `bd_company_base_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公司id',
  `ebs_id` varchar(40) DEFAULT NULL COMMENT 'ebs编号',
  `old_code` varchar(40) DEFAULT NULL COMMENT '老基础数据里公司编号',
  `company_ou` varchar(40) DEFAULT NULL COMMENT '公司OU编号',
  `company_name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `company_brief_name` varchar(50) DEFAULT NULL COMMENT '公司简称',
  `reg_province` varchar(50) DEFAULT NULL COMMENT '注册省市',
  `found_date` datetime DEFAULT NULL COMMENT '设立日期',
  `business_scope` varchar(100) DEFAULT NULL COMMENT '经营范围',
  `legal_person` varchar(30) DEFAULT NULL COMMENT '法定代表人',
  `account_method` varchar(30) DEFAULT NULL COMMENT '核算方式',
  `status` tinyint(4) DEFAULT NULL COMMENT '当前状态',
  `main_business` varchar(50) DEFAULT NULL COMMENT '主业务板块',
  `assist_business` varchar(50) DEFAULT NULL COMMENT '辅业务板块',
  `country` varchar(50) DEFAULT NULL COMMENT '国别/地区',
  `country_name` varchar(50) DEFAULT NULL COMMENT '国家名称',
  `address_detail` varchar(150) DEFAULT NULL COMMENT '具体地址',
  `belong_area` varchar(50) DEFAULT NULL COMMENT '所属区域',
  `actual_business` varchar(255) DEFAULT NULL COMMENT '实际经营业务',
  `account_sys` tinyint(4) DEFAULT NULL COMMENT '适用会计制度',
  `memo` varchar(500) DEFAULT NULL COMMENT '备注',
  `creator_pin` varchar(30) DEFAULT NULL COMMENT '创建人pin',
  `creator` varchar(30) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `reg_capital` decimal(30,4) DEFAULT NULL COMMENT '注册资本',
  `invest_total_account` decimal(30,4) DEFAULT NULL COMMENT '投资总额',
  `currency` int(11) DEFAULT NULL COMMENT '币种',
  `first_investor` varchar(100) DEFAULT NULL COMMENT '第一投资方',
  `first_investor_scale` decimal(30,4) DEFAULT NULL COMMENT '第一投资方持股比例',
  `sec_investor` varchar(100) DEFAULT NULL COMMENT '第二投资方',
  `sec_investor_scale` decimal(30,4) DEFAULT NULL COMMENT '第二投资方持股比例',
  `third_investor` varchar(100) DEFAULT NULL COMMENT '第三投资方',
  `third_investor_scale` decimal(30,4) DEFAULT NULL COMMENT '第三投资方持股比例',
  `fourth_investor` varchar(100) DEFAULT NULL COMMENT '第四投资方',
  `fourth_investor_scale` decimal(30,4) DEFAULT NULL COMMENT '第四投资方持股比例',
  `fifth_investor` varchar(100) DEFAULT NULL COMMENT '第五投资方',
  `fifth_investor_scale` decimal(30,4) DEFAULT NULL COMMENT '第五投资方持股比例',
  `case_des` varchar(255) DEFAULT NULL COMMENT '增资情况说明',
  `bd_company_base_info` int(11) DEFAULT NULL,
  `old_company_id` int(11) DEFAULT NULL COMMENT '对应fmsDictionary表中分公司id',
  `old_manage_unit_id` int(11) DEFAULT NULL COMMENT '对应fmsDictionary表中管理单位id',
  `independent_account` tinyint(4) DEFAULT NULL COMMENT '独立核算 1:是，2:否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_name` (`company_name`)
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_company_docs
-- ----------------------------
DROP TABLE IF EXISTS `bd_company_docs`;
CREATE TABLE `bd_company_docs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `business_id` bigint(20) DEFAULT NULL COMMENT '业务id',
  `business_type` tinyint(4) DEFAULT NULL COMMENT '1 公司附件 2 银行文档',
  `doc_name` varchar(100) DEFAULT NULL COMMENT '文档名称',
  `doc_size` decimal(10,0) DEFAULT NULL COMMENT '文档大小',
  `doc_path` varchar(200) DEFAULT NULL COMMENT '文档存储地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `creator_pin` varchar(30) DEFAULT NULL COMMENT '创建人pin',
  `creator` varchar(30) DEFAULT NULL COMMENT '创建人',
  `memo` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `business_id` (`business_id`,`business_type`,`doc_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_country
-- ----------------------------
DROP TABLE IF EXISTS `bd_country`;
CREATE TABLE `bd_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `country_code` varchar(20) DEFAULT NULL COMMENT '国家编码',
  `country_name` varchar(255) DEFAULT NULL COMMENT '国家名称',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_currency_info
-- ----------------------------
DROP TABLE IF EXISTS `bd_currency_info`;
CREATE TABLE `bd_currency_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `currency_name` varchar(20) DEFAULT NULL COMMENT '币种名称',
  `currency_brief_code` varchar(20) DEFAULT NULL COMMENT '币种简称',
  `status` tinyint(4) DEFAULT NULL COMMENT '1可用，0作废',
  `sort_code` varchar(20) DEFAULT NULL COMMENT '排序编号',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(30) DEFAULT NULL COMMENT '创建人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `last_update_user` varchar(30) DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_brief_code` (`currency_brief_code`),
  UNIQUE KEY `currency_name` (`currency_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1066 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_cyber_bank_conf
-- ----------------------------
DROP TABLE IF EXISTS `bd_cyber_bank_conf`;
CREATE TABLE `bd_cyber_bank_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bank_id` int(11) DEFAULT NULL COMMENT '银行id',
  `net_bank` tinyint(4) DEFAULT NULL COMMENT '是否网银',
  `bank_company` tinyint(4) DEFAULT NULL COMMENT '是否银企直连',
  `minimum_draw` decimal(30,4) DEFAULT NULL COMMENT '最小上划',
  `gather` tinyint(4) DEFAULT NULL COMMENT '是否归集',
  `save_upper_limit` decimal(30,4) DEFAULT NULL COMMENT '留存上限',
  `save_lower_limit` decimal(30,4) DEFAULT NULL COMMENT '留存下限',
  `upper_take_acc_id` int(11) DEFAULT NULL COMMENT '对应上级帐户ID',
  `upper_take_acc` varchar(40) DEFAULT NULL COMMENT '对应上级帐户',
  `inside_account_id` int(11) DEFAULT NULL COMMENT '对应内部帐户ID',
  `inside_account` varchar(40) DEFAULT NULL COMMENT '对应内部帐户',
  `auto_up_take_time1` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '自动上收时点1',
  `auto_up_take_time2` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '自动上收时点2',
  `behalf_agreement_type` varchar(15) DEFAULT NULL COMMENT '代发协议类型',
  `behalf_agreement_code` varchar(25) DEFAULT NULL COMMENT '代发协议编码',
  `balance_monitoring` tinyint(4) DEFAULT NULL COMMENT '余额监控',
  `balance_origin` tinyint(4) DEFAULT NULL COMMENT '余额来源',
  `routing_number` varchar(10) DEFAULT NULL COMMENT 'Routing Number',
  `iban` varchar(10) DEFAULT NULL COMMENT 'IBAN',
  PRIMARY KEY (`id`),
  KEY `bd_cyber_bank_conf_index` (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3342 DEFAULT CHARSET=utf8 COMMENT='也叫是否上收';

-- ----------------------------
-- Table structure for bd_exchange_rate
-- ----------------------------
DROP TABLE IF EXISTS `bd_exchange_rate`;
CREATE TABLE `bd_exchange_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `foreign_currency_id` int(11) DEFAULT NULL COMMENT '换算币种id',
  `foreign_currency_code` varchar(30) DEFAULT NULL COMMENT '币种编码',
  `foreign_currency_name` varchar(30) DEFAULT NULL COMMENT '换算币种名称',
  `base_currency_id` int(11) DEFAULT NULL COMMENT '基准币种id',
  `base_currency_code` varchar(30) DEFAULT NULL COMMENT '基准币种编码',
  `base_currency_name` varchar(30) DEFAULT NULL COMMENT '基准币种名称',
  `rate` decimal(30,6) DEFAULT NULL COMMENT '汇率',
  `rate_type` tinyint(4) DEFAULT NULL COMMENT '汇率类型',
  `rate_date` datetime DEFAULT NULL COMMENT '汇率日期',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `newly` tinyint(4) DEFAULT NULL COMMENT '是否最新',
  `status` tinyint(4) DEFAULT NULL COMMENT '1可用，0作废',
  `creator_pin` varchar(30) DEFAULT NULL COMMENT '创建人pin',
  `creator` varchar(30) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_user_pin` varchar(30) DEFAULT NULL COMMENT '最后修改人pin',
  `last_update_user` varchar(30) DEFAULT NULL COMMENT '最后修改人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_fund_subject
-- ----------------------------
DROP TABLE IF EXISTS `bd_fund_subject`;
CREATE TABLE `bd_fund_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `subject_code` varchar(20) DEFAULT NULL COMMENT '资金科目编码',
  `subject_name` varchar(50) DEFAULT NULL COMMENT '资金科目名称',
  `subject_sort_id` int(11) DEFAULT NULL COMMENT '资金科目分类',
  `subject_sort_name` varchar(50) DEFAULT NULL COMMENT '资金科目分类名称',
  `subject_brief_code` varchar(50) DEFAULT NULL COMMENT '资金科目简码',
  `borrowing` tinyint(4) DEFAULT NULL COMMENT '收入/支出',
  `status` tinyint(4) DEFAULT NULL COMMENT '使用状态',
  `subject_attri` varchar(50) DEFAULT NULL COMMENT '资金科目属性',
  `fund_flow_code` varchar(50) DEFAULT NULL COMMENT '对应现金流编码',
  `creator_pin` varchar(30) DEFAULT NULL COMMENT '创建人pin',
  `creator` varchar(30) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_date` datetime DEFAULT NULL COMMENT '最新修改时间',
  `update_user_pin` varchar(30) DEFAULT NULL COMMENT '修改人pin',
  `update_user` varchar(30) DEFAULT NULL COMMENT '修改人',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `old_fund_subject_id` int(11) DEFAULT NULL COMMENT '对应fmsDictionary表中的分类id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_code` (`subject_code`),
  UNIQUE KEY `subject_name` (`subject_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12312318 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_fund_subject_sort
-- ----------------------------
DROP TABLE IF EXISTS `bd_fund_subject_sort`;
CREATE TABLE `bd_fund_subject_sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort_code` varchar(50) DEFAULT NULL COMMENT '分类编码',
  `sort_name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `parent_sort_id` int(11) DEFAULT NULL COMMENT '父分类编码',
  `orders_num` int(11) DEFAULT NULL COMMENT '级次',
  `leaf` tinyint(4) DEFAULT NULL COMMENT '是否叶子节点',
  `status` tinyint(4) DEFAULT NULL COMMENT '使用状态',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sort_code` (`sort_code`),
  UNIQUE KEY `sort_name` (`sort_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_gather_bank_account_info
-- ----------------------------
DROP TABLE IF EXISTS `bd_gather_bank_account_info`;
CREATE TABLE `bd_gather_bank_account_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bank_id` int(11) DEFAULT NULL COMMENT '银行id',
  `IS_SWIFTGATHE` tinyint(4) DEFAULT NULL COMMENT '是否swift通道收款',
  `GATHER_ACCOUNTCODE` varchar(50) DEFAULT NULL COMMENT '账号',
  `GATHER_ACCNAME` varchar(200) DEFAULT NULL COMMENT '账户名',
  `GATHER_ADDRESS` varchar(100) DEFAULT NULL COMMENT '收款人地址',
  `GATHER_OPENACC_BANKNAME` varchar(100) DEFAULT NULL COMMENT '开户行名称',
  `GATHER_SWIFTCODE` varchar(40) DEFAULT NULL COMMENT '开户行swift code',
  `GATHER_BANKADDRESS` varchar(100) DEFAULT NULL COMMENT '开户行地址',
  `GETHER_INTERMEDIARY_BANKNAME` varchar(100) DEFAULT NULL COMMENT '中转行名称',
  `GATHER_INTERMEDIARY_BANKSWIFTCODE` varchar(40) DEFAULT NULL COMMENT '中转行swift code',
  `GATHER_INTERMEDIARY_BANKADDRESS` varchar(40) DEFAULT NULL COMMENT '中转行地址',
  `GATHER_OPENACC_BANKCOUNTRY` varchar(10) DEFAULT NULL COMMENT '开户行国别代码',
  `GATHER_BRANCH_BANKCODE` varchar(10) DEFAULT NULL COMMENT '分行代码',
  PRIMARY KEY (`id`),
  KEY `bd_gather_bank_account_info_index` (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2075 DEFAULT CHARSET=utf8 COMMENT='swift通道收款';

-- ----------------------------
-- Table structure for bd_inside_account_info
-- ----------------------------
DROP TABLE IF EXISTS `bd_inside_account_info`;
CREATE TABLE `bd_inside_account_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `acc_brief_code` varchar(20) DEFAULT NULL COMMENT '内部账户简码',
  `acc_brief_name` varchar(50) DEFAULT NULL COMMENT '内部账户简称',
  `belong_company_id` int(11) DEFAULT NULL COMMENT '所属公司ID',
  `belong_company` varchar(100) DEFAULT NULL COMMENT '所属公司',
  `money_properties` tinyint(4) DEFAULT NULL COMMENT '存款性质',
  `currency` int(11) DEFAULT NULL COMMENT '币种',
  `open_acc_date` datetime DEFAULT NULL COMMENT '开户时间',
  `cancel_acc_date` datetime DEFAULT NULL COMMENT '销户时间',
  `account_no` varchar(50) DEFAULT NULL COMMENT '帐套号',
  `acc_leader` varchar(30) DEFAULT NULL COMMENT '负责人',
  `belong_fund_cache` tinyint(4) DEFAULT NULL COMMENT '所属资金池',
  `start_balance` decimal(30,4) DEFAULT NULL COMMENT '期初余额',
  `acc_status` tinyint(4) DEFAULT NULL COMMENT '账户状态',
  `subject` varchar(50) DEFAULT NULL COMMENT '对应往来科目',
  `record_interest` tinyint(4) DEFAULT NULL COMMENT '是否计息',
  `interest_rate` decimal(30,4) DEFAULT NULL COMMENT '利率',
  `allow_overdraft` tinyint(4) DEFAULT NULL COMMENT '是否允许透支',
  `overdraft_limit` decimal(30,4) DEFAULT NULL COMMENT '透支额度',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `creator` varchar(30) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `acc_brief_code` (`acc_brief_code`),
  UNIQUE KEY `acc_brief_name` (`acc_brief_name`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_keyvalueentity
-- ----------------------------
DROP TABLE IF EXISTS `bd_keyvalueentity`;
CREATE TABLE `bd_keyvalueentity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` varchar(20) DEFAULT NULL COMMENT '编码',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `category` int(11) DEFAULT NULL COMMENT '分类',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_limit_type
-- ----------------------------
DROP TABLE IF EXISTS `bd_limit_type`;
CREATE TABLE `bd_limit_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `limit_name` varchar(20) DEFAULT NULL COMMENT '受限名称',
  `parent_sort_id` int(11) DEFAULT NULL COMMENT '父分类编码',
  `orders_num` int(11) DEFAULT NULL COMMENT '级次',
  `leaf` tinyint(4) DEFAULT NULL COMMENT '是否叶子节点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_sett_mode
-- ----------------------------
DROP TABLE IF EXISTS `bd_sett_mode`;
CREATE TABLE `bd_sett_mode` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `paying_mode_code` varchar(16) DEFAULT NULL COMMENT '付款方式编码',
  `paying_mode_name` varchar(30) DEFAULT NULL COMMENT '付款方式名称',
  `status` tinyint(4) DEFAULT NULL COMMENT '1可用，0作废',
  `sort_code` varchar(20) DEFAULT NULL COMMENT '排序编号',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(30) DEFAULT NULL COMMENT '创建人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `last_update_user` varchar(30) DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `paying_mode_code` (`paying_mode_code`),
  UNIQUE KEY `paying_mode_name` (`paying_mode_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_sett_sys_info
-- ----------------------------
DROP TABLE IF EXISTS `bd_sett_sys_info`;
CREATE TABLE `bd_sett_sys_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sett_brief_code` varchar(50) DEFAULT NULL COMMENT '结算系统简写',
  `sett_sys_name` varchar(50) DEFAULT NULL COMMENT '结算系统名称',
  `status` tinyint(4) DEFAULT NULL COMMENT '1可用，0作废',
  `sort_code` varchar(20) DEFAULT NULL COMMENT '排序编号',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(30) DEFAULT NULL COMMENT '创建人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `last_update_user` varchar(30) DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sett_brief_code` (`sett_brief_code`),
  UNIQUE KEY `sett_sys_name` (`sett_sys_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_whitelist_receive_info
-- ----------------------------
DROP TABLE IF EXISTS `bd_whitelist_receive_info`;
CREATE TABLE `bd_whitelist_receive_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `receive_name` varchar(100) DEFAULT NULL COMMENT '收款方名称',
  `settle_name` int(11) DEFAULT NULL COMMENT '结算系统',
  `pay_mode` int(11) DEFAULT NULL COMMENT '付款方式',
  `valid` int(11) DEFAULT NULL COMMENT '是否有效',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_pin` varchar(50) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_pin` varchar(50) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inx_rec_set` (`receive_name`,`settle_name`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='主数据--白名单';

-- ----------------------------
-- Table structure for bd_work_together_bank_info
-- ----------------------------
DROP TABLE IF EXISTS `bd_work_together_bank_info`;
CREATE TABLE `bd_work_together_bank_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cnaps` varchar(40) DEFAULT NULL COMMENT '联行号',
  `subbranch_name` varchar(100) DEFAULT NULL,
  `belong_bank` int(11) DEFAULT NULL COMMENT '所属银行',
  `open_acc_area` varchar(50) DEFAULT NULL COMMENT '地区',
  `bank_linkman` varchar(30) DEFAULT NULL COMMENT '银行联系人',
  `contact_way` varchar(50) DEFAULT NULL COMMENT '联系方式',
  `post_code` varchar(20) DEFAULT NULL COMMENT '邮编',
  `asse_level` tinyint(4) DEFAULT NULL COMMENT '考核级别',
  `bank_address` varchar(100) DEFAULT NULL COMMENT '银行地址',
  `trust_money` decimal(30,4) DEFAULT NULL COMMENT '授信总额',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `creator_pin` varchar(30) DEFAULT NULL COMMENT '创建人pin',
  `creator` varchar(30) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_user_pin` varchar(30) DEFAULT NULL COMMENT '最后修改人pin',
  `last_update_user` varchar(30) DEFAULT NULL COMMENT '最后修改人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `overseasAcc` tinyint(4) unsigned DEFAULT NULL COMMENT '是否海外银行',
  `swift_code` varchar(40) DEFAULT NULL COMMENT 'swift code',
  `city` varchar(40) DEFAULT NULL COMMENT '城市代码',
  `country` varchar(40) DEFAULT NULL COMMENT '国家代码',
  `routing_number` varchar(10) DEFAULT NULL COMMENT 'Routing Number',
  `iban` varchar(10) DEFAULT NULL COMMENT 'IBAN',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subbranch_name` (`subbranch_name`),
  UNIQUE KEY `cnaps` (`cnaps`)
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cnaps_version
-- ----------------------------
DROP TABLE IF EXISTS `cnaps_version`;
CREATE TABLE `cnaps_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `valid` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  `createPin` varchar(50) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fss_balance_bank_poundage
-- ----------------------------
DROP TABLE IF EXISTS `fss_balance_bank_poundage`;
CREATE TABLE `fss_balance_bank_poundage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bankCode` int(11) NOT NULL COMMENT '银行帐号',
  `bankSn` varchar(100) NOT NULL COMMENT '流水号',
  `keyBankSn` varchar(100) NOT NULL COMMENT '防重流水号',
  `txType` tinyint(4) DEFAULT NULL COMMENT '借贷',
  `txAmount` decimal(18,4) DEFAULT NULL COMMENT '交易金额',
  `txTime` date DEFAULT NULL COMMENT '交易时间',
  `valid` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fss_import_file
-- ----------------------------
DROP TABLE IF EXISTS `fss_import_file`;
CREATE TABLE `fss_import_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `FILECODE` varchar(200) DEFAULT NULL COMMENT '文件编码',
  `FILENAME` varchar(50) DEFAULT NULL COMMENT '文件名称',
  `FILESTATUS` int(11) DEFAULT NULL COMMENT '文件状态',
  `FILETYPE` int(11) DEFAULT NULL COMMENT '文件类型',
  `OPCODE` varchar(50) DEFAULT NULL COMMENT '操作人pin',
  `OPNAME` varchar(50) DEFAULT NULL COMMENT '操作人名称',
  `TASKRUNTIMES` int(11) DEFAULT NULL COMMENT '运行次数',
  `BANKCODE` int(11) DEFAULT NULL COMMENT '银行账户',
  `BATCHID` varchar(50) DEFAULT NULL COMMENT '批次号',
  `REMARK` varchar(256) DEFAULT NULL COMMENT '备注',
  `CREATEDATE` datetime DEFAULT NULL COMMENT '建立时间',
  `UPDATEDATE` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传文件表';

-- ----------------------------
-- Table structure for jd_cnaps
-- ----------------------------
DROP TABLE IF EXISTS `jd_cnaps`;
CREATE TABLE `jd_cnaps` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cnapsNo` varchar(15) DEFAULT NULL COMMENT '联行号',
  `bankNo` varchar(4) DEFAULT NULL COMMENT '银行编码',
  `bankName` varchar(30) DEFAULT NULL COMMENT '银行名称',
  `opBankName` varchar(50) DEFAULT NULL COMMENT '支行名称',
  `opBankAddr` varchar(50) DEFAULT NULL COMMENT '支行地址',
  `proNo` varchar(10) DEFAULT NULL COMMENT '省编码',
  `proName` varchar(20) DEFAULT NULL COMMENT '省名称',
  `regNoOne` varchar(4) DEFAULT NULL COMMENT '地区编码',
  `regNameOne` varchar(30) DEFAULT NULL COMMENT '地区名称',
  `regNoTwo` varchar(4) DEFAULT NULL COMMENT '地区编码',
  `regNameTwo` varchar(30) DEFAULT NULL COMMENT '地区名称',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `creator` varchar(30) DEFAULT NULL COMMENT '操作人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_user` varchar(30) DEFAULT NULL COMMENT '最后修改人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `platformaccount` tinyint(4) DEFAULT NULL COMMENT '是否平台账户 1 是 0 否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnapsNo` (`cnapsNo`),
  UNIQUE KEY `opBankName` (`opBankName`),
  KEY `idx_regNoOne` (`regNoOne`),
  KEY `idx_proNo` (`proNo`)
) ENGINE=InnoDB AUTO_INCREMENT=96019 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jd_ohter_cnaps
-- ----------------------------
DROP TABLE IF EXISTS `jd_ohter_cnaps`;
CREATE TABLE `jd_ohter_cnaps` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cnapsNo` varchar(15) DEFAULT NULL COMMENT '联行号',
  `opBankName` varchar(50) DEFAULT NULL COMMENT '支行名称',
  `cnapsUpdateType` tinyint(4) DEFAULT NULL COMMENT '更新类型',
  `version` int(11) DEFAULT NULL COMMENT '版本',
  `valid` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  `currenctCnapsNo` varchar(15) DEFAULT NULL COMMENT '原联行号',
  `currenctOpBankName` varchar(50) DEFAULT NULL COMMENT '原支行名称',
  `isFinish` tinyint(4) DEFAULT NULL COMMENT '是否完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1771440 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jd_region
-- ----------------------------
DROP TABLE IF EXISTS `jd_region`;
CREATE TABLE `jd_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `proNo` varchar(10) DEFAULT NULL COMMENT '省编码',
  `proName` varchar(20) DEFAULT NULL COMMENT '省名称',
  `regNoOne` varchar(4) DEFAULT NULL COMMENT '地区编码',
  `regNameOne` varchar(30) DEFAULT NULL COMMENT '地区名称',
  `regNoTwo` varchar(4) DEFAULT NULL COMMENT '地区编码',
  `regNameTwo` varchar(30) DEFAULT NULL COMMENT '地区名称',
  `regFlag` tinyint(4) DEFAULT NULL COMMENT '地区级别 1：一级城市，2:2级城市',
  `creator` varchar(30) DEFAULT NULL COMMENT '操作人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_user` varchar(30) DEFAULT NULL COMMENT '最后修改人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2338 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jd_reg_bank
-- ----------------------------
DROP TABLE IF EXISTS `jd_reg_bank`;
CREATE TABLE `jd_reg_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `regNoOne` varchar(4) DEFAULT NULL COMMENT '地区编码',
  `regNameOne` varchar(30) DEFAULT NULL COMMENT '地区名称',
  `regBankNo` varchar(10) DEFAULT NULL COMMENT '银行所属地区编码',
  `proName` varchar(20) DEFAULT NULL COMMENT '银行所属省份名称',
  `regBankName` varchar(10) DEFAULT NULL COMMENT '银行所属地区名称',
  `bankFlag` tinyint(4) DEFAULT NULL COMMENT '银行标志：1 招行 2 交行 3工行',
  `creator` varchar(30) DEFAULT NULL COMMENT '操作人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `regNoOne` (`regNoOne`,`regBankNo`,`bankFlag`)
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8;



LOAD DATA LOCAL INFILE '/export/hello1.csv' INTO TABLE message FIELDS TERMINATED BY ';'  LINES TERMINATED BY '\n' ( id,user_id,message,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10 )
