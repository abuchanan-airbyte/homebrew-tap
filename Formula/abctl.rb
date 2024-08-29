class Abctl < Formula
  ABCTL_VERSION = "v0.0.19".freeze

  desc "Abuchanan's test for abctl"
  homepage "https://github.com/abuchanan-airbyte/abctl"
  url "https://github.com/abuchanan-airbyte/abctl.git",
      tag: ABCTL_VERSION

  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = ABCTL_VERSION
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_equal "version: #{ABCTL_VERSION}", shell_output("#{bin}/abctl version").lines[0].strip
  end
end
