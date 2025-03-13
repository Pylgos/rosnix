{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  can-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dataspeed_can_msg_filters";
  version = "2.0.6-1";
  src = finalAttrs.passthru.sources."dataspeed_can_msg_filters";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs rclcpp ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_can_msg_filters" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_msg_filters-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "b6416ce1d876b3cc7d5a280e67c1f6fa2e7d25c5";
        hash = "sha256-NZ7hmo13d9Y3oIZKVNx1mvNR1t2xlig7085/Lr2k+HI=";
      };
    };
  });
  meta = {
    description = "Time synchronize multiple CAN messages to get a single callback";
  };
})
