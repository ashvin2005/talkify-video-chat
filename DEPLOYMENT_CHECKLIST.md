# 📋 Deployment Checklist

Use this checklist to track your deployment progress!

---

## 🎯 Phase 1: GitHub Setup

- [ ] **Create GitHub Account** (if don't have one)
      → https://github.com/join

- [ ] **Create New Repository**
      → https://github.com/new
      → Name: `talkify-video-chat`
      → Public or Private
      → Do NOT initialize with README

- [ ] **Add Git Remote**
      ```bash
      git remote add origin https://github.com/YOUR_USERNAME/talkify-video-chat.git
      ```

- [ ] **Push Code to GitHub**
      ```bash
      git branch -M main
      git push -u origin main
      ```

- [ ] **Verify on GitHub**
      → Visit: `https://github.com/YOUR_USERNAME/talkify-video-chat`
      → All files visible ✅

---

## 🔧 Phase 2: Backend Deployment (Render)

- [ ] **Create Render Account**
      → https://render.com/register
      → Sign up with GitHub

- [ ] **Connect GitHub Repository**
      → Dashboard → New → Web Service
      → Connect `talkify-video-chat`

- [ ] **Configure Service Settings**
      ```
      Name: talkify-backend
      Root Directory: backend
      Environment: Node
      Build Command: npm install
      Start Command: node app.js
      Instance Type: Free
      ```

- [ ] **Download Firebase Admin Key**
      → Firebase Console → Settings → Service Accounts
      → Generate New Private Key
      → Save the JSON file

- [ ] **Add Environment Variables**
      ```
      NODE_ENV = production
      PORT = 10000
      FIREBASE_PROJECT_ID = (from JSON)
      FIREBASE_CLIENT_EMAIL = (from JSON)
      FIREBASE_PRIVATE_KEY = (from JSON - keep \n)
      ```

- [ ] **Deploy Backend**
      → Click "Create Web Service"
      → Wait 5-10 minutes

- [ ] **Copy Backend URL**
      → Example: `https://talkify-backend-xxxx.onrender.com`
      → Write it here: ___________________________________

- [ ] **Test Backend**
      → Visit the URL in browser
      → Should load (even if blank page)

---

## 🎨 Phase 3: Frontend Deployment (Vercel)

- [ ] **Create Vercel Account**
      → https://vercel.com/signup
      → Sign up with GitHub

- [ ] **Import Repository**
      → Add New → Project
      → Import `talkify-video-chat`

- [ ] **Configure Build Settings**
      ```
      Framework Preset: Vite
      Root Directory: frontend
      Build Command: npm run build
      Output Directory: dist
      ```

- [ ] **Get Firebase Config Values**
      → Open: `frontend/src/firebase.js`
      → Copy all values

- [ ] **Add Environment Variables**
      ```
      VITE_FIREBASE_API_KEY = (from firebase.js)
      VITE_FIREBASE_AUTH_DOMAIN = (from firebase.js)
      VITE_FIREBASE_PROJECT_ID = (from firebase.js)
      VITE_FIREBASE_STORAGE_BUCKET = (from firebase.js)
      VITE_FIREBASE_MESSAGING_SENDER_ID = (from firebase.js)
      VITE_FIREBASE_APP_ID = (from firebase.js)
      VITE_SERVER_URL = (your Render backend URL)
      ```

- [ ] **Deploy Frontend**
      → Click "Deploy"
      → Wait 2-3 minutes

- [ ] **Copy Frontend URL**
      → Example: `https://talkify-video-chat-xxxx.vercel.app`
      → Write it here: ___________________________________

---

## 🔗 Phase 4: Connect Frontend & Backend

- [ ] **Update Backend CORS**
      → Edit `backend/app.js` locally
      → Add your Vercel URL to CORS origins:
      ```javascript
      origin: [
        "https://your-app.vercel.app",
        "http://localhost:5173"
      ]
      ```

- [ ] **Push CORS Update**
      ```bash
      git add backend/app.js
      git commit -m "Update CORS for production"
      git push
      ```

- [ ] **Wait for Auto-Deploy**
      → Render will auto-deploy in ~5 minutes
      → Check Render dashboard for deployment status

---

## 🧪 Phase 5: Testing

### Authentication Tests
- [ ] Open your Vercel URL
- [ ] Click "Get Started"
- [ ] Sign up with email
- [ ] Verify email works
- [ ] Sign out
- [ ] Sign in with Google
- [ ] Verify Google auth works

### Video Meeting Tests
- [ ] Create new meeting
- [ ] Allow camera permission
- [ ] Allow microphone permission
- [ ] See your video feed
- [ ] Copy meeting link
- [ ] Open in incognito/another browser
- [ ] Join the meeting
- [ ] See both participants

### Feature Tests
- [ ] **Video**: Turn camera on/off
- [ ] **Audio**: Mute/unmute microphone
- [ ] **Screen Share**: Share screen
- [ ] **Chat**: Send message, receive message
- [ ] **Participants**: View participants list
- [ ] **Reactions**: Send emoji reaction
- [ ] **Hand Raise**: Raise and lower hand
- [ ] **Confetti**: Click celebration button 🎉
- [ ] **Picture-in-Picture**: Enter PiP mode 📺
- [ ] **Recording**: Start/stop recording indicator
- [ ] **Meeting History**: Check if meeting saved in history
- [ ] **End Call**: Leave meeting successfully

### Browser Compatibility
- [ ] Test on Chrome
- [ ] Test on Safari (Mac)
- [ ] Test on Edge
- [ ] Test on mobile browser

---

## 📊 Phase 6: Monitoring

- [ ] **Check Vercel Analytics**
      → Vercel Dashboard → Your Project → Analytics

- [ ] **Check Render Metrics**
      → Render Dashboard → Service → Metrics tab

- [ ] **Monitor Backend Logs**
      → Render Dashboard → Service → Logs tab

- [ ] **Check Firebase Usage**
      → Firebase Console → Usage tab

---

## 🐛 Troubleshooting Checklist

### If Backend Not Responding:
- [ ] Check Render service status (should be "Live")
- [ ] Wait 30-60 seconds (cold start on free tier)
- [ ] Check Render logs for errors
- [ ] Verify all environment variables are set
- [ ] Restart service manually if needed

### If Frontend Not Loading:
- [ ] Check Vercel deployment status
- [ ] Review Vercel function logs
- [ ] Check browser console for errors
- [ ] Verify all VITE_ environment variables are set
- [ ] Try hard refresh (Cmd+Shift+R / Ctrl+Shift+R)

### If Authentication Fails:
- [ ] Double-check Firebase config values
- [ ] Ensure no extra spaces in environment variables
- [ ] Check Firebase Console for auth errors
- [ ] Verify Firebase authorized domains include Vercel URL
- [ ] Redeploy frontend after fixing env vars

### If Video/Audio Not Working:
- [ ] Check browser permissions (camera/microphone)
- [ ] Use HTTPS (required for WebRTC)
- [ ] Try different browser (Chrome recommended)
- [ ] Check firewall settings
- [ ] Test on different network

### If CORS Errors:
- [ ] Verify backend CORS includes Vercel URL
- [ ] Check for typos in URL
- [ ] Push CORS update to git
- [ ] Wait for Render to auto-deploy
- [ ] Clear browser cache

---

## ✅ Final Verification

- [ ] All tests passed
- [ ] No console errors
- [ ] Backend responding fast
- [ ] Frontend loading properly
- [ ] All features working
- [ ] Mobile responsive
- [ ] Meeting history saving

---

## 🎉 You're Live!

### Your Deployment Info:

```
Frontend URL: _______________________________________________
Backend URL:  _______________________________________________
GitHub Repo:  _______________________________________________
Firebase:     _______________________________________________

Deployed on: ______ / ______ / 2025
```

### Share Your App:
Send your Vercel URL to friends and start video chatting! 🚀

---

## 📈 Next Steps (Optional)

- [ ] **Add Custom Domain**
      → Vercel Settings → Domains

- [ ] **Enable Vercel Analytics**
      → Better insights into usage

- [ ] **Upgrade Render Plan**
      → $7/month for always-on backend

- [ ] **Set up Firebase Blaze**
      → Scale beyond free tier limits

- [ ] **Add More Features**
      → Virtual backgrounds, polls, whiteboard

- [ ] **Monitor Performance**
      → Track load times and errors

---

**Congratulations on deploying Talkify!** 🎊

You've built and deployed a professional video chat application!
