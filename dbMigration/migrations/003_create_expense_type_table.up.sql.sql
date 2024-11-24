CREATE TABLE IF NOT EXISTS expense_type (
    id           BIGINT          AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(50)     NOT NULL COMMENT '支出種類',
    descript     VARCHAR(255)    NULL COMMENT '種類描述',            -- 扩大描述字段长度，以便存储更详细的描述
    modify_user  VARCHAR(50)     NULL COMMENT '修改人',
    modify_time  TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',  -- 添加自动更新
    create_user  VARCHAR(50)     NULL COMMENT '創建人',
    create_time  TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '創建時間',
    UNIQUE KEY uk_expense_type_name (name)    -- 添加唯一索引，防止重复的支出类型
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='支出類型表';