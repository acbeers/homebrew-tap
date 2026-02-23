# Homebrew formula for HDV (Hierarchical Data Viewer)
# To use: brew install path/to/Formula/hdv.rb
# Or add this tap and brew install youruser/hdv/hdv
class Hdv < Formula
  include Language::Python::Virtualenv

  desc "Hierarchical Data Viewer - interactive CSV drill-down for the terminal"
  homepage "https://github.com/acbeers/hdv"
  url "https://github.com/acbeers/hdv/releases/download/v0.2.1/hdv-0.2.1.tar.gz"
  sha256 "ce479cc2d94ca716ef97c024f2cd537b05c0a27b8eed7668e064980a5784684a"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
    man1.install "share/man/man1/hdv.1"
  end

  test do
    assert_match "usage", shell_output("#{bin}/hdv --help")
  end
end
