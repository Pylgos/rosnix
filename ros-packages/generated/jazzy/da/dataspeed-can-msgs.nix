{
  ament-cmake,
  buildAmentCmakePackage,
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
  pname = "dataspeed_can_msgs";
  version = "2.0.6-1";
  src = finalAttrs.passthru.sources."dataspeed_can_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_can_msgs" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_msgs-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "3f57483b49f030eedc3864c46fa0c84f4d62ef2f";
        hash = "sha256-ynnMWI2aSBJgwmv9dNkgLmHkpUfy1YTD8Q7+kUqrAnI=";
      };
    };
  });
  meta = {
    description = "Controller Area Network (CAN) messages";
  };
})
