/*
Navicat MySQL Data Transfer

Source Server         : 172.172.32.125
Source Server Version : 50726
Source Host           : 172.172.32.125:3306
Source Database       : data_quality_monitor

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2021-03-12 17:38:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `schedule_job`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '方法名',
  `cron` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cron表达式',
  `job_status` int(1) DEFAULT NULL COMMENT '任务状态 0：正常 1：暂停 -1:删除',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `method_params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参数',
  `update_date` datetime DEFAULT NULL COMMENT '更改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'checkData', 'testAction', '0 */2 * * * ?', '0', null, '123456', null);
INSERT INTO `schedule_job` VALUES ('93aded3da7f2447b97db7960f20dc973', 'checkData', 'testAction', '0/5 * * * * ?', '0', '2021-03-12 13:09:42', 'F040', null);
