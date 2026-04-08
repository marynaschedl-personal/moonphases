-- Moonphase Tracker Feedback Table Schema
-- Run this in your Neon database to create the feedback table

CREATE TABLE IF NOT EXISTS feedback (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255),
  message TEXT NOT NULL,
  location VARCHAR(255),
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  user_ip VARCHAR(45),
  is_read BOOLEAN DEFAULT FALSE,
  created_at_formatted VARCHAR(100)
);

-- Create index on timestamp for faster queries
CREATE INDEX IF NOT EXISTS idx_feedback_timestamp ON feedback(timestamp DESC);

-- Create index on email for searching user feedback
CREATE INDEX IF NOT EXISTS idx_feedback_email ON feedback(email);

-- Add comment to table
COMMENT ON TABLE feedback IS 'Feedback from Moonphase Tracker users';
COMMENT ON COLUMN feedback.email IS 'User email (optional)';
COMMENT ON COLUMN feedback.message IS 'Feedback message content';
COMMENT ON COLUMN feedback.location IS 'User location when submitting feedback';
COMMENT ON COLUMN feedback.timestamp IS 'When feedback was submitted';
COMMENT ON COLUMN feedback.user_ip IS 'User IP address for spam detection';
COMMENT ON COLUMN feedback.is_read IS 'Whether admin has read this feedback';
