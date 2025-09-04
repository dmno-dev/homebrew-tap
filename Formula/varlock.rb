
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.0.12"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "14d496ea3172bd0fa3c8344a7d194950e6ce466db1397da3d2c2b8ee89753c47"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "fabe6e07e444c3dc02726a900f8accaaebc3997c1325c594efa6c9a58ad059f7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "6b81695a7f497b32377123400c23fc4e80734a598bc2f76b0b44a783e1e7c1c2"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "ea69b40e30b73f0e21f691c6057ac3655dd4b3c0abf542caf942923897e9b8c6"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.0.12", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
