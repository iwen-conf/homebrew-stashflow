class Stashflow < Formula
  desc "TUI for cleaning Stash subscription YAML and restoring split routing"
  homepage "https://github.com/iwen-conf/stashflow"
  url "https://github.com/iwen-conf/stashflow/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "13ca8066a59f92a8c77a62274d349f41235c85a676d550615a67a11780244dc0"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"stashflow"), "./cmd/stashflow"
    system "go", "build", *std_go_args(output: bin/"stashflow-clean"), "./cmd/stashflow-clean"
  end

  test do
    assert_match "用法:", shell_output("#{bin}/stashflow-clean --help")
  end
end
