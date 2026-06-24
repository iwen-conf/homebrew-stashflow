class Stashflow < Formula
  desc "TUI for cleaning Stash and Quantumult X subscription configs"
  homepage "https://github.com/iwen-conf/stashflow"
  url "https://github.com/iwen-conf/stashflow/archive/refs/tags/v0.2.6.tar.gz"
  sha256 "5b4fd92a98c51fd48735a48d4bfe4852876b74bf4785c8ec4c899ebc86967fba"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"stashflow"), "./cmd/stashflow"
  end

  test do
    assert_match "用法:", shell_output("#{bin}/stashflow --help")
  end
end
