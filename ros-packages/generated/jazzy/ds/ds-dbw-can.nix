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
  version = "2.3.5-1";
  src = finalAttrs.passthru.sources."ds_dbw_can";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ can-msgs dataspeed-can-msg-filters dataspeed-can-usb ds-dbw-msgs rclcpp rclcpp-components sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs dataspeed-can-msg-filters dataspeed-can-usb ds-dbw-msgs rclcpp rclcpp-components sensor-msgs std-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "ds_dbw_can" = substituteSource {
      src = fetchgit {
        name = "ds_dbw_can-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "fc07a73e28413d5baabb19bd2be5a00e4abcfc21";
        hash = "sha256-0c146zJJvRojAiqDB1kRcHwV+Equz/Wox3TrEqfK+sc=";
      };
    };
  });
  meta = {
    description = "\n    Interface to the Dataspeed Inc. Drive-By-Wire kit\n  ";
  };
})
