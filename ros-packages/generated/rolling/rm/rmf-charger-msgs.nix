{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_charger_msgs";
  version = "3.5.0-1";
  src = finalAttrs.passthru.sources."rmf_charger_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_charger_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_charger_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "a4e4ed6822b2bed006f86e05a826fab5ec8c6e17";
        hash = "sha256-NVCUlOYzS+6HbJYdj4RT22rGNrPLXIM8+xE73YQYC2w=";
      };
    };
  });
  meta = {
    description = "This package contains messages regarding charging and discharging";
  };
})
