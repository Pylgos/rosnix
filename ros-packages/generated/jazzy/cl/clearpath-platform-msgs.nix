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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."clearpath_platform_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_platform_msgs" = substituteSource {
      src = fetchgit {
        name = "clearpath_platform_msgs-source";
        url = "https://github.com/clearpath-gbp/clearpath_msgs-release.git";
        rev = "65dc741ec6dbed83b222001fc39ee7233bbc9495";
        hash = "sha256-ZpR+JBFbBWH415LPvHnxH2B2Bm09CmDBuwX10Cmx9V8=";
      };
    };
  });
  meta = {
    description = "Messages for Clearpath Platforms.";
  };
})
