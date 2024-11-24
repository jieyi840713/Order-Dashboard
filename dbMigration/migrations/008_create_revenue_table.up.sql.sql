CREATE TABLE IF NOT EXISTS revenue (
    id               BIGINT          AUTO_INCREMENT PRIMARY KEY,
    revenue_date     DATE            NOT NULL DEFAULT (CURRENT_DATE) COMMENT '營收日期',
    total_sales      DECIMAL(10, 2)  NOT NULL DEFAULT 0 COMMENT '總銷售額',
    total_expenses   DECIMAL(10, 2)  NOT NULL DEFAULT 0 COMMENT '總支出',
    net_profit       DECIMAL(10, 2)  GENERATED ALWAYS AS (total_sales - total_expenses) STORED COMMENT '淨利潤',
    cash_income      DECIMAL(10, 2)  NOT NULL DEFAULT 0 COMMENT '現金收入',
    card_income      DECIMAL(10, 2)  NOT NULL DEFAULT 0 COMMENT '刷卡收入',
    order_count      INT             NOT NULL DEFAULT 0 COMMENT '訂單數量',
    modify_user      VARCHAR(50)     NULL COMMENT '修改人',
    modify_time      TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
    create_user      VARCHAR(50)     NULL COMMENT '創建人',
    create_time      TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '創建時間',
    UNIQUE KEY uk_revenue_date (revenue_date),
    INDEX idx_date (revenue_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='營收表';