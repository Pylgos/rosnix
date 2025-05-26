{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ardrone_sdk";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."ardrone_sdk";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ardrone_sdk" = substituteSource {
      src = fetchgit {
        name = "ardrone_sdk-source";
        url = "https://github.com/ros2-gbp/ardrone_ros-release.git";
        rev = "74a7de9f6e7d5c84448bc68fdf1eb027b56bc361";
        hash = "sha256-KIdw4cNcKpqwLjSY8nySDwv7r5ycqm5rnzoO/qjawW0=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/vtalpaert/ardrone-sdk-native/releases/download/arsdk-native-samples-x64-master/arsdk-native-samples-x64-master.tar.gz";
          to = "URL ${sources."ardrone_sdk/arsdk-native-samples-x64-master"}";
        }
      ];
    };
    "ardrone_sdk/arsdk-native-samples-x64-master" = substituteSource {
      src = fetchzip {
        name = "arsdk-native-samples-x64-master-source";
        url = "https://github.com/vtalpaert/ardrone-sdk-native/releases/download/arsdk-native-samples-x64-master/arsdk-native-samples-x64-master.tar.gz";
        hash = "sha256-S0T5v1LSPmB1txGv0J6leMJgwtduJgcrdAee7Her/6s=";
      };
    };
  });
  meta = {
    description = "Exports ARSDK3 as a library";
  };
})
