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
  version = "2.1.2-2";
  src = finalAttrs.passthru.sources."filters";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-gtest ament-cmake-uncrustify ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "filters" = substituteSource {
      src = fetchgit {
        name = "filters-source";
        url = "https://github.com/ros2-gbp/filters-release.git";
        rev = "4453644af7cf5338d89bb7df64174695674d45c8";
        hash = "sha256-hz/dFfNO4Dl2v0luZbIJQrfAimC4iBuF7HtT0XInGgk=";
      };
    };
  });
  meta = {
    description = "This library provides a standardized interface for processing data as a sequence of filters. This package contains a base class upon which to build specific implementations as well as an interface which dynamically loads filters based on runtime parameters.";
  };
})
