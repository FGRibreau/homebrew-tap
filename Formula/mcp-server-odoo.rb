class McpServerOdoo < Formula
  desc "MCP server exposing Odoo 16+ (JSON/2 or JSON-RPC) to Claude and MCP clients"
  homepage "https://github.com/FGRibreau/mcp-odoo"
  url "https://github.com/FGRibreau/mcp-odoo.git",
      tag:      "v0.2.1",
      revision: "276712b847f4ef47e1666519f4929e5a649f594c"
  license "MIT"
  head "https://github.com/FGRibreau/mcp-odoo.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "mcp-server-odoo", shell_output("#{bin}/mcp-server-odoo --help 2>&1")
    assert_match "ODOO_URL", shell_output("#{bin}/mcp-server-odoo --help 2>&1")
  end
end
