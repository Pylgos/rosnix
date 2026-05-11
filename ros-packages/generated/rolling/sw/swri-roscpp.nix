{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  diagnostic-msgs,
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
  version = "3.8.9-1";
  src = finalAttrs.passthru.sources."swri_roscpp";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ diagnostic-msgs diagnostic-updater marti-common-msgs nav-msgs rclcpp ros-environment rosidl-cmake rosidl-default-runtime std-msgs std-srvs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater marti-common-msgs nav-msgs rclcpp ros-environment rosidl-cmake rosidl-default-runtime std-msgs std-srvs ];
  checkInputs = [ ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "swri_roscpp" = substituteSource {
      src = fetchgit {
        name = "swri_roscpp-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "a03f9c45010a9a9e1d614470b8787d4a1e94db40";
        hash = "sha256-WacEI9arHTRQsxORQ/CWrMvSiEyJnpq/tYkqSAc0I7A=";
      };
    };
  });
  meta = {
    description = "\n    A package that extends rclcpp with some commonly used functionality to reduce boilerplate code.\n  ";
  };
})
