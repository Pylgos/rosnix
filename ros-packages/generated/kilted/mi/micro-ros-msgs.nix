{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
  pname = "micro_ros_msgs";
  version = "1.0.0-5";
  src = finalAttrs.passthru.sources."micro_ros_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "micro_ros_msgs" = substituteSource {
      src = fetchgit {
        name = "micro_ros_msgs-source";
        url = "https://github.com/ros2-gbp/micro_ros_msgs-release.git";
        rev = "fab66a30ffbffcb90ef7333b9e4e1d741f82b1fe";
        hash = "sha256-kuDv7e3C0BCXolx6ePv0TLEpK9E3OfLGFAh0K/9Wb8o=";
      };
    };
  });
  meta = {
    description = "Definitions for the ROS 2 msgs entities information used by micro-ROS to leverage its functionality to the same level as ROS 2, by means of a dedicated graph manager";
  };
})
