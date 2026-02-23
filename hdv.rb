# Homebrew formula for HDV (Hierarchical Data Viewer)
# To use: brew install path/to/Formula/hdv.rb
# Or add this tap and brew install youruser/hdv/hdv
class Hdv < Formula
  include Language::Python::Virtualenv

  desc "Hierarchical Data Viewer - interactive CSV drill-down for the terminal"
  homepage "https://github.com/acbeers/hdv"
  url "https://github.com/acbeers/hdv/releases/download/v0.2.2/hdv-0.2.2.tar.gz"
  sha256 "71299e3ee0928b4aac750ae70bac1a6b27f80646cc7514e82bb5411016a8f637"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
    man1.install "share/man/man1/hdv.1"
  end

  test do
    assert_match "usage", shell_output("#{bin}/hdv --help")
  end
end
