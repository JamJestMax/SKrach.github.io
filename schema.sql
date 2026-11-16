CREATE TABLE IF NOT EXISTS skrach_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(32) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS skrach_projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    share_code VARCHAR(12) NOT NULL UNIQUE,
    user_id INT NOT NULL,
    title VARCHAR(80) NOT NULL DEFAULT 'Bez nazwy',
    project_json MEDIUMTEXT NOT NULL,
    skript_code MEDIUMTEXT NOT NULL,
    is_public TINYINT(1) NOT NULL DEFAULT 1,
    views INT NOT NULL DEFAULT 0,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES skrach_users(id) ON DELETE CASCADE,
    INDEX idx_share_code (share_code),
    INDEX idx_user_id (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
