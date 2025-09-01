FROM python:3.11-slim

# Create non-root user
RUN useradd -m appuser
WORKDIR /app

# Install deps
COPY py-hello/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy code
COPY py-hello/ /app/

# Drop privileges
USER appuser

# Default port (ACA uses PORT env var; we default to 8080)
ENV PORT=8080

# Start with gunicorn (prod web server)
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
