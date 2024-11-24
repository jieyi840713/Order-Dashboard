CREATE TABLE IF NOT EXISTS products (
    id            BIGINT          AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(100)    NOT NULL COMMENT '商品名稱',
    descript      VARCHAR(500)    NULL COMMENT '商品描述',
    price         DECIMAL(10, 2)  NOT NULL COMMENT '商品價格',
    category_id   BIGINT          NULL COMMENT '商品分類ID',
    is_available  TINYINT         NOT NULL DEFAULT 1 COMMENT '狀態: 0-下架 1-上架',
    image_url     VARCHAR(255)    NULL COMMENT '商品圖片',
    stock         INT            NOT NULL DEFAULT 0 COMMENT '庫存數量',
    sales_count   INT            NOT NULL DEFAULT 0 COMMENT '銷售數量',
    sort_order    INT            NOT NULL DEFAULT 0 COMMENT '排序權重',
    modify_user   VARCHAR(50)     NULL COMMENT '修改人',
    modify_time   TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
    create_user   VARCHAR(50)     NULL COMMENT '創建人',
    create_time   TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '創建時間',
    INDEX idx_category (category_id),
    INDEX idx_available (is_available),
    INDEX idx_sort (sort_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品表';