require 'acts_as_readonlyable'

ActiveRecord::Base.send(:include, ActiveRecord::Acts::ActsAsReadonlyable)
class << ActiveRecord::Base

  def read_only_inherited(child)
    child.acts_as_readonlyable :read_only
    ar_inherited(child)
  end

  alias_method :ar_inherited, :inherited
  alias_method :inherited, :read_only_inherited

end

