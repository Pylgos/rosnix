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
  version = "2.0.6-1";
  src = finalAttrs.passthru.sources."dataspeed_can_usb";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs lusb rclcpp rclcpp-components std-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_can_usb" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_usb-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "6ab594a42b83962cb70c4c7cb97d7f45ada2641c";
        hash = "sha256-zQ3nGu2y+NBRlNiKL54ZDtoMN2C+tlebM9L5Zqbmg6Q=";
      };
    };
  });
  meta = {
    description = "Driver to interface with the Dataspeed Inc. USB CAN Tool";
  };
})
