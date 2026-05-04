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
  version = "3.26.42-1";
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
        rev = "598f9219f3f8aed8890add22578fc13cbfcd97c3";
        hash = "sha256-JLpxRSn5ZDaGpcQZTZREW4ZLMm0Hau51KeLFZv4SiEM=";
      };
    };
  });
  meta = {
    description = "QML-based robotics visualization and control tool for ROS 2.";
  };
})
