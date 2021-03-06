class ManageIQ::Providers::AnsibleTower::Inventory::Persister < ManagerRefresh::Inventory::Persister
  require_nested :AutomationManager
  require_nested :ConfigurationScriptSource

  attr_reader :collector

  # @param manager [ManageIQ::Providers::BaseManager] A manager object
  # @param target [Object] A refresh Target object
  # @param collector [ManagerRefresh::Inventory::Collector] A Collector object
  def initialize(manager, target = nil, collector = nil)
    @manager   = manager
    @target    = target
    @collector = collector

    @collections = {}

    initialize_inventory_collections
  end

  # Shared properties for inventory collections
  def shared_options
    {
      :parent => manager.presence
    }
  end
end
