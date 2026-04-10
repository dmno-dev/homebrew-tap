
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.7.3"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "619d7bb4f7e0ef59076fc43e1c118c168ce15136675b8b9bf6fb5546353ddf0a"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "75e0d0400923016eeca6da0806d44442914cbd5802fefc36506c18b2f6fd8caa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "51d2bb0c37f806edb693f6ba3d757ecb8e2f13fbd485700320e04bba9990be2d"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "e3169a62be0dc3bc805daf32478e498679fe490f4e4dd5c9c377076c5dc15515"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.7.3", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
