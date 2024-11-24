CREATE TABLE IF NOT EXISTS expenses (
    id              BIGINT          AUTO_INCREMENT PRIMARY KEY,
    expense_type_id BIGINT          NOT NULL COMMENT '支出類型ID',
    amount          DECIMAL(10, 2)  NOT NULL COMMENT '金額',
    expense_date    DATE            DEFAULT (CURRENT_DATE) COMMENT '支出日期',
    description     VARCHAR(500)    NULL COMMENT '支出說明',
    invoice_no      VARCHAR(50)     NULL COMMENT '發票號碼',
    status          TINYINT         NOT NULL DEFAULT 1 COMMENT '狀態: 1-待審核 2-已審核 3-已拒絕',
    modify_user     VARCHAR(50)     NULL COMMENT '修改人',
    modify_time     TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
    create_user     VARCHAR(50)     NULL COMMENT '創建人',
    create_time     TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '創建時間',
    FOREIGN KEY fk_expense_type (expense_type_id) REFERENCES expense_type(id),
    INDEX idx_expense_type (expense_type_id),
    INDEX idx_expense_date (expense_date),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='支出記錄表';