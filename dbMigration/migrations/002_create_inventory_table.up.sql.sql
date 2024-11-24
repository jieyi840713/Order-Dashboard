CREATE TABLE IF NOT EXISTS inventory (
    id              BIGINT PRIMARY KEY AUTO_INCREMENT,  -- 统一使用 BIGINT
    ingredient_id   BIGINT NOT NULL COMMENT '食材ID',   -- 修改为 BIGINT 以匹配 ingredients 表
    quantity        INT NOT NULL DEFAULT 0 COMMENT '數量',
    cost            DECIMAL(10, 2) NOT NULL COMMENT '成本',
    last_updated    TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最後更新時間',
    create_time     TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '創建時間',  -- 建议添加创建时间
    modify_user     VARCHAR(50) NULL COMMENT '修改人',    -- 建议添加修改人
    create_user     VARCHAR(50) NULL COMMENT '創建人',    -- 建议添加创建人
    FOREIGN KEY fk_inventory_ingredient (ingredient_id) REFERENCES ingredients(id),
    INDEX idx_ingredient_id (ingredient_id)  -- 添加索引以提升查询性能
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='庫存表';