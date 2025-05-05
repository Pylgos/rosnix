{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-gtest,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "filters";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."filters";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ pluginlib ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-gtest ament-cmake-uncrustify ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "filters" = substituteSource {
      src = fetchgit {
        name = "filters-source";
        url = "https://github.com/ros2-gbp/filters-release.git";
        rev = "2ced0a9535bd5f943e391bbfc6e6473109d7f212";
        hash = "sha256-XM2sLQ/1SukSvA+4SmC34GP9u5mr61R3+yiwJOwOoBY=";
      };
    };
  });
  meta = {
    description = "This library provides a standardized interface for processing data as a sequence of filters. This package contains a base class upon which to build specific implementations as well as an interface which dynamically loads filters based on runtime parameters.";
  };
})
