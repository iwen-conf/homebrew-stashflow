class Stashflow < Formula
  desc "TUI for cleaning Stash subscription YAML and restoring split routing"
  homepage "https://github.com/iwen-conf/stashflow"
  url "https://github.com/iwen-conf/stashflow/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "8830d14893b9bfb7e8cdf52d5aaabf57e61490a42e11ad4e10fd032a686e25c7"
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
