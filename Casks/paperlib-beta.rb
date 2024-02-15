cask "paperlib-beta" do
  version "3.0.0-beta.5"
  sha256 :no_check

  arch arm: "arm", intel: "x86-64"
  channel = on_arch_conditional arm: "arm_dev_channel", intel: "dev_channel"

  url "https://paperlib.app/distribution/#{channel}/Paperlib%20Beta_#{version}.dmg",
      verified: "paperlib.app/distribution/#{channel}"
  name "Paperlib Beta"
  desc "A simple academic paper management tool. (Beta version)"
  homepage "https://paperlib.app/en/"

  livecheck do
    url "https://paperlib.app/distribution/#{channel}/beta-mac.yml"
    strategy :electron_builder
  end

  app "Paperlib Beta.app"

  uninstall quit: "dev.beta.paperlib.app"

  zap trash: [
    "~/Library/Application Support/paperlib-beta/",
    "~/Library/Application Support/Caches/paperlib-beta-updater/",
  ]
end
