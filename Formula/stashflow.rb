class Stashflow < Formula
  desc "TUI for cleaning Stash subscription YAML and restoring split routing"
  homepage "https://github.com/iwen-conf/stashflow"
  url "https://github.com/iwen-conf/stashflow/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "b8113695eed1df9df2bcdd14e6a101b9bf0a48de5cddbc5bf182da1a88ad4b43"
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
