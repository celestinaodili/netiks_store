from fastapi import FastAPI
from netiks_shared.health import health_router

from app import models  # noqa: F401
from app.routes import router as catalog_router

app = FastAPI(title="Netiks Store Catalog Service", version="0.1.0")

app.include_router(health_router)
app.include_router(catalog_router)
