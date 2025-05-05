{
  action-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dynamixel_interfaces";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."dynamixel_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_interfaces" = substituteSource {
      src = fetchgit {
        name = "dynamixel_interfaces-source";
        url = "https://github.com/ros2-gbp/dynamixel_interfaces-release.git";
        rev = "993ae858ed55c26659b9200b663e3e056bf66c3c";
        hash = "sha256-kvd2J3AaYf6CIqevFWcVFiRVZ4+1tYNj1+88yamkAFc=";
      };
    };
  });
  meta = {
    description = "\n    dynamixel_interfaces contains base messages and service useful for controlling Dynamixel.\n  ";
  };
})
