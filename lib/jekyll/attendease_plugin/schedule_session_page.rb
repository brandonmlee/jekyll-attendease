module Jekyll
  module AttendeasePlugin
    class ScheduleSessionPage < Page
      def initialize(site, base, dir, session)
        @site = site
        @base = base
        @dir = dir
        @name = session['slug']

        self.process(@name)

        self.read_yaml(File.join(base, '_attendease', 'templates', 'schedule'), 'session.html')

        schedule_session_page_title = site.config['schedule_session_page_title'] || 'Schedule: %s'
        self.data['title'] = sprintf(schedule_session_page_title, session['name'])

        self.data['session'] = session
      end
    end
  end
end

