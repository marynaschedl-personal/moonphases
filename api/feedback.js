import { sql } from '@vercel/postgres';

export default async function handler(req, res) {
  // Only allow POST requests
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  try {
    const { email, feedback, location } = req.body;

    // Validate required fields
    if (!feedback || feedback.trim().length === 0) {
      return res.status(400).json({ error: 'Feedback is required' });
    }

    // Insert feedback into database
    const result = await sql`
      INSERT INTO feedback (email, message, location, timestamp, user_ip)
      VALUES (
        ${email || null},
        ${feedback},
        ${location || 'Unknown'},
        NOW(),
        ${req.headers['x-forwarded-for']?.split(',')[0] || req.socket.remoteAddress || 'Unknown'}
      )
      RETURNING id, created_at;
    `;

    return res.status(200).json({
      success: true,
      message: 'Feedback received! Thank you for your input.',
      id: result.rows[0].id,
      timestamp: result.rows[0].created_at
    });

  } catch (error) {
    console.error('Feedback submission error:', error);
    return res.status(500).json({
      error: 'Failed to submit feedback',
      details: error.message
    });
  }
}
