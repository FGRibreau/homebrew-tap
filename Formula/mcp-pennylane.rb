class McpPennylane < Formula
  desc "MCP server for the Pennylane Company API v2 — manage your accounting from Claude"
  homepage "https://github.com/FGRibreau/mcp-pennylane"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/FGRibreau/mcp-pennylane/releases/download/v0.1.0/mcp-pennylane-x86_64-apple-darwin.tar.gz"
      sha256 "5da1e235a4b5b0a3e750baebf0c2a793b1234baa60306f5f3a9a31ba17bce41b"
    else
      url "https://github.com/FGRibreau/mcp-pennylane/releases/download/v0.1.0/mcp-pennylane-aarch64-apple-darwin.tar.gz"
      sha256 "a99d8843b17da2d7ee59a1d036aabaa95832f36564a71a48fc810bc491768784"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/FGRibreau/mcp-pennylane/releases/download/v0.1.0/mcp-pennylane-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69d5b25f2287604e5e4804ad40406d2d97d49c78954d65676d75d5ac29c02cb8"
    else
      url "https://github.com/FGRibreau/mcp-pennylane/releases/download/v0.1.0/mcp-pennylane-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c0b16f4862f77978cb809c4e4d32383fedcfadf5be1883ea1a9e60cf0005bd2b"
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
