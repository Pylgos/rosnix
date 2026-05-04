{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rqml-core,
  rqml-default-plugins,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rqml";
  version = "3.26.42-2";
  src = finalAttrs.passthru.sources."rqml";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rqml-core rqml-default-plugins ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rqml-core rqml-default-plugins ];
  passthru.sources = mkSourceSet (sources: {
    "rqml" = substituteSource {
      src = fetchgit {
        name = "rqml-source";
        url = "https://github.com/ros2-gbp/rqml-release.git";
        rev = "fdd52a5e21db56c49b02d4f6a899665aa541b441";
        hash = "sha256-JLpxRSn5ZDaGpcQZTZREW4ZLMm0Hau51KeLFZv4SiEM=";
      };
    };
  });
  meta = {
    description = "QML-based robotics visualization and control tool for ROS 2.";
  };
})
