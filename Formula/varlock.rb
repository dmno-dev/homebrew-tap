
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.0.14"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "2e3d75c5e563eb72cc40a9231e941d72109c5cd5924ee3ee33be4d794f258fbe"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "dba5cca5f3c24c25bfbbcfbcd2674f7d6b2ff212f746c023832838b0ae9ae52a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "38cbea2dc4821ca6bb04e2fa69bb9d49c39b40cd354cd9577a2933b61041afb1"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "13044822de849e8ec95be79b1359ded6415cec6a539cd29a335e89b5286ce54a"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.0.14", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
