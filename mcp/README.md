### MCP Docs

This doc contains the setup steps for MCPs. The intention is to copy commands from here.

- [`duckduckgo-mcp-server`](https://github.com/nickclyde/duckduckgo-mcp-server)
  ```bash
  # create env
  conda  create --name ddg-mcp python=3.12

  # exec to launch the mcp
  conda run -n ddg-mcp --no-capture-output python3 /opt/anaconda3/envs/ddg-mcp/bin/duckduckgo-mcp-server
  ```  
