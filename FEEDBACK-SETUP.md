# Feedback System Setup Guide

This guide explains how to set up the feedback submission system for Moonphase Tracker with Neon database integration.

## What's New

The feedback system now:
- ✅ Sends feedback to a Vercel API endpoint (`/api/feedback`)
- ✅ Stores feedback in your Neon PostgreSQL database
- ✅ Includes user email (optional), message, location, timestamp, and IP address
- ✅ No longer uses localStorage (feedback is persistent)

## Files Added

1. **`/api/feedback.js`** - Serverless API endpoint
2. **`/api/schema.sql`** - Database table schema
3. **`index.html`** (updated) - Frontend now sends to API

## Setup Steps

### Step 1: Create the Feedback Table in Neon

1. Open your Neon console
2. Go to your `neondb` database
3. Open the SQL Editor
4. Copy the contents of `/api/schema.sql`
5. Run the SQL to create the `feedback` table

```sql
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

CREATE INDEX IF NOT EXISTS idx_feedback_timestamp ON feedback(timestamp DESC);
CREATE INDEX IF NOT EXISTS idx_feedback_email ON feedback(email);
```

### Step 2: Install Dependencies

If you don't already have `@vercel/postgres`, install it:

```bash
npm install @vercel/postgres
```

### Step 3: Verify Environment Variables

Make sure your `POSTGRES_URL` environment variable is set in Vercel:

1. Go to Vercel Dashboard
2. Select your moonphase project
3. Go to **Settings → Environment Variables**
4. Verify `POSTGRES_URL` is set (you provided this earlier)

The API will use this to connect to your Neon database.

### Step 4: Deploy to Vercel

1. Commit the changes:
```bash
git add .
git commit -m "Add feedback system with Neon database integration"
```

2. Push to GitHub:
```bash
git push origin main
```

3. Vercel will automatically deploy the changes

### Step 5: Test

1. Visit your deployed Moonphase Tracker
2. Click the feedback bubble (💬) in bottom-right
3. Enter some test feedback
4. Submit
5. Check your Neon database to confirm the feedback was saved

## API Endpoint

**POST `/api/feedback`**

**Request body:**
```json
{
  "email": "user@example.com",
  "feedback": "Great moon tracker!",
  "location": "Munich, Germany"
}
```

**Response (success):**
```json
{
  "success": true,
  "message": "Feedback received! Thank you for your input.",
  "id": 1,
  "timestamp": "2026-04-08T12:34:56.789Z"
}
```

**Response (error):**
```json
{
  "error": "Feedback is required"
}
```

## Database Schema

| Column | Type | Notes |
|--------|------|-------|
| id | SERIAL PRIMARY KEY | Auto-increment ID |
| email | VARCHAR(255) | Optional user email |
| message | TEXT | Required feedback message |
| location | VARCHAR(255) | User's location from app |
| timestamp | TIMESTAMP | When feedback was submitted |
| created_at | TIMESTAMP | Duplicate of timestamp for clarity |
| user_ip | VARCHAR(45) | User IP (for spam detection) |
| is_read | BOOLEAN | Admin flag (default: false) |

## Querying Feedback

To view all feedback in your Neon database:

```sql
-- Get all feedback
SELECT * FROM feedback ORDER BY timestamp DESC;

-- Get feedback from last 7 days
SELECT * FROM feedback 
WHERE timestamp >= NOW() - INTERVAL '7 days'
ORDER BY timestamp DESC;

-- Get feedback with email
SELECT email, message, location, timestamp FROM feedback 
WHERE email IS NOT NULL
ORDER BY timestamp DESC;

-- Count feedback by location
SELECT location, COUNT(*) as count 
FROM feedback 
GROUP BY location 
ORDER BY count DESC;

-- Mark feedback as read
UPDATE feedback SET is_read = true WHERE id = 1;
```

## Security Notes

1. **CORS**: The API accepts POST requests from your domain automatically
2. **Validation**: Empty feedback is rejected
3. **IP Logging**: User IP is logged for spam detection
4. **SSL**: All connections to Neon use SSL encryption
5. **Email**: Optional and unvalidated (user can enter anything)

## Troubleshooting

### "Failed to submit feedback"
- Check browser console for error messages
- Verify `POSTGRES_URL` is set in Vercel Environment Variables
- Confirm the `feedback` table exists in Neon
- Check Vercel Function logs for detailed errors

### "Method not allowed"
- Only POST requests are allowed to `/api/feedback`
- The frontend correctly sends POST

### "Feedback table does not exist"
- Run the SQL schema from `/api/schema.sql` in Neon
- Verify you're running it in the correct database (`neondb`)

### API works but feedback not appearing in database
- Verify the `POSTGRES_URL` is for the correct database
- Check that the `feedback` table was created successfully
- Look at Vercel Function logs for SQL errors

## Next Steps

Optional enhancements:

1. **Create admin dashboard** - View and manage feedback
2. **Email notifications** - Get notified when new feedback arrives
3. **Spam filtering** - Block repeated submissions from same IP
4. **Feedback analytics** - Track feedback by location, date, etc.
5. **Rate limiting** - Limit submissions per IP address

## Support

If you need help:
1. Check Vercel Function logs (Vercel Dashboard → Functions)
2. Check Neon database logs
3. Review browser console for errors
4. Test the API endpoint directly with curl/Postman

---

**Last Updated**: April 8, 2026
**Status**: Ready for Production
