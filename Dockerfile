# Use Node.js official image
FROM node:14

# Set working directory
WORKDIR /usr/src/app

# Copy package*.json first (for better caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app source code
COPY . .

# Expose port (Heroku/Express runs on 5000 or 3000 usually)
EXPOSE 3000

# Start app
CMD [ "npm", "start" ]
