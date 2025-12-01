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
  version = "4.0.1-1";
  src = finalAttrs.passthru.sources."yasmin_factory";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ class-loader pluginlib rclcpp tinyxml2-vendor yasmin yasmin-viewer ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pybind11-dev" "python3" "python3-lxml" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ class-loader pluginlib rclcpp tinyxml2-vendor yasmin yasmin-viewer ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" "python3" "python3-lxml" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "yasmin_factory" = substituteSource {
      src = fetchgit {
        name = "yasmin_factory-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "e537701f6a8adfdde45e650a40a498239acc203c";
        hash = "sha256-TuXajnjNwLAYfEvo/UqjOtOmqM0oLDtHMqG8srkmrCg=";
      };
    };
  });
  meta = {
    description = "YASMIN factory to create FSMs from XML files";
  };
})
