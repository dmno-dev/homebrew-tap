
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.7.1"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "8dab2ffcd1143ee0c030e5158f41abf636631097b7b28c8f2cb86e615419ed6d"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "c4dba671d2701876cd270b174326e327524b13769ef531a9746ed5f1e72d02fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "f13ee7d64f638d8cc34a341ee856cc7547442cde026ac01dc2747e93d495844b"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "2a8e8d474d2e7c803136538e28bf09eb38d96b7fac4a312f1a38f49d4f040c65"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.7.1", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
