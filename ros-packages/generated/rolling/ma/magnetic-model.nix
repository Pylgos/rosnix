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
  version = "3.0.3-1";
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
        rev = "b5b81992861684befe9db3485a8b740e335f16ef";
        hash = "sha256-deReR7sRvQ3YBv0UGz0V9Ka5t/fGapAH72W19eqV9Lc=";
      };
    };
  });
  meta = {
    description = "World Magnetic Model ROS API.";
  };
})
