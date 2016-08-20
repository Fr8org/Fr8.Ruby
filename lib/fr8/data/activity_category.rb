# frozen_string_literal: true
module Fr8
  module Data
    # TODO: Describe this class
    class ActivityCategory
      MONITORS = 'Monitors' # 1
      RECEIVERS = 'Receivers' # 2
      PROCESSORS = 'Processors' # 3
      SHIP_DATA = 'Ship Data' # 4
      SOLUTION = 'Solution' # 5
    end

    ACTIVITY_CATEGORIES = {
      MONITORS: ActivityCategoryDTO.new(
        name: 'Monitor',
        icon_path: '/Content/icons/monitor-icon-64x64.png'
      ),
      RECEIVERS: ActivityCategoryDTO.new(
        name: 'Get',
        icon_path: '/Content/icons/get-icon-64x64.png'
      ),
      PROCESSORS: ActivityCategoryDTO.new(
        name: 'Process',
        icon_path: '/Content/icons/process-icon-64x64.png'
      ),
      SHIP_DATA: ActivityCategoryDTO.new(
        name: 'Ship Data',
        icon_path: '/Content/icons/forward-icon-64x64.png'
      ),
      SOLUTION: ActivityCategoryDTO.new(name: 'Solution')
    }.freeze
  end
end
