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
  propagatedNativeBuildInputs = [ pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-gtest ament-cmake-uncrustify ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "filters" = substituteSource {
      src = fetchgit {
        name = "filters-source";
        url = "https://github.com/ros2-gbp/filters-release.git";
        rev = "274f585f7969512b6e6960f4f82419c711f94b44";
        hash = "sha256-XM2sLQ/1SukSvA+4SmC34GP9u5mr61R3+yiwJOwOoBY=";
      };
    };
  });
  meta = {
    description = "\n    This library provides a standardized interface for processing data as a sequence\n    of filters.  This package contains a base class upon which to build specific implementations\n    as well as an interface which dynamically loads filters based on runtime parameters.\n  ";
  };
})
