require 'chef/resource'

class Chef::Resource::OsxDefaults < Chef::Resource
  def initialize(domain, key, run_context = nil)
    @comment = "Set #{domain.split('.').last} #{key}"
    super("#{@comment}", run_context)

    if run_context
      @user = run_context.node[:osx_prefs][:user]
    else
      @user = nil
    end

    @domain = domain
    @key = key
    @type = nil
    @value = nil

    @resource_name = :osx_defaults
    @action = "write"
    @allowed_actions.push(:write, :delete)
  end

  def user(arg = nil)
    set_or_return(:user, arg, :kind_of => [String])
  end

  def domain(arg = nil)
    set_or_return(:domain, arg, :kind_of => [String])
  end

  def key(arg = nil)
    set_or_return(:key, arg, :kind_of => [String])
  end

  def type(arg = nil)
    set_or_return(:type, arg, :kind_of => [String])
  end

  def value(arg = nil)
    set_or_return(:value, arg, {})
  end
end


require 'chef/provider'

class Chef::Provider::OsxDefaults < Chef::Provider
  def self.decoders
    @decoders ||= {}
  end

  def self.encoders
    @encoders ||= {}
  end

  def self.decoder(type, &block)
    decoders[type.to_s] = block
  end

  def self.encoder(type, &block)
    encoders[type.to_s] = block
  end

  decoder :boolean do |value|
    case value
    when '1', 'YES'
      true
    when '0', 'NO'
      false
    else
      nil
    end
  end

  encoder :boolean do |obj|
    case obj
    when TrueClass
      'YES'
    when FalseClass
      'NO'
    else
      nil
    end
  end

  decoder :string do |value|
    value
  end

  encoder :string do |obj|
    if obj.respond_to?(:to_str)
      obj
    else
      nil
    end
  end

  decoder :integer do |value|
    value.to_i
  end

  encoder :integer do |obj|
    if obj.respond_to?(:to_int)
      obj
    else
      nil
    end
  end

  decoder :float do |value|
    value.to_f
  end

  encoder :float do |obj|
    if obj.respond_to?(:to_float)
      obj
    else
      nil
    end
  end


  include Chef::Mixin::Command

  def load_current_resource
    domain = new_resource.domain
    key    = new_resource.key

    @current_resource = Chef::Resource::OsxDefaults.new(domain, key, @run_context)

    status, stdout, stderr = output_of_command("defaults read-type '#{domain}' '#{key}'", {:user => @current_resource.user})
    if status == 0 && stdout =~ /Type is (\w+)/
      @current_resource.type($1)
    end

    if @new_resource.type.nil?
      @new_resource.type(@current_resource.type)
    end

    status, stdout, stderr = output_of_command("defaults read '#{domain}' '#{key}'", {:user => @current_resource.user})
    if status == 0
      value = decode(@current_resource.type, stdout)
      @current_resource.value(value)
    end

    @current_resource
  end

  def action_write
    if @current_resource.type == @new_resource.type &&
        @current_resource.value == @new_resource.value
      Chef::Log.debug "Skipping #{@new_resource} since the value is already set"
    elsif @new_resource.value.nil?
      action_delete
    else
      if write_key(@new_resource)
        @new_resource.updated_by_last_action true
        Chef::Log.info("Ran #{@new_resource} successfully")
      end
    end
  end

  def action_delete
    if @current_resource.value
      if delete_key(@new_resource)
        @new_resource.updated_by_last_action true
        Chef::Log.info("Ran #{@new_resource} successfully")
      end
    end
  end

  def write_key(resource)
    if resource.type.nil?
      resource.type(guess_type(resource.value))
    end

    domain = resource.domain
    key    = resource.key
    type   = resource.type
    value  = encode(type, resource.value)

    command = "defaults write '#{domain}' '#{key}' -'#{type}' '#{value}'"

    run_command(
      :command        => command,
      :command_string => resource.to_s,
      :user           => resource.user
    )
  end

  def delete_key(resource)
    domain  = resource.domain
    key     = resource.key
    command = "defaults delete '#{domain}' '#{key}'"

    run_command(
      :command        => command,
      :command_string => resource.to_s,
      :user           => resource.user
    )
  end

private

  def decode(type, value)
    if decoder = self.class.decoders[type]
      decoder.call(value)
    else
      raise "Unknown decoder for #{type}: #{value.inspect}"
    end
  end

  def encode(type, obj)
    if encoder = self.class.encoders[type]
      encoder.call(obj)
    else
      raise "Unknown encoder for #{type}: #{obj.inspect}"
    end
  end

  def guess_type(obj)
    Chef::Log.debug "Guessing defaults type for #{obj.inspect}"
    self.class.encoders.each do |type, encoder|
      if encoder.call(obj)
        return type
      end
    end

    raise "Could not guess type of #{obj.inspect}"
  end
end
