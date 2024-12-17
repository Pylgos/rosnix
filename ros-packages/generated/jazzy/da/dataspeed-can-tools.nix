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
  version = "2.0.5-1";
  src = finalAttrs.passthru.sources."dataspeed_can_tools";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs dataspeed-can-msgs rclcpp rosbag2-cpp std-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_can_tools" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_tools-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "181f37093cb0a7a564ed4382a1d7144da09a5d9b";
        hash = "sha256-FXcHmzFNmiNYNOzQSxdc5QTMZ5HCb/G2R+chgBOedLo=";
      };
    };
  });
  meta = {
    description = "CAN bus introspection";
  };
})
