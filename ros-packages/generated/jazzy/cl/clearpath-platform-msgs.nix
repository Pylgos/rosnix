{
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
  pname = "clearpath_platform_msgs";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."clearpath_platform_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_platform_msgs" = substituteSource {
      src = fetchgit {
        name = "clearpath_platform_msgs-source";
        url = "https://github.com/clearpath-gbp/clearpath_msgs-release.git";
        rev = "d9c73f4f2e66235707933709ef2a7d936c0a3f94";
        hash = "sha256-UbB1aVxLlKpQ+xpV82ulEh3V82YsdBdilleSOSO8Pr8=";
      };
    };
  });
  meta = {
    description = "Messages for Clearpath Platforms.";
  };
})
