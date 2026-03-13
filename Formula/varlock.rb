
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.4.2"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "50f1136733e9f5745d214f8b39e8d55cae54c67c17c2b0d49ecbbbfc73096157"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "76bacf48760780920c3778a754249093faa3091a308055e26094338713847d13"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "b0ffdd3b3e10f6ce859a7183a3a54899464d49b65954cb4f39f9375b172fad06"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "736f4f58bef1a97eab7e30a6c09fd8e3401ed91d105bfa2db74be4b64f574535"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.4.2", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
