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
  version = "3.7.5-1";
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
        rev = "34ac97c96a2d86fa712f54a26974083c511add8f";
        hash = "sha256-6Zbva6136tddnBZKHSU5tB4JsIgKF2T5IrtUpmKaDYY=";
      };
    };
  });
  meta = {
    description = "\n    A package that extends rclcpp with some commonly used functionality to reduce boilerplate code.\n  ";
  };
})
