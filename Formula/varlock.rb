
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.0.4"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "a24be7ed5df7564e6a54d4c49ec3dadfdf8251b35bf6b3eb69ef02f6a79d6b35"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "7dfe3c2e81ef701494b3b16b460ba9cc8d3a7041765b1fde16acf085e40eebee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "2a4464bea4f1313da356ad164c8f83ec57d1aec8ffa5bd60b85f9ac56f06636b"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "17532c79b94b8d1adcd2082c66e9a0927e6688ec5d3c544cef2b46d60c2d8876"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    system bin/"varlock", "--post-install", "brew"
  end
end
