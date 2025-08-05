
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.0.8"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "576f0feac429aee6db47d752943fbd5de512a766b383bed372f4ce7eeec9b8d8"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "f9246b08da97dd2e4ac509f8f9afbc36f5b5e256b34abc3239a49741940c009f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "6a5eee375bfb7237bd2a309657599b72a7c35fbd73df95fbc06ab24112b5acad"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "d62fe049fca497f15acf6c54e3afdcf7815121811468f142b60a70192a989ed5"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.0.8", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
