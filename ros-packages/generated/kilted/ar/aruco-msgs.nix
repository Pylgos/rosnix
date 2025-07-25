{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "aruco_msgs";
  version = "5.0.5-2";
  src = finalAttrs.passthru.sources."aruco_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "aruco_msgs" = substituteSource {
      src = fetchgit {
        name = "aruco_msgs-source";
        url = "https://github.com/ros2-gbp/aruco_ros-release.git";
        rev = "c3f5ebd35ba65ce0c355e0608d9675f82da6c658";
        hash = "sha256-EUZsF13naoL/xNnzsHHJmDuodN/Bb15EI1Pc+ZV2bHk=";
      };
    };
  });
  meta = {
    description = "The aruco_msgs package";
  };
})
