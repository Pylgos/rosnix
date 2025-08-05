{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rc-common-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  shape-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rc_reason_msgs";
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."rc_reason_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rc-common-msgs rosidl-default-runtime shape-msgs std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rc-common-msgs rosidl-default-runtime shape-msgs std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rc_reason_msgs" = substituteSource {
      src = fetchgit {
        name = "rc_reason_msgs-source";
        url = "https://github.com/ros2-gbp/rc_reason_clients-release.git";
        rev = "48ba59208674fc0ab03d26685589798fdc00949d";
        hash = "sha256-Jr9heGRmkFOqX4qHLnDIhEqn48qOz1hj67J2GPJ+EIo=";
      };
    };
  });
  meta = {
    description = "Msg and srv definitions for rc_reason_clients";
  };
})
