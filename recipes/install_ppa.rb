apt_repository "keepalived" do
  uri "http://ppa.launchpad.net/keepalived/stable/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "7C33BDC6"
end

 # needed because of "epoch" in default Package and launchpad can't build with epoch
 # https://bugs.launchpad.net/ubuntu/+source/bzr-builder/+bug/613942
apt_preference 'pin-keepalived-ppa' do
  glob         '*'
  pin          'release o=LP-PPA-keepalived-stable'
  pin_priority '1001'
end


package "keepalived"