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
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "orbbec_camera_msgs";
  version = "1.5.14-1";
  src = finalAttrs.passthru.sources."orbbec_camera_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "orbbec_camera_msgs" = substituteSource {
      src = fetchgit {
        name = "orbbec_camera_msgs-source";
        url = "https://github.com/orbbec/orbbec_camera_v1-release.git";
        rev = "e932e21023053137e45c9dea4db96765517d9277";
        hash = "sha256-itAS8XIME7XBsNGjHBBZy3f7ODGByw0igdkuqRPLmyM=";
      };
    };
  });
  meta = {
    description = "A package containing orbbec camera messages definitions.";
  };
})
