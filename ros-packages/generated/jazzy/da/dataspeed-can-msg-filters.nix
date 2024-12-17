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
  version = "2.0.5-1";
  src = finalAttrs.passthru.sources."dataspeed_can_msg_filters";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs rclcpp ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_can_msg_filters" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_msg_filters-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "873e97d66c89550da6963c62279f1945cfefb422";
        hash = "sha256-dniVGoPoFMbQ4wvrnZb/57xBjoIJyssIjPi69emJN6Q=";
      };
    };
  });
  meta = {
    description = "Time synchronize multiple CAN messages to get a single callback";
  };
})
