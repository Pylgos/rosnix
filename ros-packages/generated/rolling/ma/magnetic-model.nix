{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  angles,
  buildAmentCmakePackage,
  cras-cpp-common,
  cras-lint,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "magnetic_model";
  version = "3.0.2-2";
  src = finalAttrs.passthru.sources."magnetic_model";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedNativeBuildInputs = [ angles cras-cpp-common geometry-msgs rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "geographiclib" ]; };
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ angles cras-cpp-common geometry-msgs rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" ]; };
  checkInputs = [ ament-cmake-gtest cras-lint ];
  passthru.sources = mkSourceSet (sources: {
    "magnetic_model" = substituteSource {
      src = fetchgit {
        name = "magnetic_model-source";
        url = "https://github.com/ros2-gbp/compass-release.git";
        rev = "232349c18451971766ec5a8af2a4cacd4e9a00a1";
        hash = "sha256-gviZStzN1H+f+f+PJEn/o6qrCiMgSEJxxEb2do6CWz0=";
      };
    };
  });
  meta = {
    description = "World Magnetic Model ROS API.";
  };
})
