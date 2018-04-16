#
# Cookbook Name:: shadowsocks_ng
# Library:: default
#
# License: MIT
#

include Chef::Mixin::ShellOut

class Chef
  #
  # Base helpers to cleanup recipe logic.
  #
  class Recipe
    #
    # Determine whether the Ohai detected python satisfies specified version requirement.
    #
    # @return [Boolean]
    #
    def min_python_version(version)
      Gem::Version.new(version) <= Gem::Version.new(node['languages']['python']['version'])
    end
  end
end
