{
  ament-cmake,
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
  pname = "stereo_msgs";
  version = "5.3.6-1";
  src = finalAttrs.passthru.sources."stereo_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "stereo_msgs" = substituteSource {
      src = fetchgit {
        name = "stereo_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "10de156a278862ab974affa599e93fbb19bd5ef4";
        hash = "sha256-qBed0XvL+2QXQlUBJXbk1DGMxWLmem23SV1fZoVBTA4=";
      };
    };
  });
  meta = {
    description = "A package containing some stereo camera related message definitions.";
  };
})
