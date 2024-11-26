{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  can-msgs,
  dataspeed-can-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosbag2-cpp,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dataspeed_can_tools";
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."dataspeed_can_tools";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs dataspeed-can-msgs rclcpp rosbag2-cpp std-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_can_tools" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_tools-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "37d4b1513e0e6b64b929f7f999d68c50f666646d";
        hash = "sha256-iOy4XcA419agySKLFUkW4yjGx9G+qhdkC0FlWsPFYc8=";
      };
    };
  });
  meta = {
    description = "CAN bus introspection";
  };
})
