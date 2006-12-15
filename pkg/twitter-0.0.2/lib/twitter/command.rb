# The command class is used for the command line interface. 
# It is only used and included in the bin/twitter file.
require 'yaml'

module Twitter
  class Command
    @@commands  = [:post, :timeline, :friends, :friend, :followers, :follower]
    
    @@template  = <<EOF
# .twitter
# 
# Please fill in fields like this:
#
#  email: bla@bla.com
#  password: secret
#
email: 
password: 
EOF

    class << self
      def process(args)
        command = args.shift

        case command
        when "post"       then Command.post(args)
        when "timeline"   then Command.timeline(args)
        when "friends"    then Command.friends
        when "friend"     then Command.friend(args)
        when "followers"  then Command.followers
        when "follower"   then Command.follower(args)
        else
          puts "\nUsage: twitter <command> [options]\n\nAvailable Commands:"
          Twitter::Command.commands.each do |com|
            puts "    - #{com}"
          end
        end
      end
      
      def commands
        @@commands
      end
      
      # Posts an updated status to twitter
      def post(args)
        config = create_or_find_config
        
        if args.size == 0
          puts %(\n  You didn't enter a message to post.\n\n  Usage: twitter post "You're fabulous message"\n)
          exit(0)
        end
        
        post = args.shift
        
        begin
          status = Twitter::Base.new(config['email'], config['password']).post(post)
          puts "\nGot it! New twitter created at: #{status.created_at}\n"
        rescue
          puts "\nTwitter what?. Something went wrong and your status could not be updated.\n"
        end
      end
      
      # Shows status, time and user for the specified timeline
      def timeline(args)
        config = create_or_find_config
        
        timeline = :friends
        timeline = args.shift.intern if args.size > 0 && Twitter::Base.timelines.include?(args[0].intern)
        
        begin
          puts
          Twitter::Base.new(config['email'], config['password']).timeline(timeline).each do |s|
            puts "#{s.text}\n-- #{s.relative_created_at} by #{s.user.name}"
            puts
          end
        rescue
          puts error_msg
        end
      end
      
      def friends
        config = create_or_find_config
        
        begin
          puts
          Twitter::Base.new(config['email'], config['password']).friends.each do |u|
            puts "#{u.name} (#{u.screen_name}) last updated #{u.status.relative_created_at}\n-- #{u.status.text}"
            puts
          end
        rescue
          puts error_msg
        end
      end
      
      # Shows last updated status and time for a friend
      # Needs a screen name
      def friend(args)
        config = create_or_find_config
        
        if args.size == 0
          puts %(\n  You forgot to enter a screen name.\n\n  Usage: twitter friend jnunemaker\n)
          exit(0)
        end
        
        screen_name = args.shift
                
        begin
          puts
          found = false
          Twitter::Base.new(config['email'], config['password']).friends.each do |u|
            if u.screen_name == screen_name
              puts "#{u.name} last updated #{u.status.relative_created_at}\n-- #{u.status.text}"
              found = true
            end
          end
          
          unless found
            puts "Sorry couldn't find a friend of yours with #{screen_name} as a screen name"
          end
          puts
        rescue
          puts error_msg
        end
      end
      
      # Shows all followers and their last updated status
      def followers
        config = create_or_find_config
        
        begin
          puts
          Twitter::Base.new(config['email'], config['password']).followers.each do |u|
            puts "#{u.name} last updated #{u.status.relative_created_at}\n-- #{u.status.text}"
            puts
          end
        rescue
          puts error_msg
        end
      end
      
      # Shows last updated status and time for a follower
      # Needs a screen name
      def follower(args)
        config = create_or_find_config
        
        if args.size == 0
          puts %(\n  You forgot to enter a screen name.\n\n  Usage: twitter follower jnunemaker\n)
          exit(0)
        end
        
        screen_name = args.shift
        
        begin
          puts
          found = false
          Twitter::Base.new(config['email'], config['password']).follower.each do |u|
            if u.screen_name == screen_name
              puts "#{u.name} (#{u.screen_name}) last updated #{u.status.relative_created_at}\n-- #{u.status.text}"
              found = true
            end
          end
          
          unless found
            puts "Sorry couldn't find a follower of yours with #{screen_name} as a screen name"
          end
          puts
        rescue
          puts error_msg
        end
      end
      
      private
        # Checks for the config, creates it if not found
        def create_or_find_config
          begin
            config = YAML::load open(ENV['HOME'] + "/.twitter")
          rescue
            open(ENV["HOME"] + '/.twitter','w').write(@@template)
            config = YAML::load open(ENV['HOME'] + "/.twitter")
          end
          
          if config['email'] == nil or config['password'] == nil
            puts "Please edit ~/.twitter to include your twitter email and password\nTextmate users: mate ~/.twitter"
            exit(0)
          end
          
          config
        end
        
        def error_msg
          "\nTwitter what?. Something went wrong and your status could not be updated.\n"
        end
    end
  end
end