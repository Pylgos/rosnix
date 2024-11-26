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
  version = "5.3.5-1";
  src = finalAttrs.passthru.sources."stereo_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "stereo_msgs" = substituteSource {
        src = fetchgit {
          name = "stereo_msgs-source";
          url = "https://github.com/ros2-gbp/common_interfaces-release.git";
          rev = "ac381a89e37baac54f65169fb5eadfb197b5788f";
          hash = "sha256-pslCBNIHA/ok2N2kdjY3FQeLs6/snomzRWKXWnE/iTc=";
        };
      };
    });
  };
  meta = {
    description = "A package containing some stereo camera related message definitions.";
  };
})
