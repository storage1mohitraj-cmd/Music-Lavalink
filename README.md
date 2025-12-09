# Lavalink Railway Deployment

This folder contains everything needed to deploy Lavalink on Railway.

## 🚀 Quick Deploy to Railway

### Step 1: Push to GitHub

Make sure this `lavalink` folder is in your repository root and pushed to GitHub.

### Step 2: Deploy on Railway

1. Go to https://railway.app/
2. Sign up/Login (free account)
3. Click **"New Project"**
4. Select **"Deploy from GitHub repo"**
5. Choose your repository
6. **Important**: Set the root directory to `lavalink` in Railway settings
7. Railway will auto-detect the Dockerfile

### Step 3: Configure Environment Variables

In Railway dashboard:

1. Go to your Lavalink service
2. Click **"Variables"** tab
3. Add this variable:
   - **Key**: `LAVALINK_SERVER_PASSWORD`
   - **Value**: `your_secure_password_here` (choose a strong password)

### Step 4: Get Your Lavalink URL

1. Go to **"Settings"** tab
2. Under **"Networking"**, click **"Generate Domain"**
3. Copy the generated URL (e.g., `your-app.up.railway.app`)

### Step 5: Update Bot Configuration

In your Discord bot's `.env` file (on Render):

```env
LAVALINK_HOST=your-app.up.railway.app
LAVALINK_PORT=443
LAVALINK_PASSWORD=your_secure_password_here
LAVALINK_SECURE=true
```

### Step 6: Restart Your Bot

Restart your Discord bot on Render, and music features will work! 🎵

---

## 📋 Files in This Folder

- **`Dockerfile`** - Builds Lavalink container
- **`application.yml`** - Lavalink configuration
- **`railway.json`** - Railway deployment settings
- **`README.md`** - This file

---

## 🔧 Configuration Details

### Memory Settings

The Dockerfile is configured for Railway's free tier:
- Max heap: 512MB (`-Xmx512M`)
- Optimized for low memory usage

### Supported Sources

- ✅ YouTube (videos, playlists, search)
- ✅ Spotify (via YouTube matching)
- ✅ SoundCloud
- ✅ Bandcamp
- ✅ Twitch streams
- ✅ Vimeo
- ✅ Direct HTTP streams

### Port

- Default: `2333`
- Railway will handle HTTPS automatically

---

## 🧪 Testing Your Deployment

After deployment, test the connection:

```bash
curl https://your-app.up.railway.app/version
```

Should return Lavalink version information.

---

## 💰 Railway Free Tier

Railway offers:
- ✅ $5 free credit per month
- ✅ ~500 hours of runtime
- ✅ No credit card required
- ✅ No sleep/inactivity shutdown

This is enough for:
- 24/7 operation for small bots
- Development and testing
- Personal projects

---

## 🔄 Updating Lavalink

To update to a newer Lavalink version:

1. Edit `Dockerfile`
2. Change the version number in the download URL:
   ```dockerfile
   ADD https://github.com/lavalink-devs/Lavalink/releases/download/4.0.8/Lavalink.jar Lavalink.jar
   ```
3. Commit and push
4. Railway will auto-redeploy

---

## 🐛 Troubleshooting

### Deployment Failed

**Check logs in Railway dashboard:**
- Click on your service
- Go to "Deployments" tab
- Click on the failed deployment
- View logs

**Common issues:**
- Missing `LAVALINK_SERVER_PASSWORD` variable
- Root directory not set to `lavalink`
- Out of memory (increase in Dockerfile if needed)

### Bot Can't Connect

**Verify:**
1. Lavalink is running (check Railway dashboard)
2. Domain is generated and accessible
3. Password matches in both Railway and bot's `.env`
4. Bot's `.env` has correct host and port

### Connection Timeout

**Check:**
- Railway service is running (not stopped)
- Generated domain is correct
- Firewall/network allows HTTPS connections

---

## 📊 Monitoring

### Railway Dashboard

Monitor your Lavalink instance:
- CPU usage
- Memory usage
- Network traffic
- Logs in real-time

### Lavalink Metrics

Access metrics at: `https://your-app.up.railway.app/metrics`

---

## 🔐 Security

### Password

- Change the default password in Railway environment variables
- Use a strong, unique password
- Don't commit passwords to Git

### Access

- Only your bot should access Lavalink
- Don't share your Lavalink URL publicly
- Railway handles HTTPS automatically

---

## 📚 Additional Resources

- [Lavalink Documentation](https://lavalink.dev/)
- [Railway Documentation](https://docs.railway.app/)
- [Wavelink Documentation](https://wavelink.dev/)

---

## ✅ Checklist

Before deploying:

- [ ] Files are in `lavalink/` folder at repository root
- [ ] Pushed to GitHub
- [ ] Railway account created
- [ ] Repository connected to Railway
- [ ] Root directory set to `lavalink` in Railway
- [ ] Environment variable `LAVALINK_SERVER_PASSWORD` set
- [ ] Domain generated
- [ ] Bot's `.env` updated with Railway URL
- [ ] Bot restarted

---

## 🎉 Success!

Once deployed, your bot will have:
- ✅ Reliable music playback
- ✅ 24/7 availability
- ✅ No SSL certificate issues
- ✅ Fast performance
- ✅ Free hosting

Enjoy your music bot! 🎵
