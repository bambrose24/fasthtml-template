# Use the official Python image from the Docker Hub
FROM python:3.12-slim

# Install Poetry
RUN pip install poetry

# Set the working directory in the container
WORKDIR /app

# Copy only the pyproject.toml and poetry.lock files to the container
COPY pyproject.toml poetry.lock* ./

# Install dependencies
RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi

# Copy the rest of the application code into the container
COPY . .

# Specify the command to run on container start
CMD ["poetry", "run", "python", "main.py"]
