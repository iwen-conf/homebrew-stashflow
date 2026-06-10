class Stashflow < Formula
  desc "TUI for cleaning Stash subscription YAML and restoring split routing"
  homepage "https://github.com/iwen-conf/stashflow"
  url "https://github.com/iwen-conf/stashflow/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "9345b9b3a5af1c6bdc4997144ef69c48270b77822c4e5880bfe1d884d86b6b7d"
  license "MIT"

  depends_on "python@3.14"

  def install
    python = Formula["python@3.14"].opt_bin/"python3"
    inreplace "bin/stashflow", "#!/usr/bin/env python3", "#!#{python}"
    inreplace "bin/stashflow-clean", "#!/usr/bin/env python3", "#!#{python}"

    bin.install "bin/stashflow"
    bin.install "bin/stashflow-clean"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/stashflow-clean --help")
  end
end
