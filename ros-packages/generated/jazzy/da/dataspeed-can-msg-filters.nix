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
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."dataspeed_can_msg_filters";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs rclcpp ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_can_msg_filters" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_msg_filters-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "71d4b786b6be88a3dadbf1f82472610c1eb7b910";
        hash = "sha256-b13Q1VZE/i+3zczFz59cp2UEbtBBLn81/hOsuARwwws=";
      };
    };
  });
  meta = {
    description = "Time synchronize multiple CAN messages to get a single callback";
  };
})
