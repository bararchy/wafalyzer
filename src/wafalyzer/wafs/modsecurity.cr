module Wafalyzer
  class Waf::ModSecurity < Waf
    register product: "Open Source Web Application Firewall (ModSecurity)"

    PATTERN =
      Regex.union(
        /ModSecurity|NYOB/i,
        /mod_security/i,
        /this.error.was.generated.by.mod.security/i,
        /web.server at/i,
        /page.you.are.(accessing|trying)?.(to|is)?.(access)?.(is|to)?.(restricted)?/i,
        /blocked.by.mod.security/i,
      )

    builder do
      matches_body PATTERN
    end
  end
end
