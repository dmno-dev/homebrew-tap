
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.0.5"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "f96b1d67ed44c88d32a10ba7a72b7ec89101897be076788332e9294ace99ba0b"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "a7904e45f5708f4af6686c3da92752458efa36e1499ecbc451286be5675fd366"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "2def714e06857adba5ffaaddfc5144dcc27bcbda9c5d957ec42382c973c83aaf"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "4799b6152d05a9faf575d3940453337cc5ea89f287aa857738f8c1ab6a0b00a7"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.0.5", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
