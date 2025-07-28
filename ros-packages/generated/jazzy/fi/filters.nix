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
  version = "2.2.2-1";
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
        rev = "e2b22c58148b8140819ae6309c7cef505a22f009";
        hash = "sha256-IRCIVJdezG8UAAVMiTQ5QntNmJZGCBNbp3D2ybLFG3U=";
      };
    };
  });
  meta = {
    description = "\n    This library provides a standardized interface for processing data as a sequence\n    of filters.  This package contains a base class upon which to build specific implementations\n    as well as an interface which dynamically loads filters based on runtime parameters.\n  ";
  };
})
