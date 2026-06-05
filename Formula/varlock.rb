
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.5.1"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "8332ed5d8e04bcb93d48e2e25df5446db6307c68d94ec01282e5259a33e2e73e"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "35abbc408bf68dfe8980e794da5558bb3e504b174f54f2a0754a594057ee7d7d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "b3f550b749648138626a744e28364a1ca439ab7485e2a30db9a3f0c0fae261e6"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "8f6b6dc9b6efc06292b77450b7f710e93de19a72f7d4e9222eddc2ddcbc91c6a"
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
    assert_equal "1.5.1", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
