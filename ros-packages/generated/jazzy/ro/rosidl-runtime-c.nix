{
  ament-cmake,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  performance-test-fixture,
  rcutils,
  rosSystemPackages,
  rosidl-typesupport-interface,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_runtime_c";
  version = "4.6.4-1";
  src = finalAttrs.passthru.sources."rosidl_runtime_c";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rcutils rosidl-typesupport-interface ];
  checkInputs = [ ament-lint-auto ament-lint-common performance-test-fixture ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosidl_runtime_c" = substituteSource {
        src = fetchgit {
          name = "rosidl_runtime_c-source";
          url = "https://github.com/ros2-gbp/rosidl-release.git";
          rev = "d20e814fe2e038b50aa6e754fc19da126df8c7e4";
          hash = "sha256-MoUipm0J/605NCNGEqWREPTHLjuJ6Q8xJBWiO6LpuUA=";
        };
      };
    });
  };
  meta = {
    description = "Provides definitions, initialization and finalization functions, and macros for getting and working with rosidl typesupport types in C.";
  };
})
