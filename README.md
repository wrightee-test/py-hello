# py-hello

Minimal Flask service for Azure Container Apps.

## Endpoints
- `/` → `{"service":"py-hello","version":"1.0.0"}`
- `/healthz` → `{"status":"ok"}`

Run locally:

```bash
python3 py-hello/app.py
# then open http://127.0.0.1:8080/

