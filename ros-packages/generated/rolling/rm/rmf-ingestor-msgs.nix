{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-dispenser-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_ingestor_msgs";
  version = "4.0.0-1";
  src = finalAttrs.passthru.sources."rmf_ingestor_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rmf-dispenser-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rmf-dispenser-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_ingestor_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_ingestor_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "e331dcfa83772ecd5f3a72ed152dc98a66913f5c";
        hash = "sha256-jM/NUq7+9LalTjZaIUrgVe0wXVThJK5BxBTM/wq+l1M=";
      };
    };
  });
  meta = {
    description = "A package containing messages used to interface to ingestor workcells";
  };
})
