
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.8.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "fd9b42b8041a675eeea68e9d099c6b02ecb0d7214d71276dc09bbea3d75fee53"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "2aeb5ab5a02114d24286d1b5447669a622360ff267fac2adc5fcb64911e916bc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "351b1aca2e27a078450d46d097c86913be09efaa0965888e29f786ad12a34a85"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "4a42edbb158cd9e1c7e7316bf00c51057f64d2289e97bc4cab4c0ea55e4718d3"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.8.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
