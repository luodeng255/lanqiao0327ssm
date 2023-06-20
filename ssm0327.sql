/*
 Navicat Premium Data Transfer

 Source Server         : deng
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : ssm0327

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 20/06/2023 09:06:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '手机');
INSERT INTO `category` VALUES (2, '电视机');
INSERT INTO `category` VALUES (3, '空调');
INSERT INTO `category` VALUES (4, '洗衣机');
INSERT INTO `category` VALUES (5, '保护套');
INSERT INTO `category` VALUES (6, '保护膜');
INSERT INTO `category` VALUES (7, '充电器');
INSERT INTO `category` VALUES (8, '充电宝');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `price` double NOT NULL,
  `order_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_order_user_id`(`user_id`) USING BTREE,
  INDEX `FK_order_id`(`product_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 851177650230792192, 1, 33, 2, 49, '2023-05-22 08:37:12');
INSERT INTO `orders` VALUES (2, 851177650230792192, 1, 31, 2, 69, '2023-05-22 08:37:12');
INSERT INTO `orders` VALUES (3, 851177650230792194, 1, 28, 3, 49, '2023-05-22 08:37:12');
INSERT INTO `orders` VALUES (4, 851179575068200960, 1, 28, 3, 49, '2023-05-22 08:44:50');
INSERT INTO `orders` VALUES (5, 851179575068200960, 1, 19, 2, 39, '2023-05-22 08:44:50');
INSERT INTO `orders` VALUES (6, 851180359495323648, 1, 28, 3, 49, '2023-05-22 08:47:58');
INSERT INTO `orders` VALUES (7, 851180359495323648, 1, 19, 2, 39, '2023-05-22 08:47:58');
INSERT INTO `orders` VALUES (10, 854368038307368960, 1, 7, 1, 999, '2023-05-31 03:54:39');
INSERT INTO `orders` VALUES (11, 854368123078447104, 1, 2, 1, 2599, '2023-05-31 03:55:00');
INSERT INTO `orders` VALUES (12, 855443587389853696, 1, 31, 5, 69, '2023-06-03 03:08:30');
INSERT INTO `orders` VALUES (13, 855443587389853696, 1, 18, 1, 2999, '2023-06-03 03:08:30');
INSERT INTO `orders` VALUES (14, 856173895420612608, 1, 15, 1, 6999, '2023-06-04 03:30:58');
INSERT INTO `orders` VALUES (15, 856173906967531520, 1, 32, 1, 39, '2023-06-04 03:30:58');
INSERT INTO `orders` VALUES (16, 856173906967531520, 1, 28, 1, 49, '2023-06-04 03:30:58');
INSERT INTO `orders` VALUES (17, 856173986919354368, 1, 13, 1, 1799, '2023-06-04 03:30:58');
INSERT INTO `orders` VALUES (18, 856174005751779328, 1, 6, 1, 1199, '2023-06-04 03:30:58');
INSERT INTO `orders` VALUES (19, 856174017927843840, 1, 30, 1, 129, '2023-06-03 03:30:58');
INSERT INTO `orders` VALUES (20, 856174017927843840, 1, 13, 2, 1799, '2023-06-03 03:30:58');
INSERT INTO `orders` VALUES (21, 856174131304075264, 1, 3, 1, 2599, '2023-06-03 03:30:58');
INSERT INTO `orders` VALUES (22, 856174182726242304, 1, 5, 1, 699, '2023-06-03 03:30:58');
INSERT INTO `orders` VALUES (23, 856174220999266304, 1, 23, 1, 59, '2023-06-03 03:30:58');
INSERT INTO `orders` VALUES (24, 856174241127731200, 1, 22, 1, 19, '2023-06-03 03:30:58');
INSERT INTO `orders` VALUES (25, 856174260358615040, 1, 3, 1, 2599, '2023-06-02 03:30:58');
INSERT INTO `orders` VALUES (26, 856174260358615040, 1, 2, 1, 2599, '2023-06-02 03:30:58');
INSERT INTO `orders` VALUES (27, 856174260358615040, 1, 5, 1, 699, '2023-06-02 03:30:58');
INSERT INTO `orders` VALUES (28, 856174277332963328, 1, 34, 1, 49, '2023-06-02 03:30:58');
INSERT INTO `orders` VALUES (29, 856174277332963328, 1, 32, 1, 39, '2023-06-02 03:30:58');
INSERT INTO `orders` VALUES (30, 856174277332963328, 1, 30, 1, 129, '2023-06-02 03:30:58');
INSERT INTO `orders` VALUES (31, 856174277332963328, 1, 29, 1, 99, '2023-06-02 03:30:58');
INSERT INTO `orders` VALUES (32, 856174277332963328, 1, 27, 1, 69, '2023-06-02 03:30:58');
INSERT INTO `orders` VALUES (33, 856174277332963328, 1, 31, 1, 69, '2023-06-02 03:30:58');
INSERT INTO `orders` VALUES (34, 856174277332963328, 1, 20, 1, 39, '2023-06-02 03:30:58');
INSERT INTO `orders` VALUES (35, 856174277332963328, 1, 19, 1, 39, '2023-06-02 03:30:58');
INSERT INTO `orders` VALUES (36, 856174277332963328, 1, 22, 1, 19, '2023-06-02 03:30:58');
INSERT INTO `orders` VALUES (37, 856174324179144704, 1, 18, 1, 2999, '2023-06-02 03:30:58');
INSERT INTO `orders` VALUES (38, 856174352129986560, 1, 14, 1, 2799, '2023-06-02 03:30:58');
INSERT INTO `orders` VALUES (39, 856174376566001664, 1, 29, 1, 99, '2023-06-02 03:32:24');
INSERT INTO `orders` VALUES (40, 856174376566001664, 1, 17, 1, 1699, '2023-06-02 03:32:24');
INSERT INTO `orders` VALUES (41, 856174376566001664, 1, 18, 1, 2999, '2023-06-05 03:32:24');
INSERT INTO `orders` VALUES (42, 856174376566001664, 1, 14, 1, 2799, '2023-06-05 03:32:24');
INSERT INTO `orders` VALUES (43, 856174376566001664, 1, 6, 1, 1199, '2023-06-05 03:32:24');
INSERT INTO `orders` VALUES (44, 856174376566001664, 1, 3, 1, 2599, '2023-06-05 03:32:24');
INSERT INTO `orders` VALUES (45, 856174399496261632, 1, 9, 1, 799, '2023-06-05 03:32:29');
INSERT INTO `orders` VALUES (46, 856174416621604864, 1, 12, 1, 1299, '2023-06-05 03:32:34');
INSERT INTO `orders` VALUES (47, 856174454336786432, 1, 10, 1, 1899, '2023-06-05 03:32:42');
INSERT INTO `orders` VALUES (48, 856174467653701632, 1, 30, 1, 129, '2023-06-05 03:32:46');
INSERT INTO `orders` VALUES (49, 856174479880097792, 1, 14, 1, 2799, '2023-06-05 03:32:49');
INSERT INTO `orders` VALUES (50, 856174479880097792, 1, 9, 1, 799, '2023-06-05 03:32:49');
INSERT INTO `orders` VALUES (51, 856174479880097792, 1, 12, 1, 1299, '2023-06-05 03:32:49');
INSERT INTO `orders` VALUES (52, 856174479880097792, 1, 10, 1, 1899, '2023-06-05 03:32:49');
INSERT INTO `orders` VALUES (53, 856174486842642432, 1, 15, 1, 6999, '2023-06-08 03:32:50');
INSERT INTO `orders` VALUES (54, 856174486842642432, 1, 16, 1, 2599, '2023-06-08 03:32:50');
INSERT INTO `orders` VALUES (55, 856174486842642432, 1, 18, 1, 2999, '2023-06-08 03:32:50');
INSERT INTO `orders` VALUES (56, 856174486842642432, 1, 24, 1, 29, '2023-06-08 03:32:50');
INSERT INTO `orders` VALUES (57, 856174486842642432, 1, 25, 1, 129, '2023-06-08 03:32:50');
INSERT INTO `orders` VALUES (58, 856175478657126400, 1, 9, 30, 799, '2023-06-08 03:36:47');
INSERT INTO `orders` VALUES (64, 864506193941499904, 1, 34, 1, 49, '2023-06-09 03:20:04');
INSERT INTO `orders` VALUES (65, 864506217194721280, 1, 34, 1, 49, '2023-06-09 03:20:10');
INSERT INTO `orders` VALUES (66, 864506289437413376, 1, 33, 2, 49, '2023-06-09 03:20:27');
INSERT INTO `orders` VALUES (67, 864506289437413376, 1, 35, 2, 12.9, '2023-06-09 03:20:27');
INSERT INTO `orders` VALUES (68, 864506289437413376, 1, 28, 1, 49, '2023-06-09 03:20:27');
INSERT INTO `orders` VALUES (69, 865547657739898880, 1, 33, 1, 49, '2023-06-11 00:18:28');
INSERT INTO `orders` VALUES (70, 865547677436350464, 1, 27, 1, 69, '2023-06-11 00:18:33');
INSERT INTO `orders` VALUES (71, 865547690921037824, 1, 34, 1, 49, '2023-06-11 00:18:36');
INSERT INTO `orders` VALUES (72, 865547690921037824, 1, 30, 1, 129, '2023-06-11 00:18:36');
INSERT INTO `orders` VALUES (73, 865547690921037824, 1, 33, 1, 49, '2023-06-11 00:18:36');
INSERT INTO `orders` VALUES (74, 865547780750446592, 1, 14, 1, 2799, '2023-06-12 00:18:58');
INSERT INTO `orders` VALUES (75, 865547829379207168, 1, 5, 1, 699, '2023-06-12 00:19:09');
INSERT INTO `orders` VALUES (76, 865547855195148288, 1, 2, 1, 2599, '2023-06-12 00:19:15');
INSERT INTO `orders` VALUES (77, 865547885188616192, 1, 29, 4, 99, '2023-06-12 00:19:23');
INSERT INTO `orders` VALUES (78, 865547885188616192, 1, 31, 2, 69, '2023-06-12 00:19:23');
INSERT INTO `orders` VALUES (79, 865547885188616192, 1, 14, 2, 2799, '2023-06-12 00:19:23');
INSERT INTO `orders` VALUES (80, 865547885188616192, 1, 4, 2, 699, '2023-06-12 00:19:23');
INSERT INTO `orders` VALUES (81, 865908922303778816, 1, 34, 1, 49, '2023-06-13 00:14:01');
INSERT INTO `orders` VALUES (82, 865909020949614592, 1, 3, 1, 2599, '2023-06-13 00:14:24');
INSERT INTO `orders` VALUES (83, 865909044425134080, 1, 30, 2, 129, '2023-06-13 00:14:30');
INSERT INTO `orders` VALUES (84, 865909044425134080, 1, 28, 1, 49, '2023-06-13 00:14:30');
INSERT INTO `orders` VALUES (85, 865909044425134080, 1, 19, 1, 39, '2023-06-13 00:14:30');
INSERT INTO `orders` VALUES (86, 865909044425134080, 1, 3, 2, 2599, '2023-06-13 00:14:30');
INSERT INTO `orders` VALUES (87, 865932240377483264, 1, 32, 77, 39, '2023-06-13 01:46:40');
INSERT INTO `orders` VALUES (88, 865932648298713088, 1, 9, 55, 799, '2023-06-13 01:48:17');
INSERT INTO `orders` VALUES (89, 866280922926944256, 1, 33, 1, 49, '2023-06-14 00:52:12');
INSERT INTO `orders` VALUES (90, 866281249352847360, 1, 34, 1, 49, '2023-06-14 00:53:30');
INSERT INTO `orders` VALUES (91, 866281260643913728, 1, 34, 1, 49, '2023-06-14 00:53:33');
INSERT INTO `orders` VALUES (92, 866281378461913088, 1, 6, 31, 1199, '2023-06-14 00:54:01');
INSERT INTO `orders` VALUES (93, 866287006257385472, 2, 3, 21, 2599, '2023-06-14 01:16:23');
INSERT INTO `orders` VALUES (94, 866319675859013632, 1, 34, 1, 49, '2023-06-14 03:26:12');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_title` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `product_intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `product_picture` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `product_price` double NOT NULL,
  `product_selling_price` double NOT NULL,
  `product_num` int(11) NOT NULL,
  `product_sales` int(11) NOT NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `FK_product_category`(`category_id`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Redmi K30', 1, '120Hz流速屏，全速热爱', '120Hz高帧率流速屏/ 索尼6400万前后六摄 / 6.67\'小孔径全面屏 / 最高可选8GB+256GB大存储 / 高通骁龙730G处理器 / 3D四曲面玻璃机身 / 4500mAh+27W快充 / 多功能NFC', '/imgs/Redmi-k30.png', 2000, 1599, 10, 0);
INSERT INTO `product` VALUES (2, 'Redmi K30 5G', 1, '双模5G,120Hz流速屏', '双模5G / 三路并发 / 高通骁龙765G / 7nm 5G低功耗处理器 / 120Hz高帧率流速屏 / 6.67\'小孔径全面屏 / 索尼6400万前后六摄 / 最高可选8GB+256GB大存储 / 4500mAh+30W快充 / 3D四曲面玻璃机身 / 多功能NFC', '/imgs/Redmi-k30-5G.png', 2599, 2599, 10, 0);
INSERT INTO `product` VALUES (3, '小米CC9 Pro', 1, '1亿像素,五摄四闪', '1亿像素主摄 / 全场景五摄像头 / 四闪光灯 / 3200万自拍 / 10 倍混合光学变焦，50倍数字变焦 / 5260mAh ⼤电量 / 标配 30W疾速快充 / ⼩米⾸款超薄屏下指纹 / 德国莱茵低蓝光认证 / 多功能NFC / 红外万能遥控 / 1216超线性扬声器', '/imgs/Mi-CC9.png', 2799, 2599, 20, 0);
INSERT INTO `product` VALUES (4, 'Redmi 8', 1, '5000mAh超长续航', '5000mAh超长续航 / 高通骁龙439八核处理器 / 4GB+64GB', '/imgs/Redmi-8.png', 799, 699, 20, 0);
INSERT INTO `product` VALUES (5, 'Redmi 8A', 1, '5000mAh超长续航', '5000mAh超长续航 / 高通骁龙439八核处理器 / 4GB+64GB / 1200万AI后置相机', '/imgs/Redmi-8A.png', 599, 699, 20, 0);
INSERT INTO `product` VALUES (6, 'Redmi Note8 Pro', 1, '6400万全场景四摄', '6400万四摄小金刚拍照新旗舰超强解析力，超震撼', '/imgs/Redmi-Note8-pro.png', 1399, 1199, 20, 0);
INSERT INTO `product` VALUES (7, 'Redmi Note8', 1, '千元4800万四摄', '千元4800万四摄 | 高通骁龙665 | 小金刚品质保证', '/imgs/Redmi-Note8.png', 999, 999, 20, 0);
INSERT INTO `product` VALUES (8, 'Redmi 7A', 1, '小巧大电量 持久流畅', '小巧大电量，持久又流畅骁龙8核高性能处理器 | 4000mAh超长续航 | AI人脸解锁 | 整机防泼溅', '/imgs/Redmi-7A.png', 599, 539, 20, 0);
INSERT INTO `product` VALUES (9, '小米电视4A 32英寸', 2, '人工智能系统，高清液晶屏', '小米电视4A 32英寸 | 64位四核处理器 | 1GB+4GB大内存 | 人工智能系统', '/imgs/MiTv-4A-32.png', 799, 799, 10, 0);
INSERT INTO `product` VALUES (10, '小米全面屏电视E55A', 2, '全面屏设计，人工智能语音', '全面屏设计 | 内置小爱同学 | 4K + HDR | 杜比DTS | PatchWall | 海量内容 | 2GB + 8GB大存储 | 64位四核处理器', '/imgs/MiTv-E55A.png', 2099, 1899, 10, 0);
INSERT INTO `product` VALUES (11, '小米全面屏电视E65A', 2, '全面屏设计，人工智能语音', '人工智能语音系统 | 海量影视内容 | 4K 超高清屏 | 杜比音效 | 64位四核处理器 | 2GB + 8GB大存储', '/imgs/MiTv-E65A.png', 3999, 2799, 10, 0);
INSERT INTO `product` VALUES (12, '小米电视4X 43英寸', 2, 'FHD全高清屏，人工智能语音', '人工智能语音系统 | FHD全高清屏 | 64位四核处理器 | 海量片源 | 1GB+8GB大内存 | 钢琴烤漆', '/imgs/MiTv-4X-43.png', 1499, 1299, 10, 0);
INSERT INTO `product` VALUES (13, '小米电视4C 55英寸', 2, '4K HDR，人工智能系统', '人工智能 | 大内存 | 杜比音效 | 超窄边 | 4K HDR | 海量片源 | 纤薄机身| 钢琴烤漆', '/imgs/MiTv-4C-55.png', 1999, 1799, 10, 0);
INSERT INTO `product` VALUES (14, '小米电视4A 65英寸', 2, '4K HDR，人工智能系统', '人工智能 | 大内存 | 杜比音效 | 超窄边 | 4K HDR | 海量片源 | 纤薄机身| 钢琴烤漆', '/imgs/MiTv-4A-65.png', 2999, 2799, 10, 0);
INSERT INTO `product` VALUES (15, '小米壁画电视 65英寸', 2, '壁画外观，全面屏，远场语音', '纯平背板 | 通体13.9mm | 远场语音 | 4K+HDR | 杜比+DTS | 画框模式 | 内置小爱同学 | PatchWall | SoundBar+低音炮 | 四核处理器+大存储', '/imgs/MiTv-ArtTv-65.png', 6999, 6999, 10, 0);
INSERT INTO `product` VALUES (16, '米家互联网空调C1（一级能效）', 3, '变频节能省电，自清洁', '一级能效 | 1.5匹 | 全直流变频 | 高效制冷/热 | 静音设计 | 自清洁 | 全屋互联', '/imgs/AirCondition-V1C1.png', 2699, 2599, 20, 10);
INSERT INTO `product` VALUES (17, '米家空调', 3, '出众静音，快速制冷热', '大1匹 | 三级能效 | 静音 | 快速制冷热 | 广角送风 | 除湿功能 | 高密度过滤网 | 典雅外观', '/imgs/AirCondition-F3W1.png', 1799, 1699, 20, 8);
INSERT INTO `product` VALUES (18, '米家互联网洗烘一体机 Pro 10kg', 4, '智能洗烘，省心省力', '国标双A+级洗烘能力 / 22种洗烘模式 / 智能投放洗涤剂 / 支持小爱同学语音遥控 / 支持OTA在线智能升级 / 智能空气洗 / 除菌率达99.9%+', '/imgs/Washer-Pro-10.png', 2999, 2999, 20, 7);
INSERT INTO `product` VALUES (19, 'Redmi K20/ K20 Pro 怪力魔王保护壳', 5, '怪力魔王专属定制', '优选PC材料，强韧张力，经久耐用 / 精选开孔，全面贴合机身 / 手感轻薄细腻，舒适无负担 / 三款颜色可选，彰显个性，与众不同', '/imgs/protectingShell-RedMi-K20&pro.png', 39, 39, 20, 10);
INSERT INTO `product` VALUES (20, '小米9 ARE U OK保护壳', 5, '一个与众不同的保护壳', '彰显独特个性 / 轻薄无负担 / 优选PC材料 / 贴合机身 / 潮流五色', '/imgs/protectingShell-Mi-9.png', 49, 39, 20, 10);
INSERT INTO `product` VALUES (21, '小米CC9&小米CC9美图定制版 标准高透贴膜', 6, '高清透亮，耐磨性强', '耐磨性强，防护更出众 / 疏油疏水，有效抗水抗脏污 / 高清透亮，保留了原生屏幕的亮丽颜色和清晰度 / 操作灵敏，智能吸附 / 进口高端PET材质，裸机般手感', '/imgs/protectingMen-Mi-CC9.png', 19, 19, 20, 9);
INSERT INTO `product` VALUES (22, '小米CC9e 标准高透贴膜', 6, '高清透亮，耐磨性强', '耐磨性强，防护更出众 / 疏油疏水，有效抗水抗脏污 / 高清透亮，保留了原生屏幕的亮丽颜色和清晰度 / 操作灵敏，智能吸附 / 进口高端PET材质，裸机般手感', '/imgs/protectingMen-Mi-CC9e.png', 19, 19, 20, 9);
INSERT INTO `product` VALUES (23, '小米USB充电器30W快充版（1A1C）', 7, '多一种接口，多一种选择', '双口输出 / 30W 输出 / 可折叠插脚 / 小巧便携', '/imgs/charger-30w.png', 59, 59, 20, 8);
INSERT INTO `product` VALUES (24, '小米USB充电器快充版（18W）', 7, '安卓、苹果设备均可使用', '支持QC3.0设备充电 / 支持iOS设备充电/ 美观耐用', '/imgs/charger-18w.png', 29, 29, 20, 8);
INSERT INTO `product` VALUES (25, '小米USB充电器60W快充版（6口）', 7, '6口输出，USB-C输出接口', '6口输出 / USB-C输出接口 / 支持QC3.0快充协议 / 总输出功率60W', '/imgs/charger-60w.png', 129, 129, 20, 0);
INSERT INTO `product` VALUES (26, '小米USB充电器36W快充版（2口）', 7, '6多重安全保护，小巧便携', '双USB输出接口 / 支持QC3.0快充协议 / 多重安全保护 / 小巧便携', '/imgs/charger-36w.png', 59, 59, 20, 0);
INSERT INTO `product` VALUES (27, '小米车载充电器快充版', 7, '让爱车成为移动充电站', 'QC3.0 双口输出 / 智能温度控制 / 5重安全保护 / 兼容iOS&Android设备', '/imgs/charger-car.png', 69, 69, 20, 0);
INSERT INTO `product` VALUES (28, '小米车载充电器快充版(37W)', 7, '双口快充，车载充电更安全', '单口27W 快充 / 双口输出 / 多重安全保护', '/imgs/charger-car-37w.png', 49, 49, 20, 0);
INSERT INTO `product` VALUES (29, '小米二合一移动电源（充电器）', 7, '一个设备多种用途', '5000mAh充沛电量 / 多协议快充 / USB 口输出', '/imgs/charger-tio.png', 99, 99, 20, 0);
INSERT INTO `product` VALUES (30, '小米无线充电宝青春版10000mAh', 8, '能量满满，无线有线都能充', '10000mAh大容量 / 支持边充边放 / 有线无线都能充 / 双向快充', '/imgs/charger-10000mAh.png', 129, 129, 20, 8);
INSERT INTO `product` VALUES (31, '小米CC9 Pro/尊享版 撞色飘带保护壳', 5, '全面贴合，无感更舒适', '优选环保PC材质，强韧张力，全面贴合，无感更舒适', '/imgs/protectingShell-Mi-CC9Pro.png', 69, 69, 20, 0);
INSERT INTO `product` VALUES (32, 'Redmi K20系列 幻境之心保护壳', 5, '柔软坚韧,全面贴合', '优质环保材质，柔软坚韧 / 全面贴合，有效抵抗灰尘 / 鲜亮三种颜色可选，为爱机随时换装', '/imgs/protectingShell-RedMi-K20.png', 39, 39, 20, 0);
INSERT INTO `product` VALUES (33, '小米9 SE 街头风保护壳黑色', 5, '个性时尚,细节出众', '个性时尚 / 细节出众 / 纤薄轻巧 / 多彩时尚', '/imgs/protectingShell-Mi-9SE.png', 49, 49, 20, 0);
INSERT INTO `product` VALUES (34, '小米9 街头风保护壳 红色', 5, '个性时尚,细节出众', '时尚多彩 / 细节出众 / 纤薄轻巧 / 是腕带也是支架', '/imgs/protectingShell-Mi-9-red.png', 49, 49, 20, 0);
INSERT INTO `product` VALUES (35, '小米MIX 3 极简保护壳蓝色', 5, '时尚简约设计，手感细腻顺滑', '时尚简约设计，手感细腻顺滑 / 优质环保PC原材料，强韧张力，经久耐用 / 超薄 0.8MM厚度', '/imgs/protectingShell-Mix-3.png', 49, 12.9, 20, 0);

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_user_id`(`user_id`) USING BTREE,
  INDEX `FK_shoppingCart_id`(`product_id`) USING BTREE,
  CONSTRAINT `FK_shoppingCart_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES (20, 32, 35, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'deng', '123');
INSERT INTO `user` VALUES (2, 'deng2', '456');
INSERT INTO `user` VALUES (3, 'deng3', '222');
INSERT INTO `user` VALUES (22, 'deng1111', '21312');
INSERT INTO `user` VALUES (23, 'ahsfs', 'sdhfs');
INSERT INTO `user` VALUES (24, '服务器访问服务', 'werqe');
INSERT INTO `user` VALUES (25, 'deng1', '');
INSERT INTO `user` VALUES (26, 'dengooo', '465');
INSERT INTO `user` VALUES (27, '564456', '12313');
INSERT INTO `user` VALUES (28, 'dewdeq', 'werqw');
INSERT INTO `user` VALUES (29, '', '');
INSERT INTO `user` VALUES (30, '00', '00');
INSERT INTO `user` VALUES (31, 'qwqwqw', '121211');
INSERT INTO `user` VALUES (32, '88888', '123');

SET FOREIGN_KEY_CHECKS = 1;
