{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nao_sensor_msgs";
  version = "1.0.0-2";
  src = finalAttrs.passthru.sources."nao_sensor_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "nao_sensor_msgs" = substituteSource {
        src = fetchgit {
          name = "nao_sensor_msgs-source";
          url = "https://github.com/ros2-gbp/nao_interfaces-release.git";
          rev = "74dded0e1662ddd1fdfe95359a2066528032731d";
          hash = "sha256-z8HBYfJ4SH1kbToGsf6tHPccjImandiilK9gxOLUF90=";
        };
      };
    });
  };
  meta = {
    description = "Package defining sensor msgs to be received from NAO robot.";
  };
})
