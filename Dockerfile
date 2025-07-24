FROM ghcr.io/astral-sh/uv AS uv

FROM docker.n8n.io/n8nio/n8n
COPY --from=uv /uv /uvx /usr/local/bin/
