class ZshTerminalProfile < Formula
  desc "Switch macOS Terminal.app profiles directly from your Zsh shell"
  homepage "https://github.com/sfcodes/zsh-terminal-profile"
  url "https://github.com/sfcodes/zsh-terminal-profile/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "683dedd95799e44505a07c47732c47b8d21f92759d8c2eb61852234c4cf97180"
  license "BSD-3-Clause"
  head "https://github.com/sfcodes/zsh-terminal-profile.git", branch: "main"

  depends_on "fzf"
  depends_on :macos

  def install
    pkgshare.install "zsh-terminal-profile.plugin.zsh"
  end

  def caveats
    <<~EOS
      To activate the plugin, add the following to your .zshrc, after compinit:
        source #{HOMEBREW_PREFIX}/share/zsh-terminal-profile/zsh-terminal-profile.plugin.zsh

      Then restart your terminal. The plugin only works in the built-in Terminal.app.
    EOS
  end

  test do
    plugin = pkgshare/"zsh-terminal-profile.plugin.zsh"
    command = "autoload -Uz compinit; compinit -u -D; source #{plugin}; whence -w profile"
    assert_match "profile: function", shell_output("zsh -fc '#{command}'")
  end
end
