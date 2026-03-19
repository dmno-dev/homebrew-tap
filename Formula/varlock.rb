
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.6.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "8e94215773d9736f491893b26bab76aac174a46ca9873c0d3aa55913c0282c53"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "8addd01fa17f85c9588bd37451df2486d39ddb10a07d7604f169937110aeee3a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "4f36170ec657d1dbf82839bf043d10e4fac4ef2e0b60020c2176b8c4359ca558"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "33d63c5c48ea08d8fed29409cc060e9c6fa2d24f541e18f70c40d55e2e9f2892"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.6.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
