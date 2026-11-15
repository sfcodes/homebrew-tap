class ClaudeRevisit < Formula
  desc "Find a past Claude Code session by describing it, then resume it"
  homepage "https://github.com/sfcodes/claude-revisit"
  url "https://github.com/sfcodes/claude-revisit/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "300987e88250784f22734e55bcf1397c3f29117bfa1611f2d24cc8fd72397c4c"
  license "BSD-3-Clause"

  depends_on "fzf"

  uses_from_macos "perl"

  def install
    bin.install "claude-revisit"
  end

  def caveats
    <<~EOS
      claude-revisit needs Claude Code (the `claude` command), installed and logged in.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-revisit --version")
    assert_match "does not exist", shell_output("#{bin}/claude-revisit -c #{testpath}/missing -p test 2>&1", 1)
  end
end
