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
  version = "6.1.2-1";
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
        rev = "9469779645a64a1b12cf35845d3c95d2cf26dd31";
        hash = "sha256-6DOu+5xqUlr3YYzSGtioQUFfAJs9D5ovTWQ50Vj/ubs=";
      };
    };
  });
  meta = {
    description = "\n    Message definitions for aruco_opencv package.\n  ";
  };
})
