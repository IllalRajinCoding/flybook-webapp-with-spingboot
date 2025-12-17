-- Create users table with role (admin/user)
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'user',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT check_role CHECK (role IN ('admin', 'user'))
);

-- Create index for better query performance
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_role ON users(role);

-- Sample admin and user accounts
-- Password: admin123 (in real app, this should be hashed)
INSERT INTO users (name, email, password, role)
VALUES 
('Admin FlyBook', 'admin@flybook.com', 'admin123', 'admin'),
('John Doe', 'user@flybook.com', 'user123', 'user'),
('Jane Smith', 'jane@flybook.com', 'user123', 'user');

-- Note: In production, passwords should be hashed using BCrypt or similar
