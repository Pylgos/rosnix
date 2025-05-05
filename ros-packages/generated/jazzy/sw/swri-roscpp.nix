{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  marti-common-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosidl-cmake,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "swri_roscpp";
  version = "3.7.4-1";
  src = finalAttrs.passthru.sources."swri_roscpp";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ diagnostic-updater marti-common-msgs nav-msgs rclcpp ros-environment rosidl-cmake rosidl-default-runtime std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ diagnostic-updater marti-common-msgs nav-msgs rclcpp ros-environment rosidl-cmake rosidl-default-runtime std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "swri_roscpp" = substituteSource {
      src = fetchgit {
        name = "swri_roscpp-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "b74aaa83fcf9fb6f2fb504c5dbc58d9bf5eef8cf";
        hash = "sha256-4bkXCi/uQBCYih2MGrUVX1IW338lBKEgLG3UJbWbXjo=";
      };
    };
  });
  meta = {
    description = "\n    A package that extends rclcpp with some commonly used functionality to reduce boilerplate code.\n  ";
  };
})
