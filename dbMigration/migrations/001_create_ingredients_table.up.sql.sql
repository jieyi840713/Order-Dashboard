CREATE TABLE IF NOT EXISTS ingredients (
    id           BIGINT          AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(50)     NOT NULL COMMENT '名稱',
    descript     VARCHAR(255)    NULL COMMENT '材料描述',  -- 建议扩大描述字段长度
    modify_user  VARCHAR(50)     NULL,
    modify_time  TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間', -- 添加自动更新
    create_user  VARCHAR(50)     NULL,
    create_time  TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '創建時間',
    UNIQUE KEY uk_ingredient_name (name)  -- 明确命名唯一索引
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='食材表';