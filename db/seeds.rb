# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Admin.create!(:login => "admin", :password => "secret")

service1 = Service.create!(:name => "iptraffic", :title => "Internet access")
service2 = Service.create!(:name => "voip", :title => "Voice over Internet Protocol (VoIP)")

radius_reply1 = RadiusReply.create!(:name => "Acct-Interim-Interval", :description => "This attribute indicates the number of seconds between each interim update in seconds for this specific session")
radius_reply2 = RadiusReply.create!(:name => "Framed-IP-Address", :description => "This attribute indicates the address to be configured for the user")
radius_reply3 = RadiusReply.create!(:name => "Service-Type", :description => "This attribute indicates the type of service the user has requested, or the type of service to be provided")
radius_reply4 = RadiusReply.create!(:name => "Framed-Protocol", :description => "This attribute indicates the framing to be used for framed access")
radius_reply5 = RadiusReply.create!(:name => "Netspire-Framed-Pool", :description => "This attribute indicates the pool of IP addresses that need to use")
radius_reply6 = RadiusReply.create!(:name => "Netspire-Upstream-Speed-Limit", :description => "This attribute indicates the UpStream speed limit")
radius_reply7 = RadiusReply.create!(:name => "Netspire-Downstream-Speed-Limit", :description => "This attribute indicates the DownStream speed limit")
radius_reply8 = RadiusReply.create!(:name => "Netspire-Allowed-NAS", :description => "This attribute indicates the NAS identifier to which the user may connect")

a1 = Account.create!(:contract => "1111111111111", :login => "michelle", :password => "secret")
a1.deposit(3000)

a2 = Account.create!(:contract => "2222222222222", :login => "tricia", :password => "secret")
a2.deposit(7000)

a3 = Account.create!(:contract => "3333333333333", :login => "joel", :password => "secret")
a3.deposit(2500)

radius_reply_group1 = RadiusReplyGroup.create(:name => "Default")
radius_reply_group2 = RadiusReplyGroup.create(:name => "Alternate")

plan1 = Plan.create!(:name => "Awesome Ultimate", :code => "Ultimate")
plan2 = Plan.create!(:name => "Nightly Geek", :code => "Nightly")
plan3 = Plan.create!(:name => "Till Daylight Dies", :code => "Daylight")
