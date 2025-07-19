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
  pname = "nao_lola_sensor_msgs";
  version = "1.3.0-2";
  src = finalAttrs.passthru.sources."nao_lola_sensor_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nao_lola_sensor_msgs" = substituteSource {
      src = fetchgit {
        name = "nao_lola_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/nao_lola-release.git";
        rev = "256e50add2f0c1d7c307a35ae01eabe95e5057e6";
        hash = "sha256-I+mOw69Qd5OqCcNdvjpOn3LGw/W/7hPl71P0sgF+42k=";
      };
    };
  });
  meta = {
    description = "Package defining sensor msgs to be received from NAO robot.";
  };
})
