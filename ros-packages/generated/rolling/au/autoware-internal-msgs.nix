{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  autoware-internal-debug-msgs,
  autoware-internal-metric-msgs,
  autoware-internal-perception-msgs,
  autoware-internal-planning-msgs,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_internal_msgs";
  version = "1.8.1-2";
  src = finalAttrs.passthru.sources."autoware_internal_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ autoware-internal-debug-msgs autoware-internal-metric-msgs autoware-internal-perception-msgs autoware-internal-planning-msgs builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_internal_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_internal_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_internal_msgs-release.git";
        rev = "694d31707edf0cf5ed18ad67ecf53a1e1da0760f";
        hash = "sha256-PmB5+uoUi6ukBURoxrF+B5WjPJWl81T4spanWtIxY0s=";
      };
    };
  });
  meta = {
    description = "Autoware internal messages package.";
  };
})
