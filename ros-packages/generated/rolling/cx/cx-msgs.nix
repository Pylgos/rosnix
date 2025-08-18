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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_msgs";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."cx_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cx_msgs" = substituteSource {
      src = fetchgit {
        name = "cx_msgs-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "c32fd082fc1d544fc7e8aaab9fb671af0a61f295";
        hash = "sha256-pdVpeYCQVgtiMg2FYwUhYPUjllL+ylr6Z1TRDLx8s1E=";
      };
    };
  });
  meta = {
    description = "ROS interfaces for ROS2 CLIPS-Executive";
  };
})
