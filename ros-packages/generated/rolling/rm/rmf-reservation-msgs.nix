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
  version = "3.4.1-1";
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
        rev = "0ca9370d2bb5fd768f8b491e40a14e561c471954";
        hash = "sha256-/O0MwSnrlkun1TtwUvFfNHl+2NIMW2bCG81UMVhaEvo=";
      };
    };
  });
  meta = {
    description = "Messages for the reservation and queueing system";
  };
})
