CREATE TABLE IF NOT EXISTS employees (
    id           BIGINT          AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(100)    NOT NULL COMMENT '姓名',
    nickname     VARCHAR(50)     NULL COMMENT '暱稱',         
    position     VARCHAR(50)     NULL COMMENT '職位',
    salary       DECIMAL(10, 2)  NULL COMMENT '月薪',
    hourly_wage  DECIMAL(10, 2)  NULL COMMENT '時薪',
    hire_date    DATE           NOT NULL DEFAULT (CURRENT_DATE) COMMENT '入職日期',
    status       TINYINT        NOT NULL DEFAULT 1 COMMENT '狀態: 1-在職 2-離職',
    modify_user  VARCHAR(50)     NULL COMMENT '修改人',
    modify_time  TIMESTAMP      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
    create_user  VARCHAR(50)     NULL COMMENT '創建人',
    create_time  TIMESTAMP      DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '創建時間',
    INDEX idx_name (name),
    INDEX idx_status (status),
    INDEX idx_hire_date (hire_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='員工表';