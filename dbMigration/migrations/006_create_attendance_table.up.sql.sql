CREATE TABLE IF NOT EXISTS attendance (
    id              BIGINT          AUTO_INCREMENT PRIMARY KEY,
    employee_id     BIGINT          NOT NULL COMMENT '員工ID',
    attendance_date DATE            NOT NULL DEFAULT (CURRENT_DATE) COMMENT '考勤日期',
    clock_in        DATETIME        NULL COMMENT '上班打卡時間',
    clock_out       DATETIME        NULL COMMENT '下班打卡時間',
    hours_worked    DECIMAL(5, 2)   GENERATED ALWAYS AS (
        CASE 
            WHEN clock_in IS NOT NULL AND clock_out IS NOT NULL 
            THEN TIMESTAMPDIFF(MINUTE, clock_in, clock_out) / 60 
            ELSE NULL 
        END
    ) STORED COMMENT '工作時數',
    status          TINYINT         NOT NULL DEFAULT 1 COMMENT '狀態: 1-正常 2-遲到 3-缺席 4-早退',
    notes           VARCHAR(500)    NULL COMMENT '備註',
    modify_user     VARCHAR(50)     NULL COMMENT '修改人',
    modify_time     TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改時間',
    create_user     VARCHAR(50)     NULL COMMENT '創建人',
    create_time     TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '創建時間',
    FOREIGN KEY fk_attendance_employee (employee_id) REFERENCES employees(id),
    INDEX idx_employee_date (employee_id, attendance_date),
    INDEX idx_date (attendance_date),
    INDEX idx_status (status),
    UNIQUE KEY uk_employee_date (employee_id, attendance_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='考勤記錄表';