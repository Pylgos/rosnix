{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  mkSourceSet,
  rcl-interfaces,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mavros_msgs";
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."mavros_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geographic-msgs geometry-msgs rcl-interfaces rosidl-default-runtime sensor-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geographic-msgs geometry-msgs rcl-interfaces rosidl-default-runtime sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mavros_msgs" = substituteSource {
      src = fetchgit {
        name = "mavros_msgs-source";
        url = "https://github.com/ros2-gbp/mavros-release.git";
        rev = "3cc36a7da8c128a24e9e0f244eeb883235731aa0";
        hash = "sha256-DBxmQ17R3pTJMm9DMr+Ibgs65fMTcEZjahp4JPIhTCY=";
      };
    };
  });
  meta = {
    description = "\n    mavros_msgs defines messages for ";
  };
})
