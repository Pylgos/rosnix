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
  pname = "agnocast_sample_interfaces";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."agnocast_sample_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "agnocast_sample_interfaces" = substituteSource {
      src = fetchgit {
        name = "agnocast_sample_interfaces-source";
        url = "https://github.com/ros2-gbp/agnocast-release.git";
        rev = "afd0686ee65992e6572afd6da6048a5c4d64f237";
        hash = "sha256-ykgpV2kp5xH0WiI+2ZIeX1xMEQWBKPa/RDH9OtDFToI=";
      };
    };
  });
  meta = {
    description = "\n    Sample interfaces for the Agnocast sample application.\n  ";
  };
})
