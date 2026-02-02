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
  version = "2.6.3-1";
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
        rev = "f2b83ae7f52bb28745a48e277315f07085a612c1";
        hash = "sha256-e5qZFz8TGZE0qfP8r17+izS4l9qRhvpt6PNH+eI/mJc=";
      };
    };
  });
  meta = {
    description = "A package containing orbbec camera messages definitions.";
  };
})
