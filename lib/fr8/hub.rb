module Fr8
  # TODO: Document
  class Hub < PropertyInitializer
    attr_accessor :hub_url, :terminal_id, :terminal_secret, :container_id,
                  :user_id

    def initialize(
      hub_url:, terminal_id:, terminal_secret:, container_id:, user_id:
    )
      super(method(__method__).parameters)
    end
  end
end
