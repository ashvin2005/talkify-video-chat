# 🎥 Talkify

> A modern, secure video meeting and chat web app built with React, Firebase, and Node.js.

Talkify enables users to sign up via Google or email, create or join meeting rooms with shareable codes, and chat in real time. Designed for seamless remote collaboration with a responsive and user-friendly UI.

![License](https://img.shields.io/badge/license-ISC-blue.svg)
![Node](https://img.shields.io/badge/node-%3E%3D16.0.0-brightgreen)
![React](https://img.shields.io/badge/react-19.1.0-blue)


## Features

- ✅ Email/Password and Google Sign-In (Firebase Authentication)
- ✅ Secure, token-based meeting creation and joining
- ✅ Realtime chat using Firestore
- ✅ Unique, shareable meeting codes
- ✅ Mute/unmute camera and audio before joining
- ✅ Responsive, modern UI built with React

---

## 🛠️ Tech Stack

### Frontend
- **React 19** - UI framework
- **Vite** - Build tool and dev server
- **Firebase SDK** - Authentication & Firestore
- **Tailwind CSS** - Styling
- **Material-UI** - UI components
- **Socket.IO Client** - Real-time communication
- **WebRTC** - Video/audio streaming
- **Particles.js** - Animated backgrounds

### Backend
- **Node.js & Express** - Server framework
- **Socket.IO** - WebSocket server
- **Firebase Admin SDK** - Backend authentication & Firestore
- **bcrypt** - Password hashing

---

##  How It Works

1. **Sign Up / Login**  
   - Users register or sign in securely with Email/Password or Google using Firebase Authentication.

2. **Create or Join Meetings**  
   - Users can generate a unique 8-character meeting code to create a room.
   - Others can join using that code.

3. **Token-Based Access Control**  
   - Frontend sends a secure token to the Express backend.
   - Backend verifies the token before granting access to the meeting room.

4. **Pre-Join Settings**  
   - Users can choose to enable/disable their camera and microphone before joining.

5. **Real-Time Chat**  
   - Messages are stored and synced using Firestore for instant updates.
   - Each chat includes user details, timestamps, and room info.

6. **Responsive & Modern UI**  
   - Built with React and Tailwind CSS for a smooth experience on all devices.

---

## 🚀 Quick Start

### Prerequisites
- Node.js (v16+)
- Firebase account ([Get started here](https://console.firebase.google.com/))

### Installation

1. **Clone the repository**
```bash
git clone <your-repo-url>
cd talkify
```

2. **Setup Backend**
```bash
cd backend
npm install
cp .env.example .env
# Edit .env with your Firebase Admin credentials
npm run dev
```

3. **Setup Frontend** (in a new terminal)
```bash
cd frontend
npm install
cp .env.example .env
# Edit .env with your Firebase Web credentials
npm run dev
```

4. **Access the app**
   - Frontend: http://localhost:5173
   - Backend: http://localhost:8000

📖 **For detailed setup instructions, see [SETUP.md](./SETUP.md)**

---

## 🔥 Firebase Configuration

This project requires Firebase for:
- **Authentication** (Email/Password & Google Sign-In)
- **Firestore Database** (Chat messages & user data)
- **Firebase Admin SDK** (Backend authentication verification)

**See [SETUP.md](./SETUP.md) for complete Firebase setup guide with screenshots and troubleshooting.**

---

## 📁 Project Structure

```
talkify/
├── backend/          # Express server with Socket.IO
├── frontend/         # React frontend with Vite
├── SETUP.md         # Detailed setup guide
└── ReadMe.md        # This file
```

---

## 🎯 Key Features Explained

### WebRTC Video Calling
- Peer-to-peer video connections using WebRTC
- STUN servers for NAT traversal
- Audio/video track management

### Real-time Chat
- Messages stored in Firestore
- Socket.IO for instant message delivery
- Persistent chat history

### Authentication Flow
1. User signs up with email/password or Google
2. Firebase Authentication issues ID token
3. Backend verifies token and generates session token
4. Session token used for API authentication

---

## 🔐 Environment Variables

### Backend (.env)
```
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_CLIENT_EMAIL=your-service-account-email
FIREBASE_PRIVATE_KEY="your-private-key"
PORT=8000
```

### Frontend (.env)
```
VITE_FIREBASE_API_KEY=your-api-key
VITE_FIREBASE_AUTH_DOMAIN=your-auth-domain
VITE_FIREBASE_PROJECT_ID=your-project-id
VITE_SERVER_URL=http://localhost:8000
```

---

## 🚢 Deployment

### Frontend
- **Netlify**: Connect GitHub repo, set env vars
- **Vercel**: Connect GitHub repo, set env vars

### Backend
- **Render**: Deploy from GitHub with env vars
- **Railway**: Deploy from GitHub with env vars

---

## 🐛 Troubleshooting

**Common Issues:**
- **CORS errors**: Ensure backend runs on port 8000
- **Firebase auth fails**: Check credentials in .env files
- **Video not working**: Allow camera/microphone permissions
- **Messages not saving**: Verify Firestore rules

See [SETUP.md](./SETUP.md) for detailed troubleshooting.

---

## 📝 Scripts

### Backend
```bash
npm run dev      # Development with auto-reload
npm start        # Production
```

### Frontend
```bash
npm run dev      # Development server
npm run build    # Production build
npm run preview  # Preview production build
```



