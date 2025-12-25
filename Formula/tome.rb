class Tome < Formula
  desc "AI Agent Skill Manager - Your spellbook for AI agent capabilities"
  homepage "https://github.com/kennyg/tome"
  url "https://github.com/kennyg/tome/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "5febe7e6a44bb4015e96731f9d7c45401f74b18b2747a6785ee2033f96ee5081"
  license "MIT"
  head "https://github.com/kennyg/tome.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/kennyg/tome/cmd.Version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tome edition")
  end
end
