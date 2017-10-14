class HomebrewUpdateNotifier < Formula
  homepage "https://github.com/vjt/homebrew-update-notifier"
  url "https://github.com/vjt/homebrew-update-notifier/archive/2.0.0.tar.gz"
  version "2.0.0"
  sha256 "9b0804e3f55a2baa2ed8a5c66c289fec86759b35594947789fbf12a3b424b580"

  depends_on "terminal-notifier"

  def install
    bin.install "homebrew-update-notifier"
  end

  def plist; <<-EOS.undent
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>EnableGlobbing</key>
          <false/>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>ProgramArguments</key>
          <array>
            <string>/bin/bash</string>
            <string>#{HOMEBREW_PREFIX}/bin/homebrew-update-notifier</string>
          </array>
          <key>StandardErrorPath</key>
          <string>#{var}/log/homebrew-update-notifier.log</string>
          <key>StandardOutPath</key>
          <string>#{var}/log/homebrew-update-notifier.log</string>
          <key>RunAtLoad</key>
          <true/>
          <key>StartCalendarInterval</key>
          <array>
              <dict>
                  <key>Hour</key>
                  <integer>12</integer>
                  <key>Minute</key>
                  <integer>0</integer>
              </dict>
              <dict>
                  <key>Hour</key>
                  <integer>22</integer>
                  <key>Minute</key>
                  <integer>0</integer>
              </dict>
          </array>
        </dict>
      </plist>
      EOS
  end
end
