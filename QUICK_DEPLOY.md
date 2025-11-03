# 🚀 Quick Start Deployment Guide

Follow these steps to deploy Talkify in under 30 minutes!

## ✅ Prerequisites Checklist

- [ ] GitHub account created
- [ ] Vercel account created (sign up with GitHub)
- [ ] Render account created (sign up with GitHub)
- [ ] Firebase project set up (check FIREBASE_SETUP_GUIDE.md)
- [ ] Firebase Admin SDK key downloaded

---

## 📝 Step-by-Step Instructions

### STEP 1: Push to GitHub (5 minutes)

1. **Create GitHub Repository**
   - Go to: https://github.com/new
   - Name: `talkify-video-chat`
   - Keep it **Public** (or Private if you prefer)
   - Do NOT add README, .gitignore, or license
   - Click "Create repository"

2. **Run Deployment Script**
   ```bash
   cd /Users/ashvin/Desktop/talkify
   ./deploy.sh
   ```
   - Enter your GitHub username when prompted
   - Confirm push when ready

3. **Verify on GitHub**
   - Visit: `https://github.com/YOUR_USERNAME/talkify-video-chat`
   - All files should be visible

---

### STEP 2: Deploy Backend to Render (10 minutes)

1. **Go to Render**
   - Visit: https://render.com/
   - Click "Get Started" or "Dashboard"

2. **Create Web Service**
   - Click "New +" → "Web Service"
   - Connect your GitHub account if not already
   - Select `talkify-video-chat` repository
   - Click "Connect"

3. **Configure Service**
   ```
   Name: talkify-backend
   Region: Choose closest to you (e.g., Oregon, Frankfurt)
   Branch: main
   Root Directory: backend
   Runtime: Node
   Build Command: npm install
   Start Command: node app.js
   Instance Type: Free
   ```

4. **Add Environment Variables**
   
   Click "Advanced" → "Add Environment Variable":
   
   ```
   NODE_ENV = production
   PORT = 10000
   ```
   
   Get Firebase Admin values:
   - Go to: Firebase Console → Settings → Service Accounts
   - Click "Generate New Private Key"
   - Download the JSON file
   - Add these variables:
   
   ```
   FIREBASE_PROJECT_ID = (from JSON: project_id)
   FIREBASE_CLIENT_EMAIL = (from JSON: client_email)
   FIREBASE_PRIVATE_KEY = (from JSON: private_key - keep \n)
   ```

5. **Deploy**
   - Click "Create Web Service"
   - Wait 5-10 minutes
   - Copy the URL: `https://talkify-backend-xxxx.onrender.com`

6. **Test Backend**
   - Visit your backend URL
   - Should see empty response (that's OK!)

---

### STEP 3: Deploy Frontend to Vercel (10 minutes)

1. **Go to Vercel**
   - Visit: https://vercel.com/
   - Click "Add New" → "Project"

2. **Import Repository**
   - Find `talkify-video-chat` repository
   - Click "Import"

3. **Configure Project**
   ```
   Framework Preset: Vite
   Root Directory: frontend
   Build Command: npm run build
   Output Directory: dist
   Install Command: npm install
   ```

4. **Add Environment Variables**
   
   Get Firebase values from `frontend/src/firebase.js`:
   
   Click "Environment Variables" → Add each:
   ```
   VITE_FIREBASE_API_KEY = AIza...
   VITE_FIREBASE_AUTH_DOMAIN = your-project.firebaseapp.com
   VITE_FIREBASE_PROJECT_ID = your-project-id
   VITE_FIREBASE_STORAGE_BUCKET = your-project.appspot.com
   VITE_FIREBASE_MESSAGING_SENDER_ID = 123456789
   VITE_FIREBASE_APP_ID = 1:123456:web:abcdef
   VITE_SERVER_URL = https://talkify-backend-xxxx.onrender.com
   ```
   
   **Important**: Use your actual Render backend URL for `VITE_SERVER_URL`!

5. **Deploy**
   - Click "Deploy"
   - Wait 2-3 minutes
   - Copy the URL: `https://talkify-video-chat-xxxx.vercel.app`

6. **Test Frontend**
   - Visit your Vercel URL
   - Should see the landing page!

---

### STEP 4: Update CORS (2 minutes)

1. **Update Backend CORS**
   
   Edit `backend/app.js` locally:
   ```javascript
   app.use(cors({
     origin: [
       "https://talkify-video-chat-xxxx.vercel.app", // Your Vercel URL
       "http://localhost:5173"
     ],
     methods: ["GET", "POST"],
     credentials: true,
   }));
   ```

2. **Push Update**
   ```bash
   git add backend/app.js
   git commit -m "Update CORS for production"
   git push
   ```
   
   Render will auto-deploy in 5 minutes!

---

### STEP 5: Test Everything (5 minutes)

1. **Open Your App**
   - Visit your Vercel URL

2. **Test Authentication**
   - [ ] Click "Get Started"
   - [ ] Sign up with email/Google
   - [ ] Should redirect to Home page

3. **Test Video Meeting**
   - [ ] Click "Start a Meeting"
   - [ ] Allow camera/microphone
   - [ ] See yourself on video
   - [ ] Copy meeting link
   - [ ] Open in incognito/another device
   - [ ] Join the meeting

4. **Test Features**
   - [ ] Mute/unmute microphone
   - [ ] Turn camera on/off
   - [ ] Share screen
   - [ ] Send chat message
   - [ ] View participants
   - [ ] Send emoji reaction 😊
   - [ ] Raise hand ✋
   - [ ] Trigger confetti 🎉
   - [ ] Enter Picture-in-Picture 📺
   - [ ] End call

---

## 🎉 Success! Your App is Live!

### Share Your App:
```
Frontend: https://talkify-video-chat-xxxx.vercel.app
Backend: https://talkify-backend-xxxx.onrender.com
```

### Future Updates:

```bash
# Make changes to code
# Commit and push
git add .
git commit -m "Your update description"
git push

# Both Vercel and Render will auto-deploy! ✨
```

---

## 🐛 Common Issues

### "Backend not responding"
- Wait 30-60 seconds (Render free tier cold start)
- Check Render logs: Dashboard → Service → Logs
- Verify environment variables are set

### "Firebase authentication failed"
- Double-check all VITE_FIREBASE_* variables
- Make sure no extra quotes or spaces
- Redeploy frontend after fixing

### "CORS error"
- Make sure backend CORS includes your Vercel URL
- Push CORS update and wait for Render to redeploy

### "Video/audio not working"
- Grant browser permissions
- Use Chrome or Edge (best WebRTC support)
- Check if HTTPS is enabled (required for video)

---

## 📊 Your Deployment URLs

Fill these in after deployment:

```
GitHub: https://github.com/_____________/talkify-video-chat
Frontend (Vercel): https://________________________________
Backend (Render): https://________________________________
Firebase Console: https://console.firebase.google.com/project/___________
```

---

## 🎊 Congratulations!

You've successfully deployed a full-stack real-time video chat application!

**What you've built:**
- ✅ React frontend with Vite
- ✅ Node.js backend with Socket.IO
- ✅ Firebase authentication
- ✅ WebRTC video/audio
- ✅ Real-time chat
- ✅ Screen sharing
- ✅ Beautiful purple/blue UI
- ✅ Advanced features (reactions, PiP, confetti)

Share it with friends and show off your creation! 🚀

---

**Need help?** Check DEPLOYMENT_GUIDE.md for detailed troubleshooting.
