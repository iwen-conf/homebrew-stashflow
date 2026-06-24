class Stashflow < Formula
  desc "TUI for cleaning Stash and Quantumult X subscription configs"
  homepage "https://github.com/iwen-conf/stashflow"
  url "https://github.com/iwen-conf/stashflow/archive/refs/tags/v0.2.7.tar.gz"
  sha256 "060d9d6b3006ad858008f58f4219e9c0c6cb34e609af626fe4a4642b5e577758"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"stashflow"), "./cmd/stashflow"
  end

  test do
    assert_match "用法:", shell_output("#{bin}/stashflow --help")
  end
end
