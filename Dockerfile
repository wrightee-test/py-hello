FROM python:3.11-slim

# Create app user
RUN useradd -m appuser

WORKDIR /app

# Install deps first (better cache)
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the rest of the source
COPY . /app/

# Non-root
USER appuser

# Default port handling
ENV PORT=8080
EXPOSE 8080

CMD ["python", "app.py"]
