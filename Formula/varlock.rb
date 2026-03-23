
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.6.3"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "77ffd68b227559456d8ef5b5c132355c84c4f32c243dd4259eed75dda476e11a"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "9526c584d592cc0719f2ca01fadbbb8d0c8757cd8abd0405835e745e6422ef84"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "3bdfc5528fb1458bba5b7a39f0af28cb97d25deb961c1a97af591e55fbfc8502"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "6b8f93b28e295aa374c85b686fbf5f782caa09d7301fa3c9df64d2435957a3e2"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.6.3", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
