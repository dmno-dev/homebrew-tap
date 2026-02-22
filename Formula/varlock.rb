
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.2.3"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "67753411204a429691f49b98da6b76ee2bda10ed9fe8b73a24e7ace04453069c"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "b34d6d09c8924fee7fd07089496979d655a5920f0dacdbb01984c3808e12f7ca"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "b7a6cb07507105cac70e847adbf8fbe462f3a91f5376f564458e5c0d77bf0f96"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "0ec5d782dd0254f511aed3a2a7a3403a14d0bab4ed8947c35b29bc1d3543cbe9"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.2.3", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
