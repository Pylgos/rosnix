{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  autoware-perception-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_simulation_msgs";
  version = "1.12.0-1";
  src = finalAttrs.passthru.sources."autoware_simulation_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedNativeBuildInputs = [ autoware-perception-msgs geometry-msgs rosidl-default-runtime std-msgs unique-identifier-msgs ];
  buildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ autoware-perception-msgs geometry-msgs rosidl-default-runtime std-msgs unique-identifier-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_simulation_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_simulation_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "b6d44bba1d1b1411aaa85d0f561e29f803ad84c9";
        hash = "sha256-PJEOQekUo7yUNofrck3ztynTWQurvl2LRDylwJgvo2E=";
      };
    };
  });
  meta = {
    description = "Autoware simulation messages package.";
  };
})
