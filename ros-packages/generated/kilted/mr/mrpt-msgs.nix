{
  ament-cmake,
  ament-cppcheck,
  ament-cpplint,
  ament-lint-auto,
  ament-lint-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_msgs";
  version = "0.6.0-1";
  src = finalAttrs.passthru.sources."mrpt_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs ros-environment rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs ros-environment rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-cppcheck ament-cpplint ament-lint-auto ament-lint-cmake ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_msgs" = substituteSource {
      src = fetchgit {
        name = "mrpt_msgs-source";
        url = "https://github.com/ros2-gbp/mrpt_msgs-release.git";
        rev = "1ef78f3ce2180d63f3483f281db20036a85e2d94";
        hash = "sha256-mOYK6EcRqVfjMHnhz6SQ8PgDwMba0f/X6/mTXn3W718=";
      };
    };
  });
  meta = {
    description = "ROS messages for MRPT classes and objects";
  };
})
