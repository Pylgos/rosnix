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
  version = "3.7.3-1";
  src = finalAttrs.passthru.sources."swri_roscpp";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-cmake ];
  propagatedBuildInputs = [ diagnostic-updater marti-common-msgs nav-msgs rclcpp rosidl-default-runtime std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "swri_roscpp" = substituteSource {
      src = fetchgit {
        name = "swri_roscpp-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "91f705878c525169595dcb44486fc504b5df25e1";
        hash = "sha256-qtBkcbUk+6HXrSLdLd15YZqN/5x48gCfTKi8EGSg2fw=";
      };
    };
  });
  meta = {
    description = "A package that extends rclcpp with some commonly used functionality to reduce boilerplate code.";
  };
})
