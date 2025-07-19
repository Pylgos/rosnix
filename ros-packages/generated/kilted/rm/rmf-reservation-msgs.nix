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
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_reservation_msgs";
  version = "3.5.0-1";
  src = finalAttrs.passthru.sources."rmf_reservation_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_reservation_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_reservation_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "410f618d4346ad748ff1b88de2a618464e0cdb79";
        hash = "sha256-sZ5bLAk4ieaTpG5rfXEUu4goCVPDiwXH9Ef+pDvGEDo=";
      };
    };
  });
  meta = {
    description = "Messages for the reservation and queueing system";
  };
})
