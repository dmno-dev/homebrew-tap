
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.6.1"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "efc418bcc1e73ad1995d4a13a8c9b24a504718cc088cf40e1bab958b73d0a287"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "45bbd86466c59c4c204ec357044579f63334df2953ac3cc063c29022624beda2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "c64d2c0f210e01d8b882e7a3c1cffb321dcab19db0f27be22dde6cc67e455d86"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "8d96bd40dd8162a3b292118505b3342d828cc3dc09150dc1ee422754c51d75b7"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.6.1", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
