# Homebrew formula for HDV (Hierarchical Data Viewer)
# To use: brew install path/to/Formula/hdv.rb
# Or add this tap and brew install youruser/hdv/hdv
class Hdv < Formula
  desc "Hierarchical Data Viewer - interactive CSV drill-down for the terminal"
  homepage "https://github.com/acbeers/hdv"
  url "https://github.com/acbeers/hdv/releases/download/v0.1.0/hdv-0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  depends_on "python@3.13"

  def install
    venv = virtualenv_create(libexec, "python3.13")
    venv.pip_install buildpath
    bin.install_symlink libexec/"bin/hdv"
    man1.install "share/man/man1/hdv.1"
  end

  test do
    assert_match "usage", shell_output("#{bin}/hdv --help")
  end
end
