# Use a Python image with uv pre-installed
FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

# Install the project into `/app`
WORKDIR /app

# Enable bytecode compilation
ENV UV_COMPILE_BYTECODE=1
ENV UV_SYSTEM_PYTHON=1

# Set the working directory in the container
ADD . /app
RUN uv pip install requests

# Copy the script to the container
COPY main.py .

# Run the script when the container launches
CMD ["python", "/app/main.py"]
