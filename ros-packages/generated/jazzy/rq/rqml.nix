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
  version = "3.26.41-1";
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
        rev = "4fd6d7d3bbd73a40d691466446810e8647aa97e4";
        hash = "sha256-LcFr1QZ8VYdbEbFl9nB7MqqOn95RSWUg1OiPr97WrYY=";
      };
    };
  });
  meta = {
    description = "QML-based robotics visualization and control tool for ROS 2.";
  };
})
