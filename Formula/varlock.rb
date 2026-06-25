
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.9.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "56472fb2bb38cf77154932e81dec70fccb29dc46513da5a3a4b7ec1e43c30ca6"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "3c602e351022b0c4557b35c6c7d20182ce857dbfa2400e20ef129b3dddb902d8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "11b9f072222f474493d0b89b79406c0210000950e142dc4cef1a43578e2f83f2"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "babf75d078d46538c46c4ef2e9ab647d508eed7b3d4ef4eb43a7871dbb7e8304"
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
    assert_equal "1.9.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
