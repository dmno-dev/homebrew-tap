
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.23.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "740cc6e389653c1d2fd1e5a0f0048f5283bd204253921f48960fc9e96f34872a"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "7d14daeb9d749b24355280954a9c1b7087533855296b3ac44df6c46ba7d582bc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "a40d86ceddde2f032cd8bdc594feca74f60754d01615c1a11031c9f4ca97e8ed"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "7b574b420a6ae024f3cc63b944d5586ee5bdeb0e69e4945bc3e10c688d1f26a4"
    end
  end

  def install
    bin.install "varlock"

    on_macos do
      libexec.install "VarlockEnclave.app"
    end

    on_linux do
      libexec.install "varlock-local-encrypt"
    end
  end

  test do
    assert_equal "1.23.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
