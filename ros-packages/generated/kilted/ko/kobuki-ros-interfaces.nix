{
  action-msgs,
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
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
  pname = "kobuki_ros_interfaces";
  version = "1.0.0-5";
  src = finalAttrs.passthru.sources."kobuki_ros_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "kobuki_ros_interfaces" = substituteSource {
      src = fetchgit {
        name = "kobuki_ros_interfaces-source";
        url = "https://github.com/ros2-gbp/kobuki_ros_interfaces-release.git";
        rev = "6942bb3ec9d3c423348db2034496a783c6d4a9bc";
        hash = "sha256-svbQG6e1o4u1HncdcNcx55XoYK99I02G7CxL2jvBZhs=";
      };
    };
  });
  meta = {
    description = "\n    ";
  };
})
