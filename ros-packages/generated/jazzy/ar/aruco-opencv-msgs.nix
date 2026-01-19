{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-lint-auto,
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
  pname = "aruco_opencv_msgs";
  version = "6.1.1-1";
  src = finalAttrs.passthru.sources."aruco_opencv_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-lint-cmake ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "aruco_opencv_msgs" = substituteSource {
      src = fetchgit {
        name = "aruco_opencv_msgs-source";
        url = "https://github.com/ros2-gbp/aruco_opencv-release.git";
        rev = "0a6b739bff532c8697789a2e38656dee7bf42ec7";
        hash = "sha256-iOFCZKj5qbZCYYkPZ9IbeFkxxNHC0uIRAZpaIFbWj0E=";
      };
    };
  });
  meta = {
    description = "\n    Message definitions for aruco_opencv package.\n  ";
  };
})
