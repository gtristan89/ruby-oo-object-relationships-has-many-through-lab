
class Doctor
    attr_accessor :name, :patient
    @@all = []

    def initialize(name)
        @name = name
        @appointments = []
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(date, patient)
        appointment = Appointment.new(date, patient, self)
        @appointments << appointment
        appointment
    end

    def appointments
        Appointment.all {|appointment| self.appointment = self}
    end

    def patients
        @appointments.collect do |appointment|
            appointment.patient
        end
    end
end