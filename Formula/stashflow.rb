class Stashflow < Formula
  desc "TUI for cleaning Stash and Quantumult X subscription configs"
  homepage "https://github.com/iwen-conf/stashflow"
  url "https://github.com/iwen-conf/stashflow/archive/refs/tags/v0.2.5.tar.gz"
  sha256 "2d661268765c6ad0373603d0cf1d35f7ac3f83601b3ab0f036a6fc002037a29e"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"stashflow"), "./cmd/stashflow"
  end

  test do
    assert_match "用法:", shell_output("#{bin}/stashflow --help")
  end
end
