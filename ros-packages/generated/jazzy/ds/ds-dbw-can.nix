{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  can-msgs,
  dataspeed-can-msg-filters,
  dataspeed-can-usb,
  ds-dbw-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ds_dbw_can";
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."ds_dbw_can";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs dataspeed-can-msg-filters dataspeed-can-usb ds-dbw-msgs rclcpp rclcpp-components sensor-msgs std-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "ds_dbw_can" = substituteSource {
      src = fetchgit {
        name = "ds_dbw_can-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "b737274010b3e532288e5dc2bbab168dc3b6604d";
        hash = "sha256-HhIYz3n6ck8alCwPdg0UCfe5zXCgmF/twyGQGvKLihM=";
      };
    };
  });
  meta = {
    description = "Interface to the Dataspeed Inc. Drive-By-Wire kit";
  };
})
