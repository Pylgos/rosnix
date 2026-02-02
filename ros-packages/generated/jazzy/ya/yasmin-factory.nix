{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  buildAmentCmakePackage,
  class-loader,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tinyxml2-vendor,
  yasmin,
  yasmin-viewer,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin_factory";
  version = "4.2.4-1";
  src = finalAttrs.passthru.sources."yasmin_factory";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ class-loader pluginlib rclcpp tinyxml2-vendor yasmin yasmin-viewer ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pybind11-dev" "python3" "python3-dev" "python3-lxml" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ class-loader pluginlib rclcpp tinyxml2-vendor yasmin yasmin-viewer ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" "python3" "python3-dev" "python3-lxml" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "yasmin_factory" = substituteSource {
      src = fetchgit {
        name = "yasmin_factory-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "72c1b1a355e3583e6fca175cfd667bf7bffeff2f";
        hash = "sha256-kIAL0F3SMLVssz1zif7xVRWY6S2m/FDVuJLv+askc3A=";
      };
    };
  });
  meta = {
    description = "YASMIN factory to create FSMs from XML files";
  };
})
