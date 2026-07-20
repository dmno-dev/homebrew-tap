
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.12.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "48a9c93a767c6c171127bb897b96e3eed6f6bf6d9f058e9a10f3a94b62374875"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "6574dc11ee0bd4adcad7de8b515fba85d1a8e2a776a8a3e13d0f655896252a68"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "779cbaed0d2310b639d29a45c42d098edb7a300a5c94e6950211451ea651b8d4"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "cbcbc989dfedce1b577ffc662b1356ed6d3a9e448e7100d8ba596a953fd1a91d"
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
    assert_equal "1.12.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
