
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.4.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "e6abf0d97da8ff7c98b0e9044a8b71f48fbf74a0d7bfc2543a81575a07b7a03b"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "228e4c2666b9fa50a83a8713a848e7a0f0044d7fd7c9d441d43e6ebccad2f4a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "820295b271cece2679b2b9701b5285ce39354fc2f35797365fa36c70125f51ab"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "e830baaa901b6389ecf281bdd2449bfaf7586e91fd3a7a038ec06f78e6fa92f8"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.4.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
