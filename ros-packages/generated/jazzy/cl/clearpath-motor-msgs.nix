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
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."clearpath_motor_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_motor_msgs" = substituteSource {
      src = fetchgit {
        name = "clearpath_motor_msgs-source";
        url = "https://github.com/clearpath-gbp/clearpath_msgs-release.git";
        rev = "e5cc9d4eb9644087d1b3b0a9c08c22713a4f0889";
        hash = "sha256-ET6hoXYaJDPbEVVKxhCCJkhYoJj7wK844ml4UdVcRcw=";
      };
    };
  });
  meta = {
    description = "Messages for Clearpath Motor Drivers.";
  };
})
