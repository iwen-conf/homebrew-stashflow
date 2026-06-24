class Stashflow < Formula
  desc "TUI for cleaning Stash and Quantumult X subscription configs"
  homepage "https://github.com/iwen-conf/stashflow"
  url "https://github.com/iwen-conf/stashflow/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "c689aec9b0b3dc4738eacb5e79933995c931210369f6543b48e1d284f8ffc74e"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"stashflow"), "./cmd/stashflow"
    system "go", "build", *std_go_args(output: bin/"stashflow-clean"), "./cmd/stashflow-clean"
  end

  test do
    assert_match "用法:", shell_output("#{bin}/stashflow-clean --help 2>&1")
  end
end
