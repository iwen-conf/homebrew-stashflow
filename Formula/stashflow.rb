class Stashflow < Formula
  desc "TUI for cleaning Stash and Quantumult X subscription configs"
  homepage "https://github.com/iwen-conf/stashflow"
  url "https://github.com/iwen-conf/stashflow/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "33d705f54d863ea56c84073cdbee4caa4d235dbf6ee7da6b3af1797fdf8a2eb6"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"stashflow"), "./cmd/stashflow"
  end

  test do
    assert_match "用法:", shell_output("#{bin}/stashflow --help")
  end
end
