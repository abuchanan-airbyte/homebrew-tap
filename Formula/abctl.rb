class Abctl < Formula
  desc "Abuchanan's test for abctl"
  homepage "https://github.com/abuchanan-airbyte/abctl"
  url "https://github.com/abuchanan-airbyte/abctl.git",
      tag:      "v0.0.1",
      revision: "ac0c60ad91df6dacd1a7fbc4d6364efaf9a7b409"

  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["ABCTL_VERSION"] = "v0.0.1"
    system "make", "build"
    bin.install "build/abctl"
  end

  test do
    assert_match "version: v0.0.1", shell_output("#{bin}/abctl version").strip
  end
end
