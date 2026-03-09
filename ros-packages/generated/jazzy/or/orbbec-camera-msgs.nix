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
  version = "2.7.6-1";
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
        url = "https://github.com/orbbec/orbbec_camera_v2-release.git";
        rev = "2386bb4b9e30d07fd3d3a0668f309796608c3364";
        hash = "sha256-lh2pNtg3jWZor8W95l0RaFi29TIljDWhya90XqLpQ8k=";
      };
    };
  });
  meta = {
    description = "A package containing orbbec camera messages definitions.";
  };
})
