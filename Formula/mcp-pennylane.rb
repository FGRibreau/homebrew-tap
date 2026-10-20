class McpPennylane < Formula
  desc "MCP server for the Pennylane Company API v2 — manage your accounting from Claude"
  homepage "https://github.com/FGRibreau/mcp-pennylane"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/FGRibreau/mcp-pennylane/releases/download/v0.3.0/mcp-pennylane-x86_64-apple-darwin.tar.gz"
      sha256 "ea7aa2afc41503f0d29bba5a7a8d837d4ea58a5791d151f24da491b1f7ab1bf1"
    else
      url "https://github.com/FGRibreau/mcp-pennylane/releases/download/v0.3.0/mcp-pennylane-aarch64-apple-darwin.tar.gz"
      sha256 "708e2208d92c71f784f037d1df6cfb0bdca08c93adaf5e289a66f111c1f1b12b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/FGRibreau/mcp-pennylane/releases/download/v0.3.0/mcp-pennylane-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "424df80a41bf71f12d08e43f30e9dd1228a7acbb071936576f03a526c3cd591b"
    else
      url "https://github.com/FGRibreau/mcp-pennylane/releases/download/v0.3.0/mcp-pennylane-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f410b03a280a67704e43c34f2a09f2044d3a08b6a4d413a794f502b1efacd528"
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
