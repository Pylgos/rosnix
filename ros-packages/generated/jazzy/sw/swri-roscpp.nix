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
  version = "3.8.5-1";
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
        rev = "ff2b0dc4ff7e7b9e3eed450a762e9ba79e80008a";
        hash = "sha256-0nYj/SpqMxis5CI1Qb+UfujHqjqtX+b4Vo4LEPxopvM=";
      };
    };
  });
  meta = {
    description = "\n    A package that extends rclcpp with some commonly used functionality to reduce boilerplate code.\n  ";
  };
})
