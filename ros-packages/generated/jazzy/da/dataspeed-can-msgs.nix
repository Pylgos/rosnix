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
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."dataspeed_can_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_can_msgs" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_msgs-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "813295ba4c130401c982a60ca3ae833f09c19574";
        hash = "sha256-8QGJsXI1z8efys9ddy0nitdfNWQR1djGhG+XBQHMqBo=";
      };
    };
  });
  meta = {
    description = "Controller Area Network (CAN) messages";
  };
})
