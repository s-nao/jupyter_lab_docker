-- データベースを作成
CREATE DATABASE IF NOT EXISTS jupyter_local DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE DATABASE IF NOT EXISTS world DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- データベースアクセスユーザーの作成
CREATE USER 'username'@'%' IDENTIFIED BY 'password';

-- データベースアクセスユーザーの権限を設定
GRANT ALL PRIVILEGES ON jupyter_local.* TO 'username'@'%';
GRANT ALL PRIVILEGES ON world.* TO 'username'@'%';

-- 権限を反映
FLUSH PRIVILEGES;