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
  version = "0.4.0-3";
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
        rev = "34e7f8a1296ffea66839b60f8b7f36a5e54a1e14";
        hash = "sha256-P8ovKBUpAcX6Vgdu5eENt0kWdRw73g5+UuFDNlhsJxY=";
      };
    };
  });
  meta = {
    description = "Msg and srv definitions for rc_reason_clients";
  };
})
