CREATE TABLE IF NOT EXISTS order_items (
    id              BIGINT          AUTO_INCREMENT PRIMARY KEY,
    order_id        BIGINT          NOT NULL COMMENT '訂單ID',
    product_id      BIGINT          NOT NULL COMMENT '商品ID',
    quantity        INT             NOT NULL DEFAULT 1 COMMENT '數量',
    item_price      DECIMAL(10, 2)  NOT NULL COMMENT '商品單價',
    subtotal        DECIMAL(10, 2)  GENERATED ALWAYS AS (quantity * item_price) STORED COMMENT '小計',
    notes           VARCHAR(255)    NULL COMMENT '備註',
    modify_user     VARCHAR(50)     NULL COMMENT '修改人',
    modify_time     TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
    create_user     VARCHAR(50)     NULL COMMENT '創建人',
    create_time     TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '創建時間',
    FOREIGN KEY fk_orderitem_order (order_id) REFERENCES orders(id),
    FOREIGN KEY fk_orderitem_product (product_id) REFERENCES products(id),
    INDEX idx_order (order_id),
    INDEX idx_product (product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='訂單明細表';