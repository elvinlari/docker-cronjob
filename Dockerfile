# Pulling Ubuntu image
FROM ubuntu:20.04

# Updating packages and installing cron
RUN apt-get update && apt-get install cron -y 

RUN mkdir -p app

# Copying script file into the container
COPY script.sh app
RUN chmod +x /app/script.sh

RUN echo "*/1 * * * * root /app/script.sh > /proc/1/fd/1 2>/proc/1/fd/2" >> /etc/crontab

# Creating entry point for cron 
ENTRYPOINT ["cron", "-f"]
