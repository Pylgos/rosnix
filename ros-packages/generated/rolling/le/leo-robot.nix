{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo,
  leo-bringup,
  leo-fw,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_robot";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."leo_robot";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ leo leo-bringup leo-fw ];
  passthru = {
    sources = mkSourceSet (sources: {
      "leo_robot" = substituteSource {
        src = fetchgit {
          name = "leo_robot-source";
          url = "https://github.com/ros2-gbp/leo_robot-release.git";
          rev = "e1c3a45ed7361442793269ed0483a7fde9376d37";
          hash = "sha256-JcxBJPkbijaYWriR5InIZU+gMtzZaoTf9pKJhyEe3wo=";
        };
      };
    });
  };
  meta = {
    description = "Metapackage of software to install on Leo Rover.";
  };
})
