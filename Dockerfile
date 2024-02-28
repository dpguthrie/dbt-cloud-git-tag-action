# Use an official Python runtime as a parent image
FROM python:3.9.18-slim

# Set the working directory in the container
ADD . /app
WORKDIR /app

RUN pip install uv

# Install any dependencies
ENV VIRTUAL_ENV=/usr/local
RUN pip install uv && uv pip install --no-cache requests

# Copy the script to the container
COPY main.py .

# Run the script when the container launches
CMD ["python", "/app/main.py"]