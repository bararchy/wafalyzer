module Wafalyzer
  class Waf::ShadowDaemon < Waf
    register product: "Shadow Daemon Opensource (WAF)"

    PATTERN =
      Regex.union(
        /<h\d>\d{3}.forbidden<.h\d>/i,
        /request.forbidden.by.administrative.rules./i,
      )

    builder do
      valid_status :forbidden
      matches_body PATTERN
    end
  end
end
