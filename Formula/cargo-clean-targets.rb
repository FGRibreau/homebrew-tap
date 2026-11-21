class CargoCleanTargets < Formula
  desc "Cargo subcommand: strip target/ caches across a tree, keep only compiled binaries"
  homepage "https://github.com/FGRibreau/cargo-clean-targets"
  url "https://github.com/FGRibreau/cargo-clean-targets/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "bacc50a7862d59ecd4f5bc82188d90a653ff75afcc69e793b74448e73779f722"
  license "MIT"
  head "https://github.com/FGRibreau/cargo-clean-targets.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "cargo-clean-targets", shell_output("#{bin}/cargo-clean-targets --help 2>&1", 0)
    mkdir_p testpath/"empty-dir"
    output = shell_output("#{bin}/cargo-clean-targets --dry #{testpath}/empty-dir")
    assert_match "0 target dir(s)", output
  end
end
