{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-coding,
  etsi-its-conversion,
  etsi-its-msgs,
  etsi-its-msgs-utils,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_messages";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_messages";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-coding etsi-its-conversion etsi-its-msgs etsi-its-msgs-utils ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-coding etsi-its-conversion etsi-its-msgs etsi-its-msgs-utils ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_messages" = substituteSource {
      src = fetchgit {
        name = "etsi_its_messages-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "abd4375f3535f65a2938942332ea41f2d742829c";
        hash = "sha256-odczHQhtGY1U+vIQWVyS3bMpAx6RwdD++GgMYYS1QO8=";
      };
    };
  });
  meta = {
    description = "ROS support for ETSI ITS messages";
  };
})
