class Stashflow < Formula
  desc "TUI for cleaning Stash and Quantumult X subscription configs"
  homepage "https://github.com/iwen-conf/stashflow"
  url "https://github.com/iwen-conf/stashflow/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "045d0d871828321426bf77490f8b81e4ea3fd780a918ce2d61a2f24ada21f719"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"stashflow"), "./cmd/stashflow"
  end

  test do
    assert_match "用法:", shell_output("#{bin}/stashflow --help")
  end
end
