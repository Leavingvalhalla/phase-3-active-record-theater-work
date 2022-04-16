class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map {|audition| audition.actor}
    end

    def locations
        self.auditions.map {|audition| audition.location}
    end

    def lead
        lead = self.auditions.find {|audition| audition.hired == true}
        return lead if lead != nil
        'no actor has been hired for this role'
    end

    def understudy
        actors = self.auditions.filter {|audition| audition.hired == true}
        return actors[1] if actors.length > 1
        'no actor has been hired for understudy for this role'
    end

end