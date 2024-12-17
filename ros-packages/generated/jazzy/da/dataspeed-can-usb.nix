{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  can-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  lusb,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dataspeed_can_usb";
  version = "2.0.5-1";
  src = finalAttrs.passthru.sources."dataspeed_can_usb";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs lusb rclcpp rclcpp-components std-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_can_usb" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_usb-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "1d4d74fe03c3cd1ec29a88523f8192189b3abd16";
        hash = "sha256-pfh1FRdxr8yDFLiPmPumfdc1jpsL09jAG0FX6hIBwiM=";
      };
    };
  });
  meta = {
    description = "Driver to interface with the Dataspeed Inc. USB CAN Tool";
  };
})
