{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mbf-abstract-core,
  mbf-utility,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mbf_simple_core";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."mbf_simple_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs mbf-abstract-core mbf-utility rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs mbf-abstract-core mbf-utility rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "mbf_simple_core" = substituteSource {
      src = fetchgit {
        name = "mbf_simple_core-source";
        url = "https://github.com/ros2-gbp/move_base_flex-release.git";
        rev = "d2ad09cdd32bfa5035aef7c1eab00863589bf831";
        hash = "sha256-PeyY8WdWCkFkhcUvPGyOqIwL+c4qg5pZslYbTQJ/cUI=";
      };
    };
  });
  meta = {
    description = "\n    This package provides common interfaces for navigation specific robot actions. It contains the SimplePlanner, SimpleController and SimpleRecovery interfaces. The interfaces have to be implemented by the plugins to make them available for Move Base Flex using the mbf_simple_nav navigation implementation. That implementation inherits the mbf_abstract_nav implementation and there is no binding to a map representation.\n  ";
  };
})
