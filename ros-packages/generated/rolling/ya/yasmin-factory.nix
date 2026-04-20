{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-index-cpp,
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
  version = "5.0.0-1";
  src = finalAttrs.passthru.sources."yasmin_factory";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-index-cpp class-loader pluginlib rclcpp tinyxml2-vendor yasmin yasmin-viewer ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pybind11-dev" "python3" "python3-dev" "python3-lxml" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-index-cpp class-loader pluginlib rclcpp tinyxml2-vendor yasmin yasmin-viewer ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" "python3" "python3-dev" "python3-lxml" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "yasmin_factory" = substituteSource {
      src = fetchgit {
        name = "yasmin_factory-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "8f1614384f802d455aba092b6831425b4da02495";
        hash = "sha256-obBuyv6hE8yZRSN9xyK0XP+4dBNa6NoBuAxYyI9f25I=";
      };
    };
  });
  meta = {
    description = "YASMIN factory to create FSMs from XML files";
  };
})
