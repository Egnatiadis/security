# Base image: Χρησιμοποιώ την έκδοση 16 για να είναι πιο πρόσφατη από το template
FROM node:16-buster-slim

# Στοιχεία φοιτητή - Project για το μάθημα DevSecOps
LABEL maintainer="Egnatiadis"
LABEL student_id="YOUR_ID_HERE" 

# Ορίζω το φάκελο της εφαρμογής μου
WORKDIR /app/my_web_project

# Αντιγράφω πρώτα τα package αρχεία (καλή πρακτική για το cache)
# Αν δεν έχεις package.json, η παρακάτω εντολή npm install θα το φτιάξει
RUN npm init -y && npm install express@4.17.1

# Δημιουργώ έναν φάκελο για logs για να φαίνεται πιο "πραγματικό" project
RUN mkdir ./logs

# Αντιγραφή όλων των αρχείων του project μου
COPY . .

# Ενημέρωση του συστήματος (τυπικό βήμα σε Dockerfiles φοιτητών)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Η εφαρμογή μου ακούει στην 3000
EXPOSE 3000

# Εκκίνηση της εφαρμογής
CMD [ "node", "index.js" ]
