# Use the official Python image as the base image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy requirements files
COPY requirements.txt requirements-dev.txt /app/

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install -r requirements-dev.txt

# Copy the application code
COPY . /app

# Expose the port that FastAPI will run on
EXPOSE 8000

# Command to run the application with Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
