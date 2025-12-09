# Lavalink Deployment Guide

## 🚀 Deploy on Render (FREE - Recommended)

### Step 1: Push to GitHub (Already Done ✅)

Your repo: https://github.com/storage1mohitraj-cmd/Music-Lavalink

### Step 2: Deploy on Render

1. Go to https://render.com/
2. Sign in (use same account as your Discord bot)
3. Click **"New +"** → **"Web Service"**
4. Click **"Build and deploy from a Git repository"**
5. Connect your GitHub account if not already
6. Select repository: **`Music-Lavalink`**
7. Click **"Connect"**

### Step 3: Configure Service

**Settings:**
- **Name**: `lavalink` (or any name you want)
- **Region**: Choose closest to you
- **Branch**: `main`
- **Root Directory**: Leave empty (files are in root)
- **Runtime**: `Docker`
- **Instance Type**: `Free`

### Step 4: Environment Variables

Add this environment variable:
- **Key**: `LAVALINK_SERVER_PASSWORD`
- **Value**: `your_secure_password_here` (choose a strong password)

### Step 5: Deploy

Click **"Create Web Service"**

Render will:
- Build the Docker image
- Deploy Lavalink
- Give you a URL (e.g., `lavalink-abc123.onrender.com`)

⏱️ First deployment takes ~5 minutes

### Step 6: Get Your URL

Once deployed, copy the URL from the top of the page.

### Step 7: Update Bot Configuration

In your Discord bot's environment variables on Render:

```env
LAVALINK_HOST=your-lavalink.onrender.com
LAVALINK_PORT=443
LAVALINK_PASSWORD=your_secure_password_here
LAVALINK_SECURE=true
```

### Step 8: Restart Bot

Restart your Discord bot service, and music will work! 🎵

---

## ⚠️ Render Free Tier Limitations

- **Sleeps after 15 minutes of inactivity**
- **Wakes up automatically when bot connects** (~30 seconds)
- **750 hours/month free** (enough for moderate use)

**Solution for sleep issue:**
- First song request may take 30-60 seconds (waking up Lavalink)
- Subsequent requests are instant
- Or upgrade to paid plan ($7/month) for 24/7 uptime

---

## 🎯 Alternative: Fly.io (Better Free Tier)

### Advantages:
- ✅ No sleep on inactivity
- ✅ Better free tier
- ✅ 3 free VMs

### Quick Deploy:

1. **Install Fly CLI**:
   ```powershell
   powershell -Command "iwr https://fly.io/install.ps1 -useb | iex"
   ```

2. **Login**:
   ```bash
   fly auth login
   ```

3. **Create fly.toml** (already created below)

4. **Deploy**:
   ```bash
   cd lavalink
   fly launch --no-deploy
   fly secrets set LAVALINK_SERVER_PASSWORD=your_password
   fly deploy
   ```

5. **Get URL**:
   ```bash
   fly status
   ```

6. **Update bot's .env**:
   ```env
   LAVALINK_HOST=your-app.fly.dev
   LAVALINK_PORT=443
   LAVALINK_PASSWORD=your_password
   LAVALINK_SECURE=true
   ```

---

## 📋 Comparison

| Platform | Free Tier | Sleep? | Setup Difficulty |
|----------|-----------|--------|------------------|
| **Render** | 750h/month | Yes (15min) | ⭐ Easy |
| **Fly.io** | 3 VMs | No | ⭐⭐ Medium |
| **Railway** | $5 credit | No | ⭐ Easy (but limited now) |

---

## 🎯 My Recommendation

**For your use case:**

1. **Start with Render** (easiest, same platform as your bot)
2. **If sleep is annoying**, switch to Fly.io
3. **For production**, consider paid Render ($7/month for 24/7)

---

## 🧪 Testing

After deployment, test:

```bash
curl https://your-lavalink-url.onrender.com/version
```

Should return Lavalink version info.

---

## 🔧 Troubleshooting

### Render deployment failed

**Check build logs:**
- Go to your service
- Click "Logs" tab
- Look for errors

**Common issues:**
- Dockerfile path incorrect
- Missing environment variable
- Out of memory (Render free tier has 512MB)

### Bot can't connect

**Verify:**
1. Lavalink service is running (not sleeping)
2. URL is correct in bot's .env
3. Password matches
4. Using port 443 and SECURE=true

### First connection slow

This is normal on Render free tier:
- Service sleeps after 15min inactivity
- Takes ~30 seconds to wake up
- Subsequent connections are instant

---

## 💡 Pro Tips

### Keep Lavalink Awake (Render)

Create a free UptimeRobot monitor:
1. Go to https://uptimerobot.com/
2. Add monitor for your Lavalink URL
3. Ping every 5 minutes
4. Keeps service awake 24/7

### Upgrade Later

If you need 24/7:
- Render: $7/month
- Fly.io: Free tier is already 24/7
- Railway: $5/month

---

## ✅ Quick Start Checklist

- [ ] Repository pushed to GitHub ✅
- [ ] Render account created
- [ ] New Web Service created
- [ ] Docker runtime selected
- [ ] Environment variable set
- [ ] Service deployed
- [ ] URL copied
- [ ] Bot's .env updated
- [ ] Bot restarted
- [ ] Music tested

---

## 🎉 You're All Set!

Your music bot will be fully functional with Lavalink hosted on Render!

**Need help?** Check the logs in Render dashboard or refer to:
- [Render Documentation](https://render.com/docs)
- [Lavalink Documentation](https://lavalink.dev/)
