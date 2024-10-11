{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  yaml-cpp-vendor,
}:
let
  sources = mkSourceSet (sources: {
    "camera_calibration_parsers" = substituteSource {
      src = fetchgit {
        name = "camera_calibration_parsers-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "bc975b787c5444e7da15d82c3c7c9345e794f93f";
        hash = "sha256-8oy/BG6RKQZTnu5T2O3NkY5QZOc0d0U8hdW4tFww6is=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "camera_calibration_parsers";
  version = "6.0.1-1";
  src = finalAttrs.passthru.sources."camera_calibration_parsers";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp sensor-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "camera_calibration_parsers contains routines for reading and writing camera calibration parameters.";
  };
})
