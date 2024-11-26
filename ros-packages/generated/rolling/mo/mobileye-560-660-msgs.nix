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
  pname = "mobileye_560_660_msgs";
  version = "4.0.0-3";
  src = finalAttrs.passthru.sources."mobileye_560_660_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mobileye_560_660_msgs" = substituteSource {
        src = fetchgit {
          name = "mobileye_560_660_msgs-source";
          url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
          rev = "59798e15c2258f70dd4c21841b821673ad6a47b2";
          hash = "sha256-VUBlCZa6YHrHj0N2L4MPJZXOD74+Uu4leG3oXg1ZOJg=";
        };
      };
    });
  };
  meta = {
    description = "Message definitions for the Mobileye 560/660";
  };
})
