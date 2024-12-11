# Step 1: Use a lightweight Node.js image
FROM node:18 AS builder

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Clone the repository
RUN git clone https://github.com/AbyssServices/Abyss-Web.git .

# Step 4: Install dependencies
RUN npm install

# Step 5: Create a new lightweight image for running the app
FROM node:18

# Step 6: Set the working directory
WORKDIR /app

# Step 7: Copy the installed dependencies and application files from the builder stage
COPY --from=builder /app .

# Step 8: Expose the port the app runs on (if needed)
EXPOSE 8080

# Step 9: Command to run the application
CMD ["npm", "start"]
