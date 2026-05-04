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
  version = "4.0.0-2";
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
        rev = "d8d3214d261e952bcd6d7ad9c2096f325a17e153";
        hash = "sha256-ex1wxgGDenPKcsKm7dSWmLLRPlWz2tvbPOy6qRhKXGw=";
      };
    };
  });
  meta = {
    description = "Messages for the reservation and queueing system";
  };
})
