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
  version = "2.2.2-1";
  src = finalAttrs.passthru.sources."clearpath_platform_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_platform_msgs" = substituteSource {
      src = fetchgit {
        name = "clearpath_platform_msgs-source";
        url = "https://github.com/clearpath-gbp/clearpath_msgs-release.git";
        rev = "a72e36f0e51bf1f3011a067137d3caf5cbb860d9";
        hash = "sha256-JsRHv/jqHxqQAelpHxTNdTMipyu4loKVNwKe08M6cGE=";
      };
    };
  });
  meta = {
    description = "Messages for Clearpath Platforms.";
  };
})
