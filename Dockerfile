# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory
WORKDIR /app

# Install necessary dependencies and tools
RUN apt-get update && \
    apt-get install -y wget unzip openjdk-11-jdk-headless

# Install apktool
RUN wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O /usr/local/bin/apktool && \
    chmod +x /usr/local/bin/apktool && \
    wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.7.0.jar -O /usr/local/bin/apktool.jar && \
    chmod +x /usr/local/bin/apktool.jar

# Download the Magisk APK file
RUN wget https://github.com/topjohnwu/Magisk/releases/download/v25.2/Magisk-v25.2.apk

# Install any needed packages specified in requirements.txt
COPY requirements.txt /app
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Copy the current directory contents into the container
COPY . /app

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# run magisk using the apk tool
RUN apktool d Magisk-v25.2.apk -o magisk

# Run app.py when the container launches
CMD ["python", "app.py"]

