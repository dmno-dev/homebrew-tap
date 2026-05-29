
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.4.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "fc035ede8f0e5411f0f3b2859f7c8d9441371b9f3f3c85357d6f80bd838bd257"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "4b1fa17672d564b49aba85bd5312a6edbcc5c4acc5403f52d001a56c6b574f0d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "ef1bec32906a046a6c61a0fba0aecd619cf5008524c378b9d3874cc4bcb09dc8"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "3ad32b2de93792633a61802aff4b58bea6c6db3e988383d7caa58c2df5702bdc"
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
    assert_equal "1.4.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
