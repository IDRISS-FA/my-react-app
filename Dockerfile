# Step 1: Build the React app
FROM node:18-alpine AS build

WORKDIR /app

# 📦 Copy ONLY package files first (better caching)
COPY package.json package-lock.json ./

# 🔧 Use npm ci instead of npm install (more reliable)
RUN npm ci

# 📁 Copy the rest of the code
COPY . ./

# 🏗️ Build the React app
RUN npm run build

# Step 2: Serve with Node.js + serve (REPLACES NGINX)
FROM node:18-alpine

WORKDIR /app

# 📦 Copy package files again
COPY package.json package-lock.json ./

# ⚡ Install ONLY production dependencies (includes 'serve')
RUN npm ci --only=production

# 📁 Copy built app from build stage
COPY --from=build /app/build ./build

# 🚪 Changed: Port 3000 instead of 80 (serve default)
EXPOSE 8080


# Uses the "serve" script from your package.json
CMD ["npm", "run", "serve"]