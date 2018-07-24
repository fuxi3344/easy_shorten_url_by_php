SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dwz_url
-- ----------------------------
DROP TABLE IF EXISTS `dwz_url`;
CREATE TABLE `dwz_url`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `md5` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `build_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hash`(`md5`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
