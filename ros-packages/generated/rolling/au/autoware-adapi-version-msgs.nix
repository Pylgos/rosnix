{
  ament-cmake-auto,
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
  pname = "autoware_adapi_version_msgs";
  version = "1.9.1-1";
  src = finalAttrs.passthru.sources."autoware_adapi_version_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_adapi_version_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_adapi_version_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_adapi_msgs-release.git";
        rev = "bd0702eb138ab46f74ef6cd1c351b2c0ffcdfa36";
        hash = "sha256-TlmyypekwmlsqbY9BDoATEjj0S2MJKiG0F5bkmR6q1U=";
      };
    };
  });
  meta = {
    description = "The Autoware AD API version interfaces";
  };
})
