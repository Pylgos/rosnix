{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "udp_msgs";
  version = "0.0.5-2";
  src = finalAttrs.passthru.sources."udp_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "udp_msgs" = substituteSource {
      src = fetchgit {
        name = "udp_msgs-source";
        url = "https://github.com/ros2-gbp/udp_msgs-release.git";
        rev = "25a96f50eb52af73245fe244e605bcb080f4e099";
        hash = "sha256-wk0E8P+RhBD3LVdBSrcJHrF2CwKgOXysrKAiCDRiSPI=";
      };
    };
  });
  meta = {
    description = "ROS / ROS2 udp_msgs package";
  };
})
