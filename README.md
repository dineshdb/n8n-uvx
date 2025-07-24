# n8n-uvx Docker Image

This repository provides a Docker image for `n8n` with `uv` and `uvx` (Astral's
Python package installer and executor) pre-installed. This allows users to
leverage `uv` and `uvx` within their `n8n` workflows, particularly useful for
custom Python code execution.

## Features

- Based on the official `n8n:latest` Docker image.
- Includes `uv` and `uvx` for efficient Python dependency management and
  execution.
- Essential build tools and `chromium` are installed for broader compatibility.

## Usage

To use this Docker image, you can pull it from a Docker registry (once
published) or build it locally.

### Building Locally

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/n8n-uvx.git
   cd n8n-uvx
   ```
2. Build the Docker image:
   ```bash
   docker build -t n8n-uvx .
   ```

### Running the Image

You can run the image just like a standard `n8n` Docker image:

```bash
docker run -it --rm \
  --name n8n-uvx \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  n8n-uvx
```

Replace `~/.n8n` with your desired local data directory for `n8n` persistence.

### AI Agents and MCP Servers

If you plan on using AI agents and MCP servers with this `n8n` instance, you
should enable the following environment variable:

```bash
N8N_COMMUNITY_PACKAGES_ALLOW_TOOL_USAGE=true
```

You can add this to your `docker run` command like so:

```bash
docker run -it --rm \
  --name n8n-uvx \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  -e N8N_COMMUNITY_PACKAGES_ALLOW_TOOL_USAGE=true \
  n8n-uvx
```

You might also want to look at `n8n-nodes-mcp` community node to run npm based
MCP servers.

## Development

If you need to customize the image, modify the `Dockerfile` and rebuild.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file
for details.
