/*
Navicat MySQL Data Transfer

Source Server         : 172.172.32.125
Source Server Version : 50726
Source Host           : 172.172.32.125:3306
Source Database       : data_quality_monitor

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2021-03-12 17:37:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `schedule_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务日志id',
  `job_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '方法名',
  `result` tinyint(4) NOT NULL COMMENT '任务状态 0：成功 1：失败',
  `error` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `method_params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('00f5a60dda9642a68aa6b67541ab01f8', '1', 'checkData', 'testAction', '0', null, '27', '2021-03-12 11:40:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('0105bc8f06354b25918190646b9e261b', '93aded3da7f2447b97db7960f20dc973', 'checkData', 'testAction', '0', null, '1', '2021-03-12 13:09:45', 'F040');
INSERT INTO `schedule_job_log` VALUES ('04751628ee8f4d299847436ea93e4439', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 11:48:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('047c401c7354428ea7cece2eda428e69', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:02:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('06d1e65e-fb50-48be-8858-0ce09f70b878', '1', 'checkData', 'testAction', '0', null, '1', null, '123456');
INSERT INTO `schedule_job_log` VALUES ('07b410d9e5e34173817a381786f3c726', '1', 'checkData', 'testAction', '0', null, '24523', '2021-03-12 13:30:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('0bcf6c60031345afa613eabef18ae48e', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:54:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('0c3d6e8c-4125-41d7-be70-e05f632f6804', '1', 'checkData', 'testAction', '0', null, '1', null, '123456');
INSERT INTO `schedule_job_log` VALUES ('12ae76510d074a91a86a32cadf8af846', '1', 'checkData', 'testAction', '0', null, '10', '2021-03-12 12:34:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('1568c629b9cd4452a60fdcf7cef7750f', '1', 'checkData', 'testAction', '0', null, '0', '2021-03-12 11:44:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('1847f5f2f9b64d4d940f142744f1f7a0', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:38:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('1a014e2eabc946f7b4772c7e80bcfdf6', '93aded3da7f2447b97db7960f20dc973', 'checkData', 'testAction', '0', null, '1', '2021-03-12 13:09:50', 'F040');
INSERT INTO `schedule_job_log` VALUES ('1e82817f388147bebf85381a1d66d5e9', '1', 'checkData', 'testAction', '0', null, '12710', '2021-03-12 13:32:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('20f59e1924bf43c6a1268cd0bf7f0189', '1', 'checkData', 'testAction', '0', null, '49', '2021-03-11 15:20:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('21fe7bae82d5415388098b66e52b3b86', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:12:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('225f5dae96c941f4b29b4fbe6b0cd998', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 11:24:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('23ccadbf01884a558d5730b98dc1f726', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 11:34:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('2738ac5cb08a4f109c1b850df5ce06ff', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:58:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('298f4ea2-7c13-4293-8175-96936d32ee42', '1', 'checkData', 'testAction', '0', null, '16', null, '123456');
INSERT INTO `schedule_job_log` VALUES ('2b8d8e8057244a82b0b936a8ba419c29', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:26:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('2c3bbbc93a1947bca94e0c7d794fab78', '1', 'checkData', 'testAction', '0', null, '54596', '2021-03-12 13:26:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('31804481-613a-4acd-92a4-14b24f27b442', '1', 'checkData', 'testAction', '0', null, '2', null, '123456');
INSERT INTO `schedule_job_log` VALUES ('31bf5825c8d9444295d9d3148d4193b5', '1', 'checkData', 'testAction', '0', null, '2', '2021-03-12 11:46:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('3ca9d934c1414da996bed4c3b3ba5f18', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 11:38:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('3ea8e993-f47d-4ba9-98e7-9b3808b92b52', '1', 'checkData', 'testAction', '0', null, '1', null, '123456');
INSERT INTO `schedule_job_log` VALUES ('3fbc315af510454f9972a91b353969a4', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:16:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('411ec762b8424c7396b4def160bf4384', '1', 'checkData', 'testAction', '0', null, '72599', '2021-03-12 13:28:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('4b819f3d5cc64bd39bca53c7adae0ca8', '1', 'checkData', 'testAction', '0', null, '4', '2021-03-11 15:14:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('4c3f6aa8e62a47ecb786ba0b8098f486', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:20:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('4eddac3592704a8db86b2a35c5b80f00', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 13:04:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('53330ea565964cb089673f03e7181681', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:14:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('556962bff5b34018ab2498f4ce02e2d4', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 11:42:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('5612342c7f754ef69c31119a12b3dbc4', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:46:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('5812f33a-841c-4701-a504-1be7a58cf501', '1', 'checkData', 'testAction', '0', null, '0', null, '123456');
INSERT INTO `schedule_job_log` VALUES ('59f5176857e24d91b247ec477d7638bd', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:44:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('604648327f234332bd2bd683c62bd63c', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:04:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('60cc8d4a05e44126bfa20ae36aa27925', '93aded3da7f2447b97db7960f20dc973', 'checkData', 'testAction', '0', null, '1', '2021-03-12 13:10:00', 'F040');
INSERT INTO `schedule_job_log` VALUES ('67aed606-af57-403b-91c6-a37367e2994e', '1', 'checkData', 'testAction', '0', null, '1', null, '123456');
INSERT INTO `schedule_job_log` VALUES ('6808878d4e2a42c2bf1c07d4a3fe1e5d', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 13:06:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('682b98c90a534f7cbf70d6df78dc728b', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:32:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('6c64151133524233b610f7381e691d68', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 11:54:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('74597cb69bb04cb99c0dab3ed7095beb', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 11:36:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('769dfd84354e4a89be653d5c9b28b7a0', '1', 'checkData', 'testAction', '0', null, '2', '2021-03-11 15:18:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('8a02764317f94044a89dcf789c6dabe6', '1', 'checkData', 'testAction', '0', null, '8862', '2021-03-12 13:34:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('8b8d5736887146a298906fadfdfa3a2a', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:40:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('8c3cfaa2-bec1-48f5-a913-fc52279dbc72', '1', 'checkData', 'testAction', '0', null, '1', null, '123456');
INSERT INTO `schedule_job_log` VALUES ('8ca3245f924a483fb79ab930ac575d28', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:52:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('8d694721f3c2409eacb6754e5774a5ea', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 11:56:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('91634f99-aca6-48de-a8f4-578205895736', '1', 'checkData', 'testAction', '0', null, '19', null, '123456');
INSERT INTO `schedule_job_log` VALUES ('9ef598ff15064f16acc5e4c0c5a531ca', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 11:50:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('a026805ba4f34895b508fae4aead4f15', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 11:26:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('a092128ab6c044ee88748a9ae627d875', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:22:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('a45ee18e324a4bf5ace8db6d057f9bc4', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 11:52:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('a774eca5d8f047e9adb3c7f82909252c', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:28:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('ab16cfb9ae04454894d58dacf94f0aea', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:08:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('b047fdba4ff74a40ab4138fdf5da73b1', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:30:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('b4d4f829802d41a38c1c58b471ead06a', '1', 'checkData', 'testAction', '0', null, '2', '2021-03-11 15:16:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('b7d6997ed0164bcbb953c0b607ed0735', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 11:20:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('ba5cf8b1a1a544359bb79162b1738f57', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:10:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('bd0673f5f1be4bdb8aceb659c2f773db', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:06:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('be733efe5b99435f82be863935539d6d', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:48:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('c2addee125e24fc385f402f228ddce6c', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:24:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('c58a9e3337924c83b8eac1ea4da51234', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 11:28:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('c80cb819-19ec-4862-ab1e-551be2b85dba', '1', 'checkData', 'testAction', '0', null, '2', null, '123456');
INSERT INTO `schedule_job_log` VALUES ('c9011af33db845f4aa8c86692c87af8a', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 13:02:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('cc70e14b796d411789a31f3610f963e9', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 11:32:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('d0d9745304dd48c4bac7a099be4cb55f', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:36:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('d8d74572a01447eabf53030290908dcd', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 11:30:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('da01eea5189941769dd2b980ae78d7df', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:00:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('dca767b85e6a4745ac9349451c2c3b2f', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 13:08:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('e3b9222acaac45289ba2b712cd31ff5d', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 11:18:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('e47056f8b4844b9ba469e3f753d385cf', '1', 'checkData', 'testAction', '0', null, '2', '2021-03-12 13:10:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('e913153981ee435593b722df97b960ca', '1', 'checkData', 'testAction', '0', null, '10', '2021-03-12 12:56:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('eb436f0ca9d94508afb160753dd2ae63', '1', 'checkData', 'testAction', '0', null, '0', '2021-03-12 11:58:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('ee50b800a1df4e53ba23f2d5ea7d755c', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:18:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('eea40641-ee52-4b5e-b3e5-88cbdea6fbf1', '1', 'checkData', 'testAction', '0', null, '5', null, '123456');
INSERT INTO `schedule_job_log` VALUES ('ef9743c0965144e0bdde5d310149c7af', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:42:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('f07421a38d6e4e469dde1fb1b3cf380e', '93aded3da7f2447b97db7960f20dc973', 'checkData', 'testAction', '0', null, '1', '2021-03-12 13:09:55', 'F040');
INSERT INTO `schedule_job_log` VALUES ('f253d087513b404b859d46dd6062823e', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 12:50:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('f4b21bad0af44afa959b93c2a128bfe7', '1', 'checkData', 'testAction', '0', null, '4', '2021-03-12 11:16:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('f92d86e3c2664d9098cc23e11ea4217c', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 13:00:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('f987732194914b5a99b155335b8bf76e', '1', 'checkData', 'testAction', '0', null, '1', '2021-03-12 11:22:00', '123456');
INSERT INTO `schedule_job_log` VALUES ('fbf4aacbfd244bdd815c49b01d5c87f1', '1', 'checkData', 'testAction', '0', null, '4', '2021-03-12 13:24:00', '123456');
