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
  version = "2.0.5-1";
  src = finalAttrs.passthru.sources."dataspeed_can_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_can_msgs" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_msgs-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "c1d5c35e2c72dda0d27167dd9c9d6e8dfd75b9ad";
        hash = "sha256-eZv5rxf30Xer5NoicY/U99cISFtMvFcopabYX6k5xQE=";
      };
    };
  });
  meta = {
    description = "Controller Area Network (CAN) messages";
  };
})
