{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kartech_linear_actuator_msgs";
  version = "4.0.0-4";
  src = finalAttrs.passthru.sources."kartech_linear_actuator_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "kartech_linear_actuator_msgs" = substituteSource {
      src = fetchgit {
        name = "kartech_linear_actuator_msgs-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "ff9619e827b54c47fa7510043858db7b8a01d211";
        hash = "sha256-Xad77u1Iv7LJdsdK8vW1H475ls/kjnSvZbln4wUXpmQ=";
      };
    };
  });
  meta = {
    description = "The kartech_linear_actuator_msgs package";
  };
})
