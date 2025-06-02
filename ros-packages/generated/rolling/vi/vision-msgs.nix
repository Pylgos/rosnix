{
  ament-cmake,
  ament-cmake-gtest,
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
  pname = "vision_msgs";
  version = "4.2.0-1";
  src = finalAttrs.passthru.sources."vision_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "vision_msgs" = substituteSource {
      src = fetchgit {
        name = "vision_msgs-source";
        url = "https://github.com/ros2-gbp/vision_msgs-release.git";
        rev = "15a5af797cac0ffaf10ad3a6308c5544557e0eb1";
        hash = "sha256-enO/fIPjMWEyEzJHIyWJXW4xjHPuvb5A2+0HIT+troI=";
      };
    };
  });
  meta = {
    description = "\n    Messages for interfacing with various computer vision pipelines, such as\n    object detectors.\n  ";
  };
})
