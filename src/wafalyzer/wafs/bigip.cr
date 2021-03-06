module Wafalyzer
  class Waf::BigIP < Waf
    register product: "BIG-IP (F5 Networks)"

    PATTERN =
      Regex.union(
        /\ATS\w{4,}=/i,
        /bigipserver(.i)?|bigipserverinternal/i,
        /\AF5\Z/i,
        /^TS[a-zA-Z0-9]{3,8}=/i,
        /BigIP|BIG-IP|BIGIP/,
        /bigipserver/i,
      )

    builder do
      matches_header %w(Server Set-Cookie Cookie), PATTERN
    end
  end
end
