class Server
  include Mongoid::Document
  field :name, type: String
  field :token, type: String
  field :shutdown_on_high_load, type: Boolean
  field :cpu_usage, type: BigDecimal
  field :memory_usage, type: BigDecimal
  field :disk_usage, type: BigDecimal
  field :processes, type: Array

  include Mongoid::Timestamps

  validates :name, presence: true

  before_create :generate_token

  HIGH_CPU_USAGE = 90
  HIGH_MEMORY_USAGE = 90
  HIGH_DISK_USAGE = 90

  scope :high_cpu_usage, -> { where(:cpu_usage.gte => HIGH_CPU_USAGE) }
  scope :high_memory_usage, -> { where(:memory_usage.gte => HIGH_MEMORY_USAGE) }
  scope :high_disk_usage, -> { where(:disk_usage.gte => HIGH_DISK_USAGE) }

  def high_cpu_usage?
    self.cpu_usage && self.cpu_usage >= HIGH_CPU_USAGE
  end

  def high_memory_usage?
    self.memory_usage && self.memory_usage >= HIGH_MEMORY_USAGE
  end

  def high_disk_usage?
    self.disk_usage && self.disk_usage >= HIGH_DISK_USAGE
  end

  def high_resources_usage?
    self.high_cpu_usage? || self.high_memory_usage? || self.high_disk_usage?
  end

  def force_shutdown?
    self.shutdown_on_high_load && self.high_cpu_usage?
  end

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless self.class.where(token: random_token).exists?
    end
  end
end
