{
  action-msgs,
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_motor_msgs";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."clearpath_motor_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_motor_msgs" = substituteSource {
      src = fetchgit {
        name = "clearpath_motor_msgs-source";
        url = "https://github.com/clearpath-gbp/clearpath_msgs-release.git";
        rev = "95e32d3f0435558c0707644fded811a93b8eaa74";
        hash = "sha256-MxZjNQaAyqVLwSM0L+0vmnRKS044cyTtq+CRV5nUYQo=";
      };
    };
  });
  meta = {
    description = "Messages for Clearpath Motor Drivers.";
  };
})
