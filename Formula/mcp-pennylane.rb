class McpPennylane < Formula
  desc "MCP server for the Pennylane Company API v2 — manage your accounting from Claude"
  homepage "https://github.com/FGRibreau/mcp-pennylane"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/FGRibreau/mcp-pennylane/releases/download/v0.2.0/mcp-pennylane-x86_64-apple-darwin.tar.gz"
      sha256 "db44439046acaa4a42c0d8eb443a8c1433e021c93f932597cf81b296080b8ad0"
    else
      url "https://github.com/FGRibreau/mcp-pennylane/releases/download/v0.2.0/mcp-pennylane-aarch64-apple-darwin.tar.gz"
      sha256 "415a6a22e753b5e0f3a3b850217aebe30d0d8838f41d23bb8db9c87fdc23858e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/FGRibreau/mcp-pennylane/releases/download/v0.2.0/mcp-pennylane-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "adafe17c69499482a8b4ace6404788969b3535bc94493a8dfca9cb7912d25a4e"
    else
      url "https://github.com/FGRibreau/mcp-pennylane/releases/download/v0.2.0/mcp-pennylane-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e0af658422104eb12857d59f27691f1e7bdbae85720570b99bd43c8b518c9506"
    end
  end

  def install
    bin.install "mcp-pennylane"
  end

  test do
    assert_match "mcp-pennylane", shell_output("#{bin}/mcp-pennylane --version")
    # Help text should mention the required env var without needing a real token.
    assert_match "PENNYLANE_API_KEY", shell_output("#{bin}/mcp-pennylane --help")
  end
end
