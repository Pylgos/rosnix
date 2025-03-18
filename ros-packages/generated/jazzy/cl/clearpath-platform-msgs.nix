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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."clearpath_platform_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_platform_msgs" = substituteSource {
      src = fetchgit {
        name = "clearpath_platform_msgs-source";
        url = "https://github.com/clearpath-gbp/clearpath_msgs-release.git";
        rev = "886053736d39a7c89adaa38f56c964e855b11258";
        hash = "sha256-2y3D7Ix421KeXy3EHiqQKnfkAIwz1vsr3m+3nP0mBh8=";
      };
    };
  });
  meta = {
    description = "Messages for Clearpath Platforms.";
  };
})
