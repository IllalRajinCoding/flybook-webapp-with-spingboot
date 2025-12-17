-- Reset and insert admin user
-- Run this if you can't login with admin credentials

-- Delete existing admin if any
DELETE FROM users WHERE email = 'admin@flybook.com';

-- Insert admin user
INSERT INTO users (name, email, password, role)
VALUES ('Admin FlyBook', 'admin@flybook.com', 'admin123', 'admin');

-- Verify admin user
SELECT id, name, email, role FROM users WHERE email = 'admin@flybook.com';

-- Show all users
SELECT id, name, email, role FROM users;
