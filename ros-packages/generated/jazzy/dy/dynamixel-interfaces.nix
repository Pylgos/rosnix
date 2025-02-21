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
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."dynamixel_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_interfaces" = substituteSource {
      src = fetchgit {
        name = "dynamixel_interfaces-source";
        url = "https://github.com/ros2-gbp/dynamixel_interfaces-release.git";
        rev = "bc26973382154a9e4b5aa712fdf3cc4310a327a3";
        hash = "sha256-mPmHHE0GKBq0QTY0XAEeMjJGMfZUaTp/s3LoAwtEAXA=";
      };
    };
  });
  meta = {
    description = "dynamixel_interfaces contains base messages and service useful for controlling Dynamixel.";
  };
})
