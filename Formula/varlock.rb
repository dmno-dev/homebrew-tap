
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "@varlock/nextjs-integration@0.0.4"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "37a8ba0ac3887888f19dff47ef00e4e01eeedc6dd6c3ffaa08a94372bf4dfdb4"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "bb9b57b83dacbdee8dd799e33173b8797e5a8a9da6d98617bbdb70d54c599d7f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "bcda16d4636187ece232b6f46ef83f003821b009ee57b3115d66456a3a8f7fe8"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "49bac221063898546d2071c0b9fb181f24f742d0b5c1f92e379d52129ff458c6"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "@varlock/nextjs-integration@0.0.4", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
