# Talkify - Complete Deployment Guide

This guide will walk you through deploying both the frontend and backend of Talkify.

## 📋 Prerequisites

1. **GitHub Account**: [Create one here](https://github.com/join)
2. **Vercel Account**: [Sign up with GitHub](https://vercel.com/signup)
3. **Render Account**: [Sign up with GitHub](https://render.com/register)
4. **Firebase Project**: Already set up (check FIREBASE_SETUP_GUIDE.md)

---

## 🚀 Part 1: Push Code to GitHub

### Step 1: Create GitHub Repository

1. Go to [GitHub](https://github.com) and click the "+" icon → "New repository"
2. Repository name: `talkify-video-chat`
3. Description: " "
4. Choose: **Public** or **Private**
5. **DO NOT** initialize with README, .gitignore, or license
6. Click "Create repository"

### Step 2: Push Your Code

The git repository has already been initialized. Now run these commands:

```bash
# Navigate to project directory
cd /Users/ashvin/Desktop/talkify

# Add all files to git
git add .

# Create initial commit
git commit -m "Initial commit: Talkify video chat app with purple/blue theme"

# Add your GitHub repository as remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/talkify-video-chat.git

# Push to GitHub
git branch -M main
git push -u origin main
```

**Important**: Replace `YOUR_USERNAME` with your actual GitHub username!

---

## 🎨 Part 2: Deploy Frontend (Vercel)

### Why Vercel?
- Perfect for React/Vite apps
- Automatic HTTPS
- Fast global CDN
- Free tier available
- Auto-deploys on git push

### Deployment Steps:

1. **Go to [Vercel](https://vercel.com)**
2. Click "Add New" → "Project"
3. Import your `talkify-video-chat` repository
4. Configure build settings:
   - **Framework Preset**: Vite
   - **Root Directory**: `frontend`
   - **Build Command**: `npm run build`
   - **Output Directory**: `dist`

5. **Add Environment Variables**:
   Click "Environment Variables" and add:
   ```
   VITE_FIREBASE_API_KEY=your_firebase_api_key
   VITE_FIREBASE_AUTH_DOMAIN=your_firebase_auth_domain
   VITE_FIREBASE_PROJECT_ID=your_firebase_project_id
   VITE_FIREBASE_STORAGE_BUCKET=your_firebase_storage_bucket
   VITE_FIREBASE_MESSAGING_SENDER_ID=your_firebase_messaging_sender_id
   VITE_FIREBASE_APP_ID=your_firebase_app_id
   VITE_SERVER_URL=https://your-backend-url.onrender.com
   ```
   
   Get Firebase values from: `frontend/src/firebase.js`

6. Click **"Deploy"**
7. Wait 2-3 minutes for deployment
8. You'll get a URL like: `https://talkify-video-chat.vercel.app`

---

## 🔧 Part 3: Deploy Backend (Render)

### Why Render?
- Free tier for Node.js apps
- Supports WebSockets (Socket.IO)
- Auto-deploys on git push
- Free SSL certificates

### Deployment Steps:

1. **Go to [Render](https://render.com)**
2. Click "New" → "Web Service"
3. Connect your `talkify-video-chat` repository
4. Configure settings:
   - **Name**: `talkify-backend`
   - **Root Directory**: `backend`
   - **Environment**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `node app.js`
   - **Instance Type**: `Free`

5. **Add Environment Variables**:
   Click "Environment" and add:
   ```
   NODE_ENV=production
   PORT=10000
   FIREBASE_PROJECT_ID=your_firebase_project_id
   FIREBASE_CLIENT_EMAIL=your_firebase_client_email
   FIREBASE_PRIVATE_KEY=your_firebase_private_key
   ```
   
   Get Firebase Admin values from your Firebase project settings

6. Click **"Create Web Service"**
7. Wait 5-10 minutes for deployment
8. You'll get a URL like: `https://talkify-backend.onrender.com`

### Important Backend Note:
Render's free tier may "spin down" after inactivity. The first request after inactivity may take 30-60 seconds to respond while the server starts up.

---

## 🔗 Part 4: Connect Frontend to Backend

### Update Frontend Environment

1. Go back to **Vercel Dashboard**
2. Select your `talkify-video-chat` project
3. Go to **Settings** → **Environment Variables**
4. Update `VITE_SERVER_URL` with your Render backend URL:
   ```
   VITE_SERVER_URL=https://talkify-backend.onrender.com
   ```
5. Click **"Save"**
6. Go to **Deployments** → Click "..." → **"Redeploy"**

### Update Backend CORS (if needed)

If you get CORS errors, update `backend/app.js`:

```javascript
const cors = require('cors');

app.use(cors({
  origin: [
    'https://talkify-video-chat.vercel.app',
    'http://localhost:5173'
  ],
  credentials: true
}));
```

Then push changes:
```bash
git add backend/app.js
git commit -m "Update CORS for production"
git push
```

---

## 🧪 Part 5: Test Your Deployment

1. **Open your Vercel URL**: `https://talkify-video-chat.vercel.app`
2. **Test Authentication**: Sign up/login with Google or Email
3. **Test Video Meeting**:
   - Create a new meeting
   - Copy the meeting link
   - Open in another browser/incognito window
   - Join the meeting
   - Test video, audio, screen share, chat

4. **Test Features**:
   - ✅ Video/Audio controls
   - ✅ Screen sharing
   - ✅ Chat messages
   - ✅ Participants list
   - ✅ Emoji reactions
   - ✅ Hand raise
   - ✅ Confetti celebration 🎉
   - ✅ Picture-in-Picture 📺
   - ✅ Recording indicator
   - ✅ Meeting history

---

## 🐛 Troubleshooting

### Frontend Issues

**Problem**: White screen / App not loading
- Check browser console for errors
- Verify Firebase config in Vercel environment variables
- Check VITE_SERVER_URL is correct

**Problem**: Can't connect to backend
- Verify backend is running (visit backend URL directly)
- Check CORS settings
- Check browser console for connection errors

### Backend Issues

**Problem**: Backend not responding
- Check Render logs: Dashboard → Service → Logs
- Verify environment variables are set
- Check if service is "Suspended" (free tier limitation)

**Problem**: Socket.IO not connecting
- Verify WebSocket support is enabled
- Check firewall/network settings
- Try clearing browser cache

### Video/Audio Issues

**Problem**: Camera/Microphone not working
- Grant browser permissions
- Check device settings
- Try a different browser (Chrome/Edge recommended)

**Problem**: Can't see other participants
- Check firewall settings
- Verify STUN/TURN servers are accessible
- Try on different network

---

## 🔄 Future Updates

To deploy updates after making changes:

```bash
# 1. Make your changes
# 2. Commit changes
git add .
git commit -m "Description of changes"

# 3. Push to GitHub
git push

# 4. Vercel and Render will auto-deploy! ✨
```

---

## 📊 Monitoring & Analytics

### Vercel Analytics (Optional)
1. Go to Vercel Dashboard → Your Project
2. Click "Analytics" tab
3. Enable Vercel Analytics (free tier available)

### Render Metrics
1. Go to Render Dashboard → Your Service
2. View CPU, Memory, and Request metrics

---

## 💰 Cost Breakdown

### Free Tier Limits:
- **Vercel**: 100GB bandwidth, unlimited deployments
- **Render**: 750 hours/month (1 service running 24/7)
- **Firebase**: 50K/day reads, 20K/day writes, 10GB storage

### Upgrade If Needed:
- **Vercel Pro**: $20/month (better performance, analytics)
- **Render Starter**: $7/month (always on, no cold starts)
- **Firebase Blaze**: Pay-as-you-go (better for scaling)

---

## 🌐 Custom Domain (Optional)

### Add Custom Domain to Vercel:
1. Buy domain (Namecheap, GoDaddy, etc.)
2. Vercel Dashboard → Your Project → Settings → Domains
3. Add your domain: `talkify.yourdomain.com`
4. Update DNS records as instructed by Vercel
5. Wait 24-48 hours for DNS propagation

---

## 🎉 You're Done!

Your Talkify app is now:
- ✅ Live on the internet
- ✅ Accessible worldwide
- ✅ Auto-deploying on git push
- ✅ Secured with HTTPS
- ✅ Using Firebase authentication
- ✅ Supporting real-time video/audio

Share your app link with friends and enjoy! 🚀

---

## 📞 Support

If you encounter issues:
1. Check Vercel logs: Dashboard → Deployments → View Function Logs
2. Check Render logs: Dashboard → Service → Logs
3. Check browser console (F12)
4. Review Firebase console for auth errors

---

**Built with ❤️ using React, Node.js, Socket.IO, WebRTC, and Firebase**
