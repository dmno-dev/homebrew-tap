
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.1.3"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "a73afb2714c3bd0c64e4eebb1f9f1489f9734d203c90228b0f47156b97f7f5b7"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "d63742484df1a5a3bf7d9417de3694181745fd880005a1fb607df204b1d59a97"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "eade72dcceb9e0b08566b6433cc95adb5962ff5492578cdd052ea087e44f022d"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "85e47ea3f20b23b4784b54a79eb97ef024bce85104838c4720c2a41875d71e05"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.1.3", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
